import numpy as np
import torch

def exact_functions(points_coord, conf):
    """
    Myers-Perry 7D equal angular momentum
    """
    x = points_coord["x"]
    rh = conf["rh"]


    rh2=rh**2
    rh4=rh**4
    rh5=rh**5
    rh6=rh**6
    rh8=rh**8
    rh10=rh**10
    
    #------------------
    #----- Hardcoded!
    #------------------
    Oh = 0.33 
    #------------------
    Oh2 =Oh**2

    conf["C0"] = 6*Oh*rh**6*(-1 + Oh**2*rh**2)**(-1)

    sinx = torch.sin(x);
    cosx = torch.cos(x);

    R = sinx + rh * cosx;

    f_ana = 1 - cosx**4*R**(-4)*rh**4*(1 - Oh**2*rh**2)**(-1) + cosx**6*Oh**2*R**(-6)*rh**8*(1 - Oh**2*rh**2)**(-1)
    b_ana = 1 - cosx**4*R**2*rh**4*(R**6*(1 - Oh**2*rh**2) + cosx**6*Oh**2*rh**8)**(-1)
    h_tilde_ana = 1 + cosx**6*Oh**2*R**(-6)*rh**8*(1 - Oh**2*rh**2)**(-1)
    w_ana = Oh*cosx**6*rh**6*(R**6*(1 - Oh**2*rh**2) + cosx**6*Oh**2*rh**8)**(-1)

    F_analytic = (cosx*(-4*rh**5 + 6*Oh**2*rh**7 + 2*rh*(-1 + Oh**2*rh**2)*sinx**2*(10*rh**2 - 6*rh**4 + (3 - 10*rh**2 + 3*rh**4)*sinx**2)) + sinx*(-14*rh**4 + (2 + 15*Oh**2)*rh**6 - 2*Oh**2*rh**8 + (-1 + Oh**2*rh**2)*sinx**2*(3*rh**2*(5 - 10*rh**2 + rh**4) + (1 - 15*rh**2 + 15*rh**4 - rh**6)*sinx**2)))*(cosx*rh + sinx)**(-6)*(-1 + Oh**2*rh**2)**(-1)    
    B_analytic = (sinx*(-14 + (2 + 15*Oh**2)*rh**2)*rh**4 + cosx*(-4*rh**5 + 6*Oh**2*rh**7 + 2*rh*(-1 + Oh**2*rh**2)*sinx**2*(10*rh**2 - 6*rh**4 + (3 - 10*rh**2 + 3*rh**4)*sinx**2)) - 3*rh**2*(5 - 5*(2 + Oh**2)*rh**2 + (1 + 10*Oh**2)*rh**4)*sinx**3 + (-1 + (15 + Oh**2)*rh**2 - 15*(1 + Oh**2)*rh**4 + (1 + 15*Oh**2)*rh**6)*sinx**5)*(6*sinx*cosx**5*(-1 + Oh**2*rh**2)*rh**5 - cosx**6*rh**6 + 20*cosx**3*(-1 + Oh**2*rh**2)*rh**3*sinx**3 + (-1 + Oh**2*rh**2)*sinx**2*(15*rh**4 + 15*(1 - 2*rh**2)*rh**2*sinx**2 + (1 - 15*rh**2 + 15*rh**4)*sinx**4) + 6*cosx*rh*(-1 + Oh**2*rh**2)*sinx**5)**(-1)

    H_analytic = -(Oh**2*rh**8*(cosx*rh + sinx)**(-4)*(-1 + Oh**2*rh**2)**(-1))
    W_analytic = -(Oh*rh**6*(6*sinx*cosx**5*(-1 + Oh**2*rh**2)*rh**5 - cosx**6*rh**6 + 20*cosx**3*(-1 + Oh**2*rh**2)*rh**3*sinx**3 + (-1 + Oh**2*rh**2)*sinx**2*(15*rh**4 + 15*(1 - 2*rh**2)*rh**2*sinx**2 + (1 - 15*rh**2 + 15*rh**4)*sinx**4) + 6*cosx*rh*(-1 + Oh**2*rh**2)*sinx**5)**(-1))

    return {"F" : F_analytic, "B" : B_analytic, "H" : H_analytic, "W" : W_analytic, "f": f_ana, "b" : b_ana, "h_tilde" : b_ana, "w": w_ana}

