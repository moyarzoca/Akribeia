import utils.evaluator as evaltor
import torch
import utils.grid.distributions as sample


def values_horizon(points_coord, conf, exact_functions, models_evaled=None):
    return {}


def values_infinity(points_coord, conf, exact_functions, models_evaled):
    C0 = models_evaled["C0"]
    W_inf = -C0 / 6
    return {"W": torch.ones_like(points_coord["x"]) * W_inf}


x_hor = torch.tensor([[0.0]], requires_grad=True)
x_inf = torch.tensor([[1.570708]], requires_grad=True)


def make_bdy_conds(bulk_points_coord):
    # Horizon (x_left) imposes no soft residual: W(0) is enforced structurally
    # by the W network's Dirichlet1D condition. Including it only triggered a
    # wasted full forward of all nets, so it is omitted. Re-add an "x_left"
    # entry here if a non-empty values_horizon is introduced.
    bdy_conds = {
        "x_right": {
            "points_coord": sample.build_subpoints_coord(bulk_points_coord, x=x_inf),
            "func": values_infinity,
            "weight": 1.0,
        }
    }
    return bdy_conds


def boundary_residuals(models, conf, exact_functions, bulk_points_coord):
    residuals = []
    bdy_conds = make_bdy_conds(bulk_points_coord)
    for bdy in bdy_conds.keys():
        points_coord = bdy_conds[bdy]["points_coord"]

        points = sample.coord_to_points(points_coord)
        models_evaled = evaltor.eval_models(models, points)

        bdy_func_evaled = bdy_conds[bdy]["func"](
            points_coord, conf, exact_functions, models_evaled
        )
        weight = bdy_conds[bdy]["weight"]
        for f in bdy_func_evaled.keys():
            residual = weight * (models_evaled[f] - bdy_func_evaled[f])
            residuals.append(residual)
    return torch.cat(residuals, dim=1)
