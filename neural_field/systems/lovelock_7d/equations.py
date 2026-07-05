from utils.trainer import ndiff as diff
import utils.evaluator as evaltor
import utils.loader as loader
import utils.grid.distributions as sample
import torch


def equations(models_evaled, points_coord, conf):
    x = points_coord["x"]
    rh = conf["rh"]
    alph = conf["alph"]
    bet = points_coord["bet"]
    C0 = models_evaled["C0"]

    F = models_evaled["F"]
    W = models_evaled["W"]
    H = models_evaled["H"]
    B = models_evaled["B"]
    # Derivatives w.r.t. the grad-carrying x (ndiff/create_graph).
    dF = diff(F, x, order=1)
    dW = diff(W, x, order=1)
    dB = diff(B, x, order=1)
    dH = diff(H, x, order=1)
    ddB = diff(B, x, order=2)
    ddH = diff(H, x, order=2)

    # Fuse the giant elementwise algebra into one torch.compile'd kernel set.
    # Geometry (x) and the parametric coefficient (bet) carry no network-param
    # gradient, so detach: fuses cleanly and shrinks the backward pass.
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
        bet.detach(),
        float(alph),
        float(rh),
    )
    return {"equations": [Eq1, Eq2, Eq3, Eq4], "labels": ["eq1", "eq2", "eq3", "eq4"]}


@torch.compile
def _evaluate_eqs(F, B, H, W, C0, dF, dW, dB, dH, ddB, ddH, xd, bet, alph, rh):
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
    cosx11 = cosx**11
    cosx12 = cosx**12
    cosx13 = cosx**13
    cosx14 = cosx**14
    cosx15 = cosx**15
    cosx16 = cosx**16
    cosx17 = cosx**17
    cosx20 = cosx**20
    cosx22 = cosx**22
    cosx24 = cosx**24
    cosx28 = cosx**28

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
    R10 = R**10
    R11 = R**11
    R12 = R**12
    R13 = R**13
    R14 = R**14
    R15 = R**15

    InvDenom = (cosx6 * H + R2) ** (-3) * (
        R8
        - 6 * alph * cosx6 * R6 * (-1 + F * sinx)
        + 6 * cosx8 * H * R2 * (-(alph * R2) + 3 * bet * cosx6 * (-1 + F * sinx))
        + 45 * bet * cosx16 * H**2
        + 9 * bet * cosx12 * R4 * (-1 + F * sinx) ** 2
    ) ** (-2)

    Eq1 = (
        -(
            cosx6
            * InvDenom
            * R9
            * (B * cosx4 + (1 + cosx2) * sinx)
            * C0**2
            * (cosx6 * H + R2) ** 2
            * (
                R8
                + 6
                * alph
                * cosx2
                * R6
                * (1 - 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                + 6
                * cosx8
                * H
                * R2
                * (
                    -(alph * R2)
                    + 3
                    * bet
                    * cosx2
                    * (-1 + 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                )
                + 45 * bet * cosx16 * H**2
                + 9
                * bet
                * cosx4
                * R4
                * (
                    1
                    - 6 * sinx * (cosx4 * F + (1 + cosx2) * sinx)
                    + 5 * sinx2 * (cosx4 * F + (1 + cosx2) * sinx) ** 2
                )
            )
        )
        + (cosx4 * F + (1 + cosx2) * sinx)
        * (4 * sinx + cosx * dB * sinx + B * (cosx2 - 4 * sinx2))
        * (
            2
            * cosx6
            * H
            * R3
            * (
                -4 * R5
                + 18 * bet * cosx8 * R * (-1 + F * sinx)
                + 3 * alph * cosx8 * R2 * (cosx * dH - 4 * H * sinx)
                + 9
                * bet
                * cosx10
                * (cosx * dH - 4 * H * sinx)
                * (1 - 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                + 6
                * alph
                * cosx2
                * R3
                * (-3 + 2 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
            )
            - 9
            * bet
            * cosx16
            * R
            * (
                5 * cosx6 * (cosx * dH - 4 * H * sinx)
                + R * (2 - 8 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
            )
            * H**2
            + 72 * bet * cosx22 * H**3
            - R5
            * (
                10 * R5
                - 60 * alph * cosx6 * R3 * (-1 + F * sinx)
                + cosx6 * R4 * (cosx * dH - 4 * H * sinx)
                + 6
                * alph
                * cosx8
                * R2
                * (cosx * dH - 4 * H * sinx)
                * (1 - 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                + 9
                * bet
                * cosx10
                * (cosx * dH - 4 * H * sinx)
                * (
                    1
                    - 6 * sinx * (cosx4 * F + (1 + cosx2) * sinx)
                    + 5 * sinx2 * (cosx4 * F + (1 + cosx2) * sinx) ** 2
                )
                + 90 * bet * cosx12 * R * (-1 + F * sinx) ** 2
            )
        )
        + 4
        * (B * cosx4 + (1 + cosx2) * sinx)
        * (
            -(
                cosx4
                * (
                    2 * cosx4 * R5
                    + 3
                    * alph
                    * cosx6
                    * R3
                    * (1 + 2 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                )
                * H**2
            )
            + 3 * alph * cosx16 * R * H**3
            + cosx2
            * H
            * R4
            * (
                6
                * alph
                * cosx8
                * sinx
                * (cosx4 * F + (1 + cosx2) * sinx)
                * (cosx * dH - 4 * H * sinx)
                + 2 * R3 * (4 - 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
                + 3
                * alph
                * cosx2
                * R
                * (
                    3
                    - 4 * sinx * (cosx4 * F + (1 + cosx2) * sinx)
                    + sinx2 * (cosx4 * F + (1 + cosx2) * sinx) ** 2
                )
            )
            + R6
            * (
                -10 * R3 * (-1 + F * sinx)
                - 2
                * cosx2
                * R2
                * sinx
                * (cosx4 * F + (1 + cosx2) * sinx)
                * (cosx * dH - 4 * H * sinx)
                + 6
                * alph
                * cosx8
                * sinx
                * (cosx4 * F + (1 + cosx2) * sinx)
                * (-1 + F * sinx)
                * (cosx * dH - 4 * H * sinx)
                + 15 * alph * cosx6 * R * (-1 + F * sinx) ** 2
            )
        )
    )
    Eq2 = (
        -80 * cosx * H * R10
        - 120 * alph * cosx3 * H * R8
        + 10 * cosx7 * H * (-4 * H + F * R3) * R8
        + 10 * cosx6 * dF * H * R11 * sinx
        + 10 * dF * R13 * sinx
        - 20
        * cosx5
        * R10
        * (-1 + F * sinx)
        * (-3 * alph + 3 * alph * F * sinx + 2 * H * R * sinx)
        + 10
        * R12
        * (-4 * cosx + 4 * rh * sinx + F * (rh + 5 * cosx * sinx - 5 * rh * sinx2))
        - 60 * alph * cosx9 * R6 * H**2
        - cosx
        * R
        * (cosx6 * H + R2)
        * (
            4
            * H
            * R
            * (cosx6 * H + R2)
            * (3 * alph * cosx8 * H - 2 * (3 * alph * cosx2 * R2 + R4))
            - cosx4
            * R
            * (cosx * dH - 4 * H * sinx)
            * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
            * (
                -6 * cosx8 * H * R2 * (3 * bet * cosx2 + alph * R2)
                + 9 * bet * cosx4 * R4
                + 6 * alph * cosx2 * R6
                + R8
                + 45 * bet * cosx16 * H**2
            )
            + 2
            * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
            * (
                -15 * (3 * bet * cosx2 + 2 * alph * R2) * R6
                - 2
                * H
                * (9 * bet * cosx8 * R4 + 9 * alph * cosx6 * R6 + 2 * cosx4 * R8)
                - 9 * bet * cosx14 * R2 * H**2
                + 36 * bet * cosx20 * H**3
            )
        )
        + cosx5
        * InvDenom
        * R10
        * C0**2
        * (cosx6 * H + R2) ** 3
        * (
            R8
            - 6 * alph * cosx6 * R6 * (-1 + F * sinx)
            + 6 * cosx8 * H * R2 * (-(alph * R2) + 3 * bet * cosx6 * (-1 + F * sinx))
            + 45 * bet * cosx16 * H**2
            + 9 * bet * cosx12 * R4 * (-1 + F * sinx) ** 2
        )
        + 9
        * bet
        * cosx5
        * R6
        * sinx3
        * (cosx4 * F + (1 + cosx2) * sinx) ** 3
        * (
            4 * H
            + 4 * R * (-(cosx * dH) + 4 * H * sinx)
            - 2
            * (cosx6 * H + R2)
            * (cosx * (-(cosx * ddH) + 10 * dH * sinx) + 4 * H * (cosx2 - 5 * sinx2))
            - cosx6 * (cosx * dH - 4 * H * sinx) ** 2
        )
        + 3
        * cosx3
        * R2
        * sinx2
        * (cosx4 * F + (1 + cosx2) * sinx) ** 2
        * (
            2
            * cosx2
            * R4
            * (cosx * dH - 4 * H * sinx)
            * (
                12 * bet * R
                + 9 * bet * cosx6 * (cosx * dH - 4 * H * sinx)
                + alph * cosx4 * R2 * (cosx * dH - 4 * H * sinx)
            )
            + 4
            * (3 * bet * cosx2 + alph * R2)
            * R6
            * (cosx * (-(cosx * ddH) + 10 * dH * sinx) + 4 * H * (cosx2 - 5 * sinx2))
            + 15
            * bet
            * R6
            * (2 * R + cosx6 * (cosx * dH - 4 * H * sinx))
            * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
            + 4
            * cosx6
            * R
            * (
                18 * bet * cosx2 * R
                + 3 * bet * cosx10 * (ddH - 4 * H) * R
                - alph * R3
                - 6 * bet * cosx9 * dH * (2 + 5 * R * sinx)
                + 12 * bet * cosx8 * H * sinx * (4 + 5 * R * sinx)
            )
            * H**2
            + 48 * bet * cosx14 * H**3
            - H
            * R2
            * (
                24 * bet * cosx2 * R2
                + 32 * alph * R4
                + 72 * bet * cosx8 * R * (cosx * dH - 4 * H * sinx)
                - 15
                * bet
                * cosx12
                * R2
                * (cosx * dH - 4 * H * sinx)
                * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
                - 2
                * cosx6
                * R3
                * (
                    -4 * alph * cosx * dH
                    - 2 * alph * cosx2 * ddH * R
                    + 60 * bet * sinx
                    + 15 * bet * cosx * dF * sinx
                    + 20 * alph * cosx * dH * R * sinx
                    + 8 * alph * H * (cosx2 * R + sinx * (2 - 5 * R * sinx))
                    + 15 * bet * F * (cosx2 - 4 * sinx2)
                )
                - 6 * bet * cosx14 * (cosx * dH - 4 * H * sinx) ** 2
            )
        )
        + cosx
        * sinx
        * (cosx4 * F + (1 + cosx2) * sinx)
        * (
            -(
                R6
                * (cosx * dH - 4 * H * sinx)
                * (
                    -4 * R * (-9 * bet * cosx4 + R4)
                    + cosx6
                    * (45 * bet * cosx4 + 18 * alph * cosx2 * R2 + R4)
                    * (cosx * dH - 4 * H * sinx)
                )
            )
            - 2
            * (9 * bet * cosx4 + 6 * alph * cosx2 * R2 + R4)
            * R8
            * (cosx * (-(cosx * ddH) + 10 * dH * sinx) + 4 * H * (cosx2 - 5 * sinx2))
            - 6
            * (3 * bet * cosx2 + alph * R2)
            * R8
            * (10 * R + 3 * cosx6 * (cosx * dH - 4 * H * sinx))
            * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
            + 6
            * cosx14
            * R
            * (
                126 * bet * cosx2 * R
                - 4 * alph * R3
                - 15
                * bet
                * cosx8
                * (
                    cosx * (-(cosx * ddH * R) + 2 * dH * (4 + 5 * R * sinx))
                    + 4 * H * (cosx2 * R - sinx * (8 + 5 * R * sinx))
                )
                - 12
                * bet
                * cosx6
                * R2
                * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
            )
            * H**3
            + 720 * bet * cosx22 * H**4
            - 3
            * cosx6
            * R2
            * H**2
            * (
                72 * bet * cosx4 * R2
                - 8 * R6
                + 18
                * bet
                * cosx10
                * R
                * (
                    cosx * (-(cosx * ddH * R) + 2 * dH * (7 + 5 * R * sinx))
                    + 4 * H * (cosx2 * R - sinx * (14 + 5 * R * sinx))
                )
                + 8
                * alph
                * cosx6
                * R5
                * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
                - 18
                * bet
                * cosx14
                * R2
                * (cosx * dH - 4 * H * sinx)
                * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
                - 4
                * cosx8
                * R3
                * (
                    2 * alph * cosx * dH
                    - alph * cosx2 * ddH * R
                    - 36 * bet * sinx
                    - 9 * bet * cosx * dF * sinx
                    + 10 * alph * cosx * dH * R * sinx
                    + 4 * alph * H * (cosx2 * R - sinx * (2 + 5 * R * sinx))
                    - 9 * bet * F * (cosx2 - 4 * sinx2)
                )
                - 45 * bet * cosx16 * (cosx * dH - 4 * H * sinx) ** 2
            )
            + 2
            * H
            * R4
            * (
                4
                * cosx6
                * (27 * bet * cosx4 * R + 9 * alph * cosx2 * R3 + R5)
                * (cosx * dH - 4 * H * sinx)
                + R2
                * (
                    18 * bet * cosx4
                    + 96 * alph * cosx2 * R2
                    + 34 * R4
                    + cosx6
                    * (9 * bet * cosx4 - R4)
                    * (
                        cosx * (-(cosx * ddH) + 10 * dH * sinx)
                        + 4 * H * (cosx2 - 5 * sinx2)
                    )
                )
                - 3
                * cosx6
                * R3
                * (
                    36 * bet * cosx2
                    + 14 * alph * R2
                    + 3 * alph * cosx6 * R * (cosx * dH - 4 * H * sinx)
                )
                * ((4 + cosx * dF) * sinx + F * (cosx2 - 4 * sinx2))
                + 3
                * cosx14
                * (27 * bet * cosx2 - alph * R2)
                * (cosx * dH - 4 * H * sinx) ** 2
            )
        )
    )

    Eq3 = -(
        cosx4
        * (-((4 + cosx * dB) * sinx) + B * (-1 + 5 * sinx2))
        * (
            3
            * cosx10
            * (4 + cosx * dB)
            * R2
            * sinx
            * (
                -6 * bet * cosx8 * H
                + 2 * alph * R4
                + 3 * bet * R2 * (2 - 8 * sinx2 + 9 * sinx4 - 3 * sinx6)
            )
            * F**2
            - 9 * bet * cosx16 * (4 + cosx * dB) * R4 * sinx2 * F**3
            - cosx
            * (1 + cosx2)
            * sinx
            * (
                -6
                * cosx8
                * H
                * R2
                * (
                    -12 * bet * cosx
                    + 12 * bet * cosx5
                    + 3 * bet * cosx6 * dB
                    - 3 * bet * cosx2 * dF
                    + alph * (dB - dF) * R2
                )
                + R4
                * (
                    36 * bet * cosx11
                    - 36 * bet * cosx3
                    + 9 * bet * cosx12 * dB
                    - 9 * bet * cosx4 * dF
                    - 24 * alph * cosx * R2
                    + 24 * alph * cosx5 * R2
                    + 6 * alph * cosx6 * dB * R2
                    - 6 * alph * cosx2 * dF * R2
                    + (dB - dF) * R4
                )
                + 45 * bet * cosx16 * (dB - dF) * H**2
            )
            - F
            * (
                R4
                * (
                    36 * bet * cosx16
                    + 9 * bet * cosx17 * dB
                    + 24 * alph * cosx10 * R2
                    + 6 * alph * cosx11 * dB * R2
                    + cosx5 * dB * R4
                    - 72 * bet * cosx12 * sinx2
                    - 72 * bet * cosx14 * sinx2
                    - 18 * bet * cosx13 * dB * sinx2
                    - 18 * bet * cosx15 * dB * sinx2
                    - 24 * alph * cosx8 * R2 * sinx2
                    - 6 * alph * cosx7 * dB * R2 * sinx2
                    - 6 * alph * cosx9 * dB * R2 * sinx2
                    - R2 * (-6 * alph * cosx2 + R2 * (-2 + sinx2)) * (-1 + 5 * sinx2)
                    + 3 * cosx6 * (-3 * bet + (15 * bet - 8 * alph * R2) * sinx2)
                    + cosx4
                    * (
                        4 * R4
                        + 9 * bet * (-1 + 5 * sinx2)
                        + 6 * alph * R2 * (-1 + 5 * sinx2)
                    )
                )
                + 45
                * bet
                * cosx16
                * (
                    2
                    + cosx * dB
                    + (3 - 2 * cosx * dB) * sinx2
                    + (-1 + cosx * dB) * sinx4
                )
                * H**2
                - 6
                * cosx8
                * H
                * R2
                * (
                    alph * R2 * (2 + 3 * sinx2 - sinx4)
                    + 3
                    * bet
                    * cosx2
                    * (2 - 13 * sinx2 + 39 * sinx4 - 32 * sinx6 + 8 * sinx8)
                    - cosx
                    * dB
                    * (
                        -(alph * R2)
                        + 3 * bet * (-1 + 5 * sinx2 - 6 * sinx4 + 2 * sinx6)
                    )
                    * (-1 + sinx2) ** 2
                )
            )
            + B
            * (
                6
                * cosx8
                * H
                * R2
                * (
                    -3 * bet * cosx7 * dF
                    - 4 * alph * cosx4 * R2
                    - alph * cosx5 * dF * R2
                    + 3 * bet * cosx8 * (1 - 5 * sinx2)
                    + alph * R2 * (1 - 5 * sinx2)
                    + alph * R2 * (1 - 6 * sinx2 + 5 * sinx4)
                    + 3
                    * bet
                    * (3 + 5 * sinx2 + 2 * F * sinx * (2 - 11 * sinx2 + 5 * sinx4))
                    * (-1 + sinx2) ** 3
                    - 3 * bet * (-1 + 5 * sinx2) * F**2 * (-1 + sinx2) ** 5
                )
                + 45
                * bet
                * (
                    2
                    + cosx * dF
                    + (3 - 2 * cosx * dF) * sinx2
                    + (-1 + cosx * dF) * sinx4
                )
                * H**2
                * (-1 + sinx2) ** 8
                + R4
                * (
                    9 * bet * cosx9 * dF
                    + 6 * alph * cosx7 * dF * R2
                    + 4 * cosx4 * R4
                    + cosx5 * dF * R4
                    + 9 * bet * cosx12 * (-1 + 5 * sinx2)
                    + 9 * bet * cosx14 * (-1 + 5 * sinx2)
                    + R4 * (-1 + 5 * sinx2)
                    + 6 * cosx8 * (6 * bet + alph * R2 * (-1 + 5 * sinx2))
                    + R4 * (-1 + 6 * sinx2 - 5 * sinx4)
                    - 3
                    * (
                        2
                        * alph
                        * R2
                        * (3 + 5 * sinx2 + 2 * F * sinx * (2 - 11 * sinx2 + 5 * sinx4))
                        + 3
                        * bet
                        * F
                        * sinx
                        * (
                            8
                            - 15 * sinx10
                            - 64 * sinx2
                            + 148 * sinx4
                            - 155 * sinx6
                            + 78 * sinx8
                        )
                    )
                    * (-1 + sinx2) ** 3
                    - 3
                    * (-1 + 5 * sinx2)
                    * (
                        -2 * alph * R2
                        + 3 * bet * (-2 + 8 * sinx2 - 9 * sinx4 + 3 * sinx6)
                    )
                    * F**2
                    * (-1 + sinx2) ** 5
                    + 9 * bet * sinx * (-1 + 5 * sinx2) * F**3 * (-1 + sinx2) ** 8
                )
            )
        )
    ) + (B * cosx4 + (1 + cosx2) * sinx) * (
        -4
        * (B * cosx4 + (1 + cosx2) * sinx)
        * (
            -6 * cosx2 * H * R4
            + 3 * R4 * (-1 + F * sinx) * (-2 * R2 + alph * cosx6 * (-1 + F * sinx))
            - 2
            * R5
            * (R2 - 3 * alph * cosx6 * (-1 + F * sinx))
            * ((4 + cosx * dF) * sinx + F * (1 - 5 * sinx2))
            + 6
            * alph
            * cosx8
            * H
            * R2
            * (-1 + (4 + cosx * dF) * R * sinx + F * (R + sinx - 5 * R * sinx2))
            + 15 * alph * cosx10 * H**2
        )
        - 3
        * cosx6
        * InvDenom
        * (cosx6 * H + R2)
        * R8
        * (B * cosx4 + (1 + cosx2) * sinx)
        * C0**2
        * (
            R8
            + 2 * alph * cosx2 * R6 * (1 - 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
            + cosx4
            * R4
            * (
                -3 * bet
                - 10 * alph * cosx4 * H
                + 3
                * bet
                * sinx
                * (cosx4 * F + (1 + cosx2) * sinx)
                * (-2 + 3 * sinx * (cosx4 * F + (1 + cosx2) * sinx))
            )
            + 30 * bet * cosx10 * H * R2 * (1 + cosx4 * F * sinx + (1 + cosx2) * sinx2)
            + 105 * bet * cosx16 * H**2
        )
        + 2
        * (cosx4 * F + (1 + cosx2) * sinx)
        * (
            (
                4
                + 2 * cosx * dB
                + ddB * sinx
                - 2 * (8 + 5 * cosx * dB) * sinx2
                + B * sinx * (-13 + 25 * sinx2)
                - ddB * sinx3
            )
            * (
                -6 * cosx8 * H * R2 * (3 * bet * cosx2 + alph * R2)
                + 9 * bet * cosx4 * R4
                + 6 * alph * cosx2 * R6
                + R8
                + 45 * bet * cosx16 * H**2
            )
            + ((4 + cosx * dB) * sinx + B * (1 - 5 * sinx2))
            * (
                3
                * cosx8
                * H
                * R2
                * (
                    12 * bet * cosx2 * sinx
                    + 4 * alph * R * (-1 + R * sinx)
                    + 9 * bet * cosx6 * ((4 + cosx * dF) * sinx + F * (1 - 5 * sinx2))
                )
                + R4
                * (
                    4 * R * (3 * alph * cosx2 + R2)
                    - 2 * (9 * bet * cosx4 + 6 * alph * cosx2 * R2 + R4) * sinx
                    - 9
                    * cosx6
                    * (3 * bet * cosx2 + alph * R2)
                    * ((4 + cosx * dF) * sinx + F * (1 - 5 * sinx2))
                )
                - 90 * bet * cosx16 * sinx * H**2
            )
        )
        + 3
        * cosx2
        * R2
        * sinx
        * (
            (
                -24 * bet * cosx8 * H * sinx
                + R2
                * (
                    8 * alph * R * (-1 + R * sinx)
                    + 3
                    * bet
                    * cosx2
                    * (
                        (8 + 20 * cosx4 + 5 * cosx5 * dF) * sinx
                        + 5 * cosx4 * F * (1 - 5 * sinx2)
                    )
                )
            )
            * ((4 + cosx * dB) * sinx + B * (1 - 5 * sinx2))
            - 4
            * (-3 * bet * cosx8 * H + 3 * bet * cosx2 * R2 + alph * R4)
            * (
                4
                + 2 * cosx * dB
                + ddB * sinx
                - 2 * (8 + 5 * cosx * dB) * sinx2
                + B * sinx * (-13 + 25 * sinx2)
                - ddB * sinx3
            )
        )
        * (cosx4 * F + (1 + cosx2) * sinx) ** 2
        + 18
        * bet
        * cosx4
        * R4
        * sinx2
        * (
            4
            + 2 * cosx * dB
            + ddB * sinx
            - 12 * (2 + cosx * dB) * sinx2
            + 5 * B * sinx * (-3 + 7 * sinx2)
            - ddB * sinx3
        )
        * (-(sinx * (-2 + sinx2)) + F * (-1 + sinx2) ** 2) ** 3
    )

    sqrtDenom = safe_sqrt((cosx6 * H + R2) ** 3) * (
        R8
        - 6 * alph * cosx6 * R6 * (-1 + F * sinx)
        + 6 * cosx8 * H * R2 * (-(alph * R2) + 3 * bet * cosx6 * (-1 + F * sinx))
        + 45 * bet * cosx16 * H**2
        + 9 * bet * cosx12 * R4 * (-1 + F * sinx) ** 2
    )

    Eq4 = -(C0 * R4 * safe_sqrt(B * cosx4 + (1 + cosx2) * sinx)) + sqrtDenom * (
        cosx * dW - 6 * sinx * W
    ) * safe_sqrt(cosx4 * F + (1 + cosx2) * sinx)

    return Eq1, Eq2, Eq3, Eq4


def safe_sqrt(x, eps=1e-5):
    return torch.sqrt(torch.clamp(x, min=eps))
