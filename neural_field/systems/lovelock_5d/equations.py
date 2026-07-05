from utils.trainer import ndiff as diff
import utils.evaluator as evaltor
import utils.loader as loader
import utils.grid.distributions as sample
import torch


def equations(models_evaled, points_coord, conf):
    x = points_coord["x"]
    rh = conf["rh"]
    alph = points_coord["alph"]
    C0 = models_evaled["C0"]

    F = models_evaled["F"]
    H = models_evaled["H"]
    B = models_evaled["B"]
    W = models_evaled["W"]
    # Derivatives must be taken w.r.t. the grad-carrying x (ndiff/create_graph).
    dF = diff(F, x, order=1)
    dW = diff(W, x, order=1)
    dB = diff(B, x, order=1)
    dH = diff(H, x, order=1)
    ddB = diff(B, x, order=2)
    ddH = diff(H, x, order=2)

    # The algebra is a huge elementwise polynomial; run it through a single
    # torch.compile'd kernel-fused function. Geometry (x) and the parametric
    # coefficient (alph) are detached: they carry no network-param gradient, so
    # keeping them out of the graph both fuses cleanly and shrinks the backward.
    Eq1, Eq2, Eq3, Eq4 = _evaluate_eqs(
        F,
        B,
        H,
        W,
        C0,
        dF,
        dW,
        dB,
        dH,
        ddB,
        ddH,
        x.detach(),
        alph.detach(),
        float(rh),
    )
    return {"equations": [Eq1, Eq2, Eq3, Eq4], "labels": ["eq1", "eq2", "eq3", "eq4"]}


@torch.compile
def _evaluate_eqs(F, B, H, W, C0, dF, dW, dB, dH, ddB, ddH, xd, alpha, rh):
    sinx = torch.sin(xd)
    cosx = torch.cos(xd)
    cosx2 = cosx**2
    cosx3 = cosx**3
    cosx4 = cosx**4
    cosx5 = cosx**5
    cosx6 = cosx**6
    cosx7 = cosx**7
    cosx8 = cosx**8
    cosx9 = cosx**9
    cosx10 = cosx**10
    sinx2 = sinx**2
    sinx3 = sinx**3
    sinx4 = sinx**4
    sinx5 = sinx**5
    sinx6 = sinx**6
    sinx7 = sinx**7
    sinx8 = sinx**8
    sinx9 = sinx**9
    sinx10 = sinx**10
    R = sinx + rh * cosx
    R2 = R**2
    R3 = R**3
    R4 = R**4
    R5 = R**5
    R6 = R**6
    R7 = R**7
    R8 = R**8
    R9 = R**9
    eps = 1e-8
    sqrtBQ = safe_sqrt(1 + B * cosx2, eps)
    sqrtFQ = safe_sqrt(1 + F * cosx2, eps)
    sqrtP = safe_sqrt(H * cosx4 + R2, eps) ** 3

    Eq1 = (
        (
            C0**2
            * (1 + B * cosx2)
            * cosx4
            * R5
            * (
                -3 * alpha * cosx6 * H
                + R4
                - 3 * alpha * cosx4 * F * R2 * sinx
                - alpha * cosx2 * R2 * (-1 + 3 * sinx)
            )
        )
        / (
            (cosx4 * H + R2)
            * (
                3 * alpha * cosx6 * H
                - R4
                + alpha * cosx2 * R2 * (-1 + sinx)
                + alpha * cosx4 * F * R2 * sinx
            )
            ** 2
        )
        + (1 + cosx2 * F)
        * (
            4 * alpha * cosx2 * (cosx4 * H + R2) ** 2
            + R3
            * (4 * alpha * cosx2 + R2 - 3 * alpha * cosx2 * (1 + cosx2 * F) * sinx)
            * (cosx5 * dH + 2 * R - 2 * cosx4 * H * sinx)
            + R
            * (cosx4 * H + R2)
            * (
                -3 * alpha * cosx7 * dH
                - 6 * alpha * cosx2 * R
                + 4 * R3
                + 6 * alpha * cosx6 * H * sinx
            )
        )
        * (1 + cosx * dB * sinx + B * (cosx2 - 2 * sinx2))
        + 4
        * (1 + B * cosx2)
        * R
        * (
            cosx6 * H**2
            + R3
            * (
                cosx3 * dH * sinx
                + F * (cosx5 * dH + 3 * R) * sinx
                - (3 * R) / (1 + sinx)
            )
            + cosx2
            * H
            * R2
            * (-2 + sinx - cosx2 * F * sinx * (-1 + 2 * R * sinx) - 2 * R * sinx2)
        )
    )
    Eq2 = (
        3 * alpha * cosx**16 * dH * F * H**2 * R2
        - 6 * dF * R9 * sinx
        - (C0**2 * cosx3 * R6)
        / (
            -3 * alpha * cosx6 * H
            + R4
            - alpha * cosx2 * R2 * (-1 + sinx)
            - alpha * cosx4 * F * R2 * sinx
        )
        + cosx**15
        * (
            -4 * alpha * F * H**3 * R
            + 3 * alpha * dH**2 * F * H * R2 * sinx
            - H**2
            * R
            * (
                -3 * alpha * dF * dH * R * sinx
                - 6 * alpha * F * (ddH - 2 * H) * R * sinx
                + 6 * alpha * F * H * R * sinx
            )
        )
        + 6
        * R8
        * (
            -rh
            + (cosx * (2 + sinx)) / (1 + sinx) ** 2
            + 2 * F * sinx * (-cosx + rh * sinx)
        )
        + cosx2
        * (
            2 * alpha * dF * R7 * sinx
            + 4 * dH * R7 * sinx
            - R2
            * (
                8 * alpha * dF * R5 * sinx
                + sinx
                * (-12 * dH * R6 * sinx + R4 * (4 * dH * R - 6 * alpha * dF * R * sinx))
            )
        )
        + cosx**14
        * (
            -4 * alpha * dF * H**3 * R * sinx
            - F
            * H
            * sinx
            * (-3 * alpha * dH * F * R4 + 12 * alpha * dH * H * R2 * sinx)
            - H**2
            * R
            * (
                F * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
                + 6 * alpha * dF * H * R * sinx2
                - 3 * alpha * dH * R * (1 - 2 * F * sinx2)
            )
        )
        + cosx**13
        * (
            -(alpha * dH**2 * F**2 * R4 * sinx2)
            - 4 * H**3 * (-6 * alpha * F * sinx + alpha * R * (1 - 2 * F * sinx2))
            - H**2
            * R
            * (
                6 * alpha * H * R * sinx * (1 - 2 * F * sinx2)
                + sinx
                * (
                    -6 * alpha * (ddH - 2 * H) * R
                    + F * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                )
            )
            - H
            * (
                -2 * alpha * F**2 * (ddH - 2 * H) * R4 * sinx2
                + sinx
                * (
                    -3 * alpha * dH**2 * R2
                    + F
                    * (
                        R4 * (-3 * alpha * dF * dH * sinx + 6 * alpha * F * H * sinx)
                        - 12 * alpha * H**2 * R2 * sinx2
                    )
                )
            )
        )
        + cosx
        * (
            -12 * H * R6 * sinx
            + R4
            * sinx
            * (
                -8 * H * R3 * sinx
                + 4 * R2 * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
            )
            - 4
            * (
                3 * H * R6
                + R6 * (-6 * alpha * F * sinx + alpha * R * (1 - 2 * F * sinx2))
            )
            + R
            * (
                -2 * H * R2 * (-16 * R3 + 4 * R3 * sinx)
                - R4
                * (
                    4 * F * R4
                    + 36 * alpha * F * R * sinx
                    - 6 * alpha * R2 * (1 - 2 * F * sinx2)
                )
            )
            - R2
            * (
                -8 * alpha * F * R4 * sinx2
                + 2 * R5 * (4 * alpha + F * R2 - 8 * alpha * F * sinx2)
                + sinx
                * (
                    4 * alpha * F * R4
                    + 12 * H * R6 * sinx2
                    + R4 * (-8 * H * R * sinx - 6 * alpha * R * (1 - 2 * F * sinx2))
                )
            )
        )
        + cosx9
        * (
            R4
            * sinx
            * (
                dH**2 * (4 * alpha + F * R2 - alpha * sinx)
                + 4
                * H**2
                * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
                * sinx2
            )
            - 4
            * (
                H**3 * R2
                + 3
                * H**2
                * R2
                * (-6 * alpha * F * sinx + alpha * R * (1 - 2 * F * sinx2))
            )
            - R2
            * (
                -2 * alpha * F**2 * (ddH - 2 * H) * R4 * sinx2
                + sinx
                * (
                    -3 * alpha * dH**2 * R2
                    + F
                    * (
                        R4 * (-3 * alpha * dF * dH * sinx + 6 * alpha * F * H * sinx)
                        - 12 * alpha * H**2 * R2 * sinx2
                    )
                )
            )
            - H
            * (
                -2 * alpha * R4 * sinx2 * (ddH - 2 * H + 12 * F * H * sinx2)
                + R4
                * (
                    dF * dH * R2 * sinx
                    - 2 * H * sinx * (F * R2 + 4 * alpha * (1 - 2 * F * sinx2))
                )
                + sinx
                * (
                    8 * alpha * (ddH - 2 * H) * R4
                    + 6 * alpha * H * R4 * sinx * (1 - 2 * F * sinx2)
                    + F
                    * (
                        -6 * alpha * F * R5
                        + 24 * alpha * H * R3 * sinx
                        + 2 * R4 * ((ddH - 2 * H) * R2 + 24 * alpha * H * sinx2)
                    )
                )
            )
            + R
            * (
                -(
                    H**2
                    * (
                        4 * F * R4
                        + 36 * alpha * F * R * sinx
                        - 6 * alpha * R2 * (1 - 2 * F * sinx2)
                    )
                )
                - 2
                * H
                * R2
                * (
                    6 * alpha * H * R * sinx * (1 - 2 * F * sinx2)
                    + sinx
                    * (
                        -6 * alpha * (ddH - 2 * H) * R
                        + F * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                    )
                )
            )
        )
        + cosx5
        * (
            R4
            * sinx
            * (
                -8
                * H
                * R
                * sinx
                * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
                + 4 * H**2 * R2 * sinx2
            )
            - 4
            * (
                3 * H**2 * R4
                + 3 * H * R4 * (-6 * alpha * F * sinx + alpha * R * (1 - 2 * F * sinx2))
            )
            - H
            * (
                -8 * alpha * F * R4 * sinx2
                + 2 * R5 * (4 * alpha + F * R2 - 8 * alpha * F * sinx2)
                + sinx
                * (
                    4 * alpha * F * R4
                    + 12 * H * R6 * sinx2
                    + R4 * (-8 * H * R * sinx - 6 * alpha * R * (1 - 2 * F * sinx2))
                )
            )
            - R2
            * (
                -2 * alpha * R4 * sinx2 * (ddH - 2 * H + 12 * F * H * sinx2)
                + R4
                * (
                    dF * dH * R2 * sinx
                    - 2 * H * sinx * (F * R2 + 4 * alpha * (1 - 2 * F * sinx2))
                )
                + sinx
                * (
                    8 * alpha * (ddH - 2 * H) * R4
                    + 6 * alpha * H * R4 * sinx * (1 - 2 * F * sinx2)
                    + F
                    * (
                        -6 * alpha * F * R5
                        + 24 * alpha * H * R3 * sinx
                        + 2 * R4 * ((ddH - 2 * H) * R2 + 24 * alpha * H * sinx2)
                    )
                )
            )
            + R
            * (
                -(H**2 * (-16 * R3 + 4 * R3 * sinx))
                - 2
                * H
                * R2
                * (
                    4 * F * R4
                    + 36 * alpha * F * R * sinx
                    - 6 * alpha * R2 * (1 - 2 * F * sinx2)
                )
                - R4
                * (
                    6 * alpha * H * R * sinx * (1 - 2 * F * sinx2)
                    + sinx
                    * (
                        -6 * alpha * (ddH - 2 * H) * R
                        + F * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                    )
                )
            )
        )
        + cosx7
        * (
            -4 * (3 * alpha * F * H * R5 - 18 * alpha * H**2 * R2 * sinx)
            + R4
            * sinx
            * (
                dH**2 * R2
                + 8 * alpha * F**2 * H * R * sinx2
                + 4 * H**2 * (4 * alpha + F * R2 - alpha * sinx) * sinx2
            )
            + R
            * (
                -(
                    R4
                    * (
                        -3 * alpha * dF * dH * R * sinx
                        - 6 * alpha * F * (ddH - 2 * H) * R * sinx
                        + 6 * alpha * F * H * R * sinx
                    )
                )
                - H**2
                * ((36 * alpha * R + 4 * F * R3) * sinx + 4 * R4 * (1 - 2 * F * sinx2))
                - 2
                * H
                * R2
                * (
                    -6 * alpha * F * R2
                    + sinx * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                )
            )
            - R2
            * (
                R4 * (4 * alpha * dF * dH * sinx - 8 * alpha * F * H * sinx)
                - 2
                * alpha
                * R4
                * sinx2
                * (2 * F * (ddH - 2 * H) + 6 * F**2 * H * sinx2)
                + sinx
                * (
                    R4 * (-3 * alpha * dF * dH * sinx + 6 * alpha * F * H * sinx)
                    - 12 * alpha * H**2 * R2 * sinx2
                    + F
                    * (
                        8 * alpha * (ddH - 2 * H) * R4
                        + 6 * alpha * H * R4 * sinx * (1 - 2 * F * sinx2)
                    )
                )
            )
            - H
            * (
                -2 * alpha * R4 * sinx2 * (2 * F**2 + 6 * H * sinx2)
                + R4 * (8 * alpha * F * R - 2 * H * R2 * sinx * (1 - 2 * F * sinx2))
                + sinx
                * (
                    -6 * alpha * F * R5
                    + 24 * alpha * H * R3 * sinx
                    + 2 * R4 * ((ddH - 2 * H) * R2 + 24 * alpha * H * sinx2)
                    + F
                    * (
                        12 * H * R6 * sinx2
                        + R4 * (-8 * H * R * sinx - 6 * alpha * R * (1 - 2 * F * sinx2))
                    )
                )
            )
        )
        + cosx3
        * (
            -4 * (alpha * F * R7 - 18 * alpha * H * R4 * sinx)
            + R4
            * sinx
            * (
                -4 * alpha * F**2 * R2 * sinx
                - 8 * H * R * sinx * (4 * alpha + F * R2 - alpha * sinx)
            )
            - H
            * (
                (4 * alpha * R4 + 12 * F * R6) * sinx
                - 4 * alpha * R4 * sinx2
                + 2 * R7 * (1 - 2 * F * sinx2)
            )
            + R
            * (
                -2
                * H
                * R2
                * ((36 * alpha * R + 4 * F * R3) * sinx + 4 * R4 * (1 - 2 * F * sinx2))
                - R4
                * (
                    -6 * alpha * F * R2
                    + sinx * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                )
            )
            - R2
            * (
                -2 * alpha * R4 * sinx2 * (2 * F**2 + 6 * H * sinx2)
                + R4 * (8 * alpha * F * R - 2 * H * R2 * sinx * (1 - 2 * F * sinx2))
                + sinx
                * (
                    -6 * alpha * F * R5
                    + 24 * alpha * H * R3 * sinx
                    + 2 * R4 * ((ddH - 2 * H) * R2 + 24 * alpha * H * sinx2)
                    + F
                    * (
                        12 * H * R6 * sinx2
                        + R4 * (-8 * H * R * sinx - 6 * alpha * R * (1 - 2 * F * sinx2))
                    )
                )
            )
        )
        + cosx**11
        * (
            3 * alpha * dH**2 * F * R4 * sinx
            - 4 * (3 * alpha * F * H**2 * R3 - 6 * alpha * H**3 * sinx)
            + R
            * (
                -2
                * H
                * R2
                * (
                    -3 * alpha * dF * dH * R * sinx
                    - 6 * alpha * F * (ddH - 2 * H) * R * sinx
                    + 6 * alpha * F * H * R * sinx
                )
                - H**2
                * (
                    -6 * alpha * F * R2
                    + sinx * (-48 * alpha * H * sinx - 36 * alpha * H * R * sinx2)
                )
            )
            - H
            * (
                R4 * (4 * alpha * dF * dH * sinx - 8 * alpha * F * H * sinx)
                - 2
                * alpha
                * R4
                * sinx2
                * (2 * F * (ddH - 2 * H) + 6 * F**2 * H * sinx2)
                + sinx
                * (
                    R4 * (-3 * alpha * dF * dH * sinx + 6 * alpha * F * H * sinx)
                    - 12 * alpha * H**2 * R2 * sinx2
                    + F
                    * (
                        8 * alpha * (ddH - 2 * H) * R4
                        + 6 * alpha * H * R4 * sinx * (1 - 2 * F * sinx2)
                    )
                )
            )
            + R4
            * sinx
            * (
                dH**2 * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
                - 4 * alpha * F**2 * H**2 * sinx3
            )
        )
        + cosx4
        * (
            -2 * dF * H * R7 * sinx
            + 4 * dH * R5 * sinx * (4 * alpha + F * R2 - alpha * sinx)
            + R
            * (
                -8 * dF * H * R6 * sinx
                - R4 * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
            )
            - R2
            * (
                sinx
                * (
                    -12 * alpha * dH * R3
                    - 48 * alpha * dH * R4 * sinx
                    + F
                    * (
                        -12 * dH * R6 * sinx
                        + R4 * (4 * dH * R - 6 * alpha * dF * R * sinx)
                    )
                )
                + R4 * (-2 * dF * H * R2 * sinx2 + dH * R2 * (1 - 2 * F * sinx2))
                + 12 * alpha * dH * R4 * sinx3
            )
        )
        + cosx10
        * (
            -12 * alpha * dF * H**2 * R3 * sinx
            - F
            * R2
            * sinx
            * (-3 * alpha * dH * F * R4 + 12 * alpha * dH * H * R2 * sinx)
            - 4
            * dH
            * H
            * R4
            * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
            * sinx2
            + R
            * (
                6 * alpha * dF * H**2 * R2 * sinx
                - 2
                * H
                * R2
                * (
                    F * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
                    + 6 * alpha * dF * H * R * sinx2
                    - 3 * alpha * dH * R * (1 - 2 * F * sinx2)
                )
            )
            - H
            * (
                R4
                * (
                    -8 * alpha * dF * H * sinx2
                    + dH * (F * R2 + 4 * alpha * (1 - 2 * F * sinx2))
                )
                + sinx
                * (
                    F * (-12 * alpha * dH * R3 - 48 * alpha * dH * R4 * sinx)
                    + R4
                    * (
                        6 * alpha * dF * H * sinx2
                        - 3 * alpha * dH * (1 - 2 * F * sinx2)
                    )
                )
                + 24 * alpha * dH * F * R4 * sinx3
            )
        )
        + cosx6
        * (
            -12 * alpha * dF * H * R5 * sinx
            + R4
            * sinx
            * (
                -4 * dH * H * R2 * sinx
                + 4 * dH * R * (-(alpha * F * sinx) + F * (4 * alpha - alpha * sinx))
            )
            - H
            * (
                8 * alpha * dF * R5 * sinx
                + sinx
                * (-12 * dH * R6 * sinx + R4 * (4 * dH * R - 6 * alpha * dF * R * sinx))
            )
            + R
            * (
                12 * alpha * dF * H * R4 * sinx
                - R4
                * (
                    F * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
                    + 6 * alpha * dF * H * R * sinx2
                    - 3 * alpha * dH * R * (1 - 2 * F * sinx2)
                )
            )
            - R2
            * (
                R4
                * (
                    -8 * alpha * dF * H * sinx2
                    + dH * (F * R2 + 4 * alpha * (1 - 2 * F * sinx2))
                )
                + sinx
                * (
                    F * (-12 * alpha * dH * R3 - 48 * alpha * dH * R4 * sinx)
                    + R4
                    * (
                        6 * alpha * dF * H * sinx2
                        - 3 * alpha * dH * (1 - 2 * F * sinx2)
                    )
                )
                + 24 * alpha * dH * F * R4 * sinx3
            )
        )
        + cosx**12
        * (
            R
            * (
                6 * alpha * dH * F * H * R3
                - H**2 * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
            )
            + 4 * alpha * dH * F**2 * H * R4 * sinx3
            - H
            * (
                4 * alpha * dH * F * R4
                + sinx
                * (
                    -3 * alpha * dH * F * R4
                    + 12 * alpha * dH * H * R2 * sinx
                    + F
                    * R4
                    * (
                        6 * alpha * dF * H * sinx2
                        - 3 * alpha * dH * (1 - 2 * F * sinx2)
                    )
                )
                + 12 * alpha * dH * F**2 * R4 * sinx3
            )
        )
        + cosx8
        * (
            R4
            * sinx
            * (
                -4 * alpha * dH * F**2 * R * sinx
                - 4 * dH * H * sinx * (4 * alpha + F * R2 - alpha * sinx)
            )
            + R
            * (
                3 * alpha * dH * F * R5
                - 4 * dF * H**2 * R4 * sinx
                - 2 * H * R2 * sinx * (24 * alpha * dH + 36 * alpha * dH * R * sinx)
            )
            - H
            * (
                sinx
                * (
                    -12 * alpha * dH * R3
                    - 48 * alpha * dH * R4 * sinx
                    + F
                    * (
                        -12 * dH * R6 * sinx
                        + R4 * (4 * dH * R - 6 * alpha * dF * R * sinx)
                    )
                )
                + R4 * (-2 * dF * H * R2 * sinx2 + dH * R2 * (1 - 2 * F * sinx2))
                + 12 * alpha * dH * R4 * sinx3
            )
            - R2
            * (
                4 * alpha * dH * F * R4
                + sinx
                * (
                    -3 * alpha * dH * F * R4
                    + 12 * alpha * dH * H * R2 * sinx
                    + F
                    * R4
                    * (
                        6 * alpha * dF * H * sinx2
                        - 3 * alpha * dH * (1 - 2 * F * sinx2)
                    )
                )
                + 12 * alpha * dH * F**2 * R4 * sinx3
            )
        )
    )
    Eq3 = (
        -(
            (cosx + B * cosx3) ** 2
            * (-3 * alpha * cosx6 * H + alpha * cosx2 * R2 + R4)
            * (cosx * dF - 2 * F * sinx)
        )
        - (
            3
            * (C0 + B * C0 * cosx2) ** 2
            * cosx4
            * R4
            * (
                5 * alpha * cosx6 * H
                - R4
                + alpha * cosx4 * F * R2 * sinx
                + alpha * cosx2 * R2 * (1 + sinx)
            )
        )
        / (
            (cosx4 * H + R2) ** 2
            * (
                3 * alpha * cosx6 * H
                - R4
                + alpha * cosx2 * R2 * (-1 + sinx)
                + alpha * cosx4 * F * R2 * sinx
            )
            ** 2
        )
        - alpha
        * cosx4
        * (1 + cosx2 * F) ** 2
        * R2
        * (1 + cosx * dB * sinx + B * (cosx2 - 2 * sinx2)) ** 2
        - cosx2
        * (1 + B * cosx2)
        * (-3 * alpha * cosx6 * H + alpha * cosx2 * R2 + R4)
        * (cosx * dB - 2 * B * sinx)
        * (1 + cosx * dF * sinx + F * (cosx2 - 2 * sinx2))
        - cosx2
        * (1 + cosx2 * F)
        * (3 * alpha * cosx6 * H - alpha * cosx2 * R2 - R4)
        * (cosx * dB - 2 * B * sinx)
        * (2 + cosx * dB * sinx + B * (2 * cosx2 - 2 * sinx2))
        - 4
        * (1 + B * cosx2) ** 2
        * (
            3 * cosx2 * H
            + R2 * (R + cosx * dF * R * sinx - 1 / (1 + sinx))
            + F * R2 * (cosx2 * R + sinx - 2 * R * sinx2)
        )
        + (1 + B * cosx2)
        * (1 + cosx2 * F)
        * (
            -(
                R2
                * (1 + cosx * dB * sinx + B * (cosx2 - 2 * sinx2))
                * (
                    -3 * alpha * cosx6 * F
                    + 4 * R
                    - 3 * alpha * cosx5 * dF * sinx
                    + 3 * alpha * cosx4 * (-1 + 2 * F * sinx2)
                )
            )
            - 2
            * (-3 * alpha * cosx6 * H + alpha * cosx2 * R2 + R4)
            * (
                2 * cosx3 * dB
                - 3 * sinx
                + cosx2 * ddB * sinx
                - 6 * cosx * dB * sinx2
                + B * (-9 * cosx2 * sinx + 6 * sinx3)
            )
            + 2
            * alpha
            * cosx2
            * (1 + cosx2 * F)
            * R2
            * sinx
            * (
                2 * cosx3 * dB
                - 3 * sinx
                + cosx2 * ddB * sinx
                - 6 * cosx * dB * sinx2
                + B * (-9 * cosx2 * sinx + 6 * sinx3)
            )
        )
    )
    Eq4 = (
        C0 * R2 * sqrtBQ
        + 3 * alpha * cosx7 * dW * H * sqrtFQ * sqrtP
        - alpha * cosx3 * dW * R2 * sqrtFQ * sqrtP
        - cosx * dW * R4 * sqrtFQ * sqrtP
        + alpha * cosx3 * dW * R2 * sinx * sqrtFQ * sqrtP
        + alpha * cosx5 * dW * F * R2 * sinx * sqrtFQ * sqrtP
        - 12 * alpha * cosx6 * H * sinx * sqrtFQ * sqrtP * W
        + 4 * alpha * cosx2 * R2 * sinx * sqrtFQ * sqrtP * W
        + 4 * R4 * sinx * sqrtFQ * sqrtP * W
        - 4 * alpha * cosx2 * R2 * sinx2 * sqrtFQ * sqrtP * W
        - 4 * alpha * cosx4 * F * R2 * sinx2 * sqrtFQ * sqrtP * W
    )

    return Eq1, Eq2, Eq3, Eq4


def safe_sqrt(x, eps=1e-5):
    return torch.sqrt(torch.clamp(x, min=eps))
