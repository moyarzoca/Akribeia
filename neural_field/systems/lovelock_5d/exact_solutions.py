import numpy as np
import torch

def exact_functions(points_coord, conf):
    """
    Myers-Perry 5D equal angular momentum
    """
    x_grid = points_coord["x"]
    rh = 1.0 #conf["rh"]
    Omega = 0.33
    C0 = 4 * Omega * rh**4 / (Omega**2 * rh**2 - 1)

    sinx = torch.sin(x_grid);
    cosx = torch.cos(x_grid);
    
    cosx2=cosx**2;
    cosx3=cosx**3;
    cosx4=cosx**4;


    sinx2=sinx**2;
    sinx3=sinx**3;
    sinx4=sinx**4;

    F_analytic = (-1 + Omega*rh)**(-1)*(1 + Omega*rh)**(-1)*(-(sinx*rh**2*(5 - 6*sinx - 6*Omega**2*rh**2 + 6*sinx*Omega**2*rh**2)) - 2*cosx*(1 - 2*sinx - 2*Omega**2*rh**2 + 2*sinx*Omega**2*rh**2)*rh**3 - cosx2*(-1 + Omega*rh)*(1 + Omega*rh)*rh**4 + 4*cosx*rh*(-1 + Omega*rh)*(1 + Omega*rh)*sinx2*(1 + sinx)**(-1) + (-1 + Omega*rh)*(1 + Omega*rh)*sinx3*(1 + sinx)**(-1))*(cosx*rh + sinx)**(-4)
    B_analytic = (sinx*rh**2*(5 - 6*Omega**2*rh**2 + 6*sinx*(-1 + Omega**2*rh**2)) + 2*cosx*(1 - 2*Omega**2*rh**2 + 2*sinx*(-1 + Omega**2*rh**2))*rh**3 - cosx2*rh**4 - 4*cosx*rh*sinx2*(-1 + Omega**2*rh**2)*(1 + sinx)**(-1) - sinx3*(-1 + Omega**2*rh**2)*(1 + sinx)**(-1))*(4*cosx*rh*sinx3 + sinx4 + 6*cosx2*sinx2*rh**2 - sinx4*Omega**2*rh**2 + 4*cosx3*sinx*rh**3 - 4*cosx*sinx3*Omega**2*rh**3 + cosx4*rh**4 - 6*cosx2*sinx2*Omega**2*rh**4 - 4*cosx3*sinx*Omega**2*rh**5)**(-1)

    H_analytic = -(Omega**2*rh**6*(-1 + Omega*rh)**(-1)*(1 + Omega*rh)**(-1)*(cosx*rh + sinx)**(-2))

    W_analytic = -(Omega*rh**4*(-4*cosx*rh*sinx3 - sinx4 - 6*cosx2*sinx2*rh**2 + sinx4*Omega**2*rh**2 - 4*cosx3*sinx*rh**3 + 4*cosx*sinx3*Omega**2*rh**3 - cosx4*rh**4 + 6*cosx2*sinx2*Omega**2*rh**4 + 4*cosx3*sinx*Omega**2*rh**5)**(-1))

    return {"F" : F_analytic, "B" : B_analytic, "H" : H_analytic, "W" : W_analytic}

