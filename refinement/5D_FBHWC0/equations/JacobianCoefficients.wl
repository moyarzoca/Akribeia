(* Created with the Wolfram Language : www.wolfram.com *)
Function[{F, B, H, W, dF, dB, dH, dW, ddB, ddH, C0}, 
 <|"eq1" -> <|"F" -> 4*(1 + B*cosx2)*R*((cosx5*dH + 3*R)*R3*sinx - 
        cosx2^2*H*R2*sinx*(-1 + 2*R*sinx)) - 3*cosx2^2*(1 + cosx2*F)*R3*sinx*
       (cosx5*dH + 2*R - 2*cosx4*H*sinx)*(1 + cosx*dB*sinx + 
        B*(cosx2 - 2*sinx2))*\[Alpha] - (3*C0^2*(1 + B*cosx2)*cosx4^2*R2*R5*
        sinx*\[Alpha])/((cosx4*H + R2)*(-R4 + 3*cosx6*H*\[Alpha] + 
          cosx2*R2*(-1 + sinx)*\[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) - 
      (2*C0^2*(1 + B*cosx2)*cosx4^2*R2*R5*sinx*\[Alpha]*
        (R4 - 3*cosx6*H*\[Alpha] - 3*cosx4*F*R2*sinx*\[Alpha] - 
         cosx2*R2*(-1 + 3*sinx)*\[Alpha]))/((cosx4*H + R2)*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^3) + cosx2*(1 + cosx*dB*sinx + 
        B*(cosx2 - 2*sinx2))*(4*cosx2*(cosx4*H + R2)^2*\[Alpha] + 
        R3*(cosx5*dH + 2*R - 2*cosx4*H*sinx)*(R2 + 4*cosx2*\[Alpha] - 
          3*cosx2*(1 + cosx2*F)*sinx*\[Alpha]) + R*(cosx4*H + R2)*
         (4*R3 - 3*cosx7*dH*\[Alpha] - 6*cosx2*R*\[Alpha] + 
          6*cosx6*H*sinx*\[Alpha])), 
    "B" -> 4*cosx2*R*(cosx6*H^2 + R3*(cosx3*dH*sinx + F*(cosx5*dH + 3*R)*
           sinx - (3*R)/(1 + sinx)) + cosx2*H*R2*(-2 + sinx - 
          cosx2*F*sinx*(-1 + 2*R*sinx) - 2*R*sinx2)) + 
      (C0^2*cosx2*cosx4*R5*(R4 - 3*cosx6*H*\[Alpha] - 3*cosx4*F*R2*sinx*
          \[Alpha] - cosx2*R2*(-1 + 3*sinx)*\[Alpha]))/
       ((cosx4*H + R2)*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
           \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) + 
      (1 + cosx2*F)*(cosx2 - 2*sinx2)*(4*cosx2*(cosx4*H + R2)^2*\[Alpha] + 
        R3*(cosx5*dH + 2*R - 2*cosx4*H*sinx)*(R2 + 4*cosx2*\[Alpha] - 
          3*cosx2*(1 + cosx2*F)*sinx*\[Alpha]) + R*(cosx4*H + R2)*
         (4*R3 - 3*cosx7*dH*\[Alpha] - 6*cosx2*R*\[Alpha] + 
          6*cosx6*H*sinx*\[Alpha])), 
    "H" -> 4*(1 + B*cosx2)*R*(2*cosx6*H + cosx2*R2*(-2 + sinx - 
          cosx2*F*sinx*(-1 + 2*R*sinx) - 2*R*sinx2)) - 
      (3*C0^2*(1 + B*cosx2)*cosx4*cosx6*R5*\[Alpha])/
       ((cosx4*H + R2)*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
           \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) - 
      (6*C0^2*(1 + B*cosx2)*cosx4*cosx6*R5*\[Alpha]*
        (R4 - 3*cosx6*H*\[Alpha] - 3*cosx4*F*R2*sinx*\[Alpha] - 
         cosx2*R2*(-1 + 3*sinx)*\[Alpha]))/((cosx4*H + R2)*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^3) - (C0^2*(1 + B*cosx2)*cosx4^2*R5*
        (R4 - 3*cosx6*H*\[Alpha] - 3*cosx4*F*R2*sinx*\[Alpha] - 
         cosx2*R2*(-1 + 3*sinx)*\[Alpha]))/((cosx4*H + R2)^2*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^2) + (1 + cosx2*F)*
       (1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*
       (8*cosx2*cosx4*(cosx4*H + R2)*\[Alpha] + 6*cosx6*R*(cosx4*H + R2)*sinx*
         \[Alpha] - 2*cosx4*R3*sinx*(R2 + 4*cosx2*\[Alpha] - 
          3*cosx2*(1 + cosx2*F)*sinx*\[Alpha]) + 
        cosx4*R*(4*R3 - 3*cosx7*dH*\[Alpha] - 6*cosx2*R*\[Alpha] + 
          6*cosx6*H*sinx*\[Alpha])), "W" -> 0, "dF" -> 0, 
    "dB" -> cosx*(1 + cosx2*F)*sinx*(4*cosx2*(cosx4*H + R2)^2*\[Alpha] + 
       R3*(cosx5*dH + 2*R - 2*cosx4*H*sinx)*(R2 + 4*cosx2*\[Alpha] - 
         3*cosx2*(1 + cosx2*F)*sinx*\[Alpha]) + R*(cosx4*H + R2)*
        (4*R3 - 3*cosx7*dH*\[Alpha] - 6*cosx2*R*\[Alpha] + 
         6*cosx6*H*sinx*\[Alpha])), 
    "dH" -> 4*(1 + B*cosx2)*R*R3*(cosx3*sinx + cosx5*F*sinx) + 
      (1 + cosx2*F)*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*
       (-3*cosx7*R*(cosx4*H + R2)*\[Alpha] + 
        cosx5*R3*(R2 + 4*cosx2*\[Alpha] - 3*cosx2*(1 + cosx2*F)*sinx*
           \[Alpha])), "dW" -> 0, "ddB" -> 0, "ddH" -> 0, 
    "C0" -> (2*C0*(1 + B*cosx2)*cosx4*R5*(R4 - 3*cosx6*H*\[Alpha] - 
        3*cosx4*F*R2*sinx*\[Alpha] - cosx2*R2*(-1 + 3*sinx)*\[Alpha]))/
      ((cosx4*H + R2)*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
          \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2)|>, 
  "eq2" -> <|"F" -> 12*R8*sinx*(-cosx + rh*sinx) + 3*cosx^16*dH*H^2*R2*
       \[Alpha] - (C0^2*cosx3*cosx4*R2*R6*sinx*\[Alpha])/
       (R4 - 3*cosx6*H*\[Alpha] - cosx2*R2*(-1 + sinx)*\[Alpha] - 
         cosx4*F*R2*sinx*\[Alpha])^2 + cosx^15*(-4*H^3*R*\[Alpha] + 
        3*dH^2*H*R2*sinx*\[Alpha] - H^2*R*(-6*(ddH - 2*H)*R*sinx*\[Alpha] + 
          6*H*R*sinx*\[Alpha])) + cosx^14*(3*dH*F*H*R4*sinx*\[Alpha] - 
        H*sinx*(-3*dH*F*R4*\[Alpha] + 12*dH*H*R2*sinx*\[Alpha]) - 
        H^2*R*(6*dH*R*sinx2*\[Alpha] + sinx*(24*dH*\[Alpha] + 
            36*dH*R*sinx*\[Alpha]))) + cosx10*(3*dH*F*R2*R4*sinx*\[Alpha] - 
        4*dH*H*R4*sinx2*(4*\[Alpha] - 2*sinx*\[Alpha]) - 
        R2*sinx*(-3*dH*F*R4*\[Alpha] + 12*dH*H*R2*sinx*\[Alpha]) - 
        2*H*R*R2*(6*dH*R*sinx2*\[Alpha] + sinx*(24*dH*\[Alpha] + 
            36*dH*R*sinx*\[Alpha])) - H*(24*dH*R4*sinx3*\[Alpha] + 
          dH*R4*(R2 - 8*sinx2*\[Alpha]) + sinx*(-12*dH*R3*\[Alpha] - 
            48*dH*R4*sinx*\[Alpha] + 6*dH*R4*sinx2*\[Alpha]))) + 
      cosx6*(4*dH*R*R4*sinx*(4*\[Alpha] - 2*sinx*\[Alpha]) - 
        R*R4*(6*dH*R*sinx2*\[Alpha] + sinx*(24*dH*\[Alpha] + 
            36*dH*R*sinx*\[Alpha])) - R2*(24*dH*R4*sinx3*\[Alpha] + 
          dH*R4*(R2 - 8*sinx2*\[Alpha]) + sinx*(-12*dH*R3*\[Alpha] - 
            48*dH*R4*sinx*\[Alpha] + 6*dH*R4*sinx2*\[Alpha]))) + 
      cosx*(4*R2*R4*sinx*(4*\[Alpha] - 2*sinx*\[Alpha]) - 
        4*R6*(-6*sinx*\[Alpha] - 2*R*sinx2*\[Alpha]) - 
        R*R4*(4*R4 + 36*R*sinx*\[Alpha] + 12*R2*sinx2*\[Alpha]) - 
        R2*(-8*R4*sinx2*\[Alpha] + 2*R5*(R2 - 8*sinx2*\[Alpha]) + 
          sinx*(4*R4*\[Alpha] + 12*R*R4*sinx2*\[Alpha]))) + 
      cosx^11*(-12*H^2*R3*\[Alpha] + 3*dH^2*R4*sinx*\[Alpha] + 
        R4*sinx*(-8*F*H^2*sinx3*\[Alpha] + dH^2*(4*\[Alpha] - 
            2*sinx*\[Alpha])) + R*(6*H^2*R2*\[Alpha] - 
          2*H*R2*(-6*(ddH - 2*H)*R*sinx*\[Alpha] + 6*H*R*sinx*\[Alpha])) - 
        H*(-8*H*R4*sinx*\[Alpha] - 2*R4*sinx2*(2*(ddH - 2*H) + 12*F*H*sinx2)*
           \[Alpha] + sinx*(8*(ddH - 2*H)*R4*\[Alpha] + 6*H*R4*sinx*
             \[Alpha] - 12*F*H*R4*sinx*sinx2*\[Alpha] + 6*H*R4*sinx*
             (1 - 2*F*sinx2)*\[Alpha]))) + 
      cosx^13*(-2*dH^2*F*R4*sinx2*\[Alpha] - 4*H^3*(-6*sinx*\[Alpha] - 
          2*R*sinx2*\[Alpha]) - H^2*R*(-12*H*R*sinx*sinx2*\[Alpha] + 
          sinx*(-48*H*sinx*\[Alpha] - 36*H*R*sinx2*\[Alpha])) - 
        H*(-4*F*(ddH - 2*H)*R4*sinx2*\[Alpha] + 
          sinx*(6*F*H*R4*sinx*\[Alpha] - 12*H^2*R2*sinx2*\[Alpha] + 
            R4*(-3*dF*dH*sinx*\[Alpha] + 6*F*H*sinx*\[Alpha])))) + 
      cosx4*(4*dH*R2*R5*sinx - R2*(-2*dH*R2*R4*sinx2 + 
          sinx*(-12*dH*R6*sinx + R4*(4*dH*R - 6*dF*R*sinx*\[Alpha])))) + 
      cosx9*(-12*H^2*R2*(-6*sinx*\[Alpha] - 2*R*sinx2*\[Alpha]) + 
        R4*sinx*(dH^2*R2 + 4*H^2*sinx2*(4*\[Alpha] - 2*sinx*\[Alpha])) - 
        R2*(-4*F*(ddH - 2*H)*R4*sinx2*\[Alpha] + 
          sinx*(6*F*H*R4*sinx*\[Alpha] - 12*H^2*R2*sinx2*\[Alpha] + 
            R4*(-3*dF*dH*sinx*\[Alpha] + 6*F*H*sinx*\[Alpha]))) - 
        H*(-24*H*R4*sinx2^2*\[Alpha] - 2*H*R4*sinx*(R2 - 8*sinx2*\[Alpha]) + 
          sinx*(-12*F*R5*\[Alpha] + 24*H*R3*sinx*\[Alpha] - 
            12*H*R4*sinx*sinx2*\[Alpha] + 2*R4*((ddH - 2*H)*R2 + 
              24*H*sinx2*\[Alpha]))) + 
        R*(-(H^2*(4*R4 + 36*R*sinx*\[Alpha] + 12*R2*sinx2*\[Alpha])) - 
          2*H*R2*(-12*H*R*sinx*sinx2*\[Alpha] + sinx*(-48*H*sinx*\[Alpha] - 
              36*H*R*sinx2*\[Alpha])))) + 
      cosx5*(-8*H*R*R4*sinx^2*(4*\[Alpha] - 2*sinx*\[Alpha]) - 
        12*H*R4*(-6*sinx*\[Alpha] - 2*R*sinx2*\[Alpha]) - 
        H*(-8*R4*sinx2*\[Alpha] + 2*R5*(R2 - 8*sinx2*\[Alpha]) + 
          sinx*(4*R4*\[Alpha] + 12*R*R4*sinx2*\[Alpha])) - 
        R2*(-24*H*R4*sinx2^2*\[Alpha] - 2*H*R4*sinx*(R2 - 8*sinx2*\[Alpha]) + 
          sinx*(-12*F*R5*\[Alpha] + 24*H*R3*sinx*\[Alpha] - 
            12*H*R4*sinx*sinx2*\[Alpha] + 2*R4*((ddH - 2*H)*R2 + 
              24*H*sinx2*\[Alpha]))) + 
        R*(-2*H*R2*(4*R4 + 36*R*sinx*\[Alpha] + 12*R2*sinx2*\[Alpha]) - 
          R4*(-12*H*R*sinx*sinx2*\[Alpha] + sinx*(-48*H*sinx*\[Alpha] - 
              36*H*R*sinx2*\[Alpha])))) + cosx^12*(6*dH*H*R*R3*\[Alpha] + 
        8*dH*F*H*R4*sinx3*\[Alpha] - H*(4*dH*R4*\[Alpha] + 
          24*dH*F*R4*sinx3*\[Alpha] + sinx*(-3*dH*R4*\[Alpha] + 
            6*dH*F*R4*sinx2*\[Alpha] + R4*(6*dF*H*sinx2*\[Alpha] - 
              3*dH*(1 - 2*F*sinx2)*\[Alpha])))) + 
      cosx8*(3*dH*R*R5*\[Alpha] + R4*sinx*(-4*dH*H*R2*sinx - 
          8*dH*F*R*sinx*\[Alpha]) - H*(-2*dH*R2*R4*sinx2 + 
          sinx*(-12*dH*R6*sinx + R4*(4*dH*R - 6*dF*R*sinx*\[Alpha]))) - 
        R2*(4*dH*R4*\[Alpha] + 24*dH*F*R4*sinx3*\[Alpha] + 
          sinx*(-3*dH*R4*\[Alpha] + 6*dH*F*R4*sinx2*\[Alpha] + 
            R4*(6*dF*H*sinx2*\[Alpha] - 3*dH*(1 - 2*F*sinx2)*\[Alpha])))) + 
      cosx7*(-12*H*R5*\[Alpha] + R4*sinx*(4*H^2*R2*sinx2 + 
          16*F*H*R*sinx2*\[Alpha]) + R*(-(H^2*(4*R3*sinx - 8*R4*sinx2)) + 
          12*H*R2^2*\[Alpha] - R4*(-6*(ddH - 2*H)*R*sinx*\[Alpha] + 
            6*H*R*sinx*\[Alpha])) - R2*(-8*H*R4*sinx*\[Alpha] - 
          2*R4*sinx2*(2*(ddH - 2*H) + 12*F*H*sinx2)*\[Alpha] + 
          sinx*(8*(ddH - 2*H)*R4*\[Alpha] + 6*H*R4*sinx*\[Alpha] - 
            12*F*H*R4*sinx*sinx2*\[Alpha] + 6*H*R4*sinx*(1 - 2*F*sinx2)*
             \[Alpha])) - H*(-8*F*R4*sinx2*\[Alpha] + 
          R4*(4*H*R2*sinx*sinx2 + 8*R*\[Alpha]) + 
          sinx*(12*H*R6*sinx2 - 6*R5*\[Alpha] + 12*F*R*R4*sinx2*\[Alpha] + 
            R4*(-8*H*R*sinx - 6*R*(1 - 2*F*sinx2)*\[Alpha])))) + 
      cosx3*(-(H*(12*R6*sinx - 4*R7*sinx2)) - 4*R7*\[Alpha] + 
        R*(-2*H*R2*(4*R3*sinx - 8*R4*sinx2) + 6*R2*R4*\[Alpha]) + 
        R4*sinx*(-8*H*R*R2*sinx - 8*F*R2*sinx*\[Alpha]) - 
        R2*(-8*F*R4*sinx2*\[Alpha] + R4*(4*H*R2*sinx*sinx2 + 8*R*\[Alpha]) + 
          sinx*(12*H*R6*sinx2 - 6*R5*\[Alpha] + 12*F*R*R4*sinx2*\[Alpha] + 
            R4*(-8*H*R*sinx - 6*R*(1 - 2*F*sinx2)*\[Alpha])))), "B" -> 0, 
    "H" -> cosx4*(-8*dF*R*R6*sinx - 2*dF*R7*sinx + 2*dF*R2^2*R4*sinx2) + 
      cosx*(-12*R6 - 12*R6*sinx - 8*R3*R4*sinx^2 - 
        2*R*R2*(-16*R3 + 4*R3*sinx) - R2*sinx*(-8*R*R4*sinx + 12*R6*sinx2)) + 
      6*cosx^16*dH*F*H*R2*\[Alpha] - (3*C0^2*cosx3*cosx6*R6*\[Alpha])/
       (R4 - 3*cosx6*H*\[Alpha] - cosx2*R2*(-1 + sinx)*\[Alpha] - 
         cosx4*F*R2*sinx*\[Alpha])^2 + cosx^15*(-12*F*H^2*R*\[Alpha] - 
        18*F*H^2*R^2*sinx*\[Alpha] + 3*dH^2*F*R2*sinx*\[Alpha] - 
        2*H*R*(-3*dF*dH*R*sinx*\[Alpha] - 6*F*(ddH - 2*H)*R*sinx*\[Alpha] + 
          6*F*H*R*sinx*\[Alpha])) + cosx6*(-4*dH*R2*R4*sinx^2 - 
        20*dF*R5*sinx*\[Alpha] + R*(12*dF*R4*sinx*\[Alpha] - 
          6*dF*R*R4*sinx2*\[Alpha]) - R2*(-8*dF*R4*sinx2*\[Alpha] + 
          6*dF*R4*sinx*sinx2*\[Alpha]) - sinx*(-12*dH*R6*sinx + 
          R4*(4*dH*R - 6*dF*R*sinx*\[Alpha]))) + 
      cosx^14*(-12*dF*H^2*R*sinx*\[Alpha] - 12*dH*F*H*R2*sinx^2*\[Alpha] - 
        6*dF*H^2*R^2*sinx2*\[Alpha] - F*sinx*(-3*dH*F*R4*\[Alpha] + 
          12*dH*H*R2*sinx*\[Alpha]) - 2*H*R*(6*dF*H*R*sinx2*\[Alpha] - 
          3*dH*R*(1 - 2*F*sinx2)*\[Alpha] + F*sinx*(24*dH*\[Alpha] + 
            36*dH*R*sinx*\[Alpha]))) + cosx^12*(-4*dH*F*R4*\[Alpha] - 
        8*dH*F^2*R4*sinx3*\[Alpha] - H*sinx*(12*dH*R2*sinx*\[Alpha] + 
          6*dF*F*R4*sinx2*\[Alpha]) + R*(6*dH*F*R3*\[Alpha] - 
          2*H*sinx*(24*dH*\[Alpha] + 36*dH*R*sinx*\[Alpha])) - 
        sinx*(-3*dH*F*R4*\[Alpha] + 12*dH*H*R2*sinx*\[Alpha] + 
          F*R4*(6*dF*H*sinx2*\[Alpha] - 3*dH*(1 - 2*F*sinx2)*\[Alpha]))) + 
      cosx8*(2*dF*H*R2*R4*sinx2 - R4*(-2*dF*H*R2*sinx2 + 
          dH*R2*(1 - 2*F*sinx2)) - 12*dH*R4*sinx3*\[Alpha] - 
        4*dH*R4*sinx^2*(F*R2 + 4*\[Alpha] - sinx*\[Alpha]) - 
        R2*sinx*(12*dH*R2*sinx*\[Alpha] + 6*dF*F*R4*sinx2*\[Alpha]) + 
        R*(-8*dF*H*R4*sinx - 2*R2*sinx*(24*dH*\[Alpha] + 36*dH*R*sinx*
             \[Alpha])) - sinx*(-12*dH*R3*\[Alpha] - 48*dH*R4*sinx*\[Alpha] + 
          F*(-12*dH*R6*sinx + R4*(4*dH*R - 6*dF*R*sinx*\[Alpha])))) + 
      cosx10*(-24*dF*H*R3*sinx*\[Alpha] - 12*dH*F*R2^2*sinx^2*\[Alpha] - 
        24*dH*F*R4*sinx3*\[Alpha] - H*(-8*dF*R4*sinx2*\[Alpha] + 
          6*dF*R4*sinx*sinx2*\[Alpha]) - 4*dH*R4*sinx2*(-(F*sinx*\[Alpha]) + 
          F*(4*\[Alpha] - sinx*\[Alpha])) - R4*(-8*dF*H*sinx2*\[Alpha] + 
          dH*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha])) - 
        sinx*(F*(-12*dH*R3*\[Alpha] - 48*dH*R4*sinx*\[Alpha]) + 
          R4*(6*dF*H*sinx2*\[Alpha] - 3*dH*(1 - 2*F*sinx2)*\[Alpha])) + 
        R*(12*dF*H*R2*sinx*\[Alpha] - 12*dF*H*R*R2*sinx2*\[Alpha] - 
          2*R2*(6*dF*H*R*sinx2*\[Alpha] - 3*dH*R*(1 - 2*F*sinx2)*\[Alpha] + 
            F*sinx*(24*dH*\[Alpha] + 36*dH*R*sinx*\[Alpha])))) + 
      cosx3*(-2*R7*(1 - 2*F*sinx2) + 72*R4*sinx*\[Alpha] + 
        4*R4*sinx2*\[Alpha] - sinx*(12*F*R6 + 4*R4*\[Alpha]) - 
        8*R*R4*sinx^2*(F*R2 + 4*\[Alpha] - sinx*\[Alpha]) + 
        R*(-(R4*sinx*(-48*sinx*\[Alpha] - 36*R*sinx2*\[Alpha])) - 
          2*R2*(4*R4*(1 - 2*F*sinx2) + sinx*(4*F*R3 + 36*R*\[Alpha]))) - 
        R2*(-2*R2*R4*sinx*(1 - 2*F*sinx2) - 12*R4*sinx2^2*\[Alpha] + 
          sinx*(F*(-8*R*R4*sinx + 12*R6*sinx2) + 24*R3*sinx*\[Alpha] + 
            2*R4*(-2*R2 + 24*sinx2*\[Alpha])))) + 
      cosx^13*(2*F^2*(ddH - 2*H)*R4*sinx2*\[Alpha] - 
        12*H^2*(-6*F*sinx*\[Alpha] + R*(1 - 2*F*sinx2)*\[Alpha]) - 
        H*(4*F^2*R4*sinx2*\[Alpha] + F*sinx*(6*F*R4*sinx*\[Alpha] - 
            24*H*R2*sinx2*\[Alpha])) - sinx*(-3*dH^2*R2*\[Alpha] + 
          F*(-12*H^2*R2*sinx2*\[Alpha] + R4*(-3*dF*dH*sinx*\[Alpha] + 
              6*F*H*sinx*\[Alpha]))) - H^2*R*(6*R*sinx*(1 - 2*F*sinx2)*
           \[Alpha] + sinx*(12*R*\[Alpha] + F*(-48*sinx*\[Alpha] - 
              36*R*sinx2*\[Alpha]))) - 2*H*R*(6*H*R*sinx*(1 - 2*F*sinx2)*
           \[Alpha] + sinx*(-6*(ddH - 2*H)*R*\[Alpha] + 
            F*(-48*H*sinx*\[Alpha] - 36*H*R*sinx2*\[Alpha])))) + 
      cosx^11*(2*R4*sinx2*(2*F*(ddH - 2*H) + 6*F^2*H*sinx2)*\[Alpha] - 
        8*F^2*H*R4*sinx*sinx3*\[Alpha] - R4*(4*dF*dH*sinx*\[Alpha] - 
          8*F*H*sinx*\[Alpha]) - 4*(6*F*H*R3*\[Alpha] - 
          18*H^2*sinx*\[Alpha]) - sinx*(-12*H^2*R2*sinx2*\[Alpha] + 
          R4*(-3*dF*dH*sinx*\[Alpha] + 6*F*H*sinx*\[Alpha]) + 
          F*(8*(ddH - 2*H)*R4*\[Alpha] + 6*H*R4*sinx*(1 - 2*F*sinx2)*
             \[Alpha])) + R*(-36*F*H*R*R2*sinx*\[Alpha] - 
          2*R2*(-3*dF*dH*R*sinx*\[Alpha] - 6*F*(ddH - 2*H)*R*sinx*\[Alpha] + 
            6*F*H*R*sinx*\[Alpha]) - H^2*sinx*(-48*sinx*\[Alpha] - 
            36*R*sinx2*\[Alpha]) - 2*H*(-6*F*R2*\[Alpha] + 
            sinx*(-48*H*sinx*\[Alpha] - 36*H*R*sinx2*\[Alpha]))) - 
        H*(-8*F*R4*sinx*\[Alpha] - 2*R4*sinx2*(-4*F + 6*F^2*sinx2)*\[Alpha] + 
          sinx*(6*F*R4*sinx*\[Alpha] - 24*H*R2*sinx2*\[Alpha] + 
            F*(-16*R4*\[Alpha] + 6*R4*sinx*(1 - 2*F*sinx2)*\[Alpha])))) + 
      cosx7*(2*R4*sinx2*(2*F^2 + 6*H*sinx2)*\[Alpha] - 
        R4*(-2*H*R2*sinx*(1 - 2*F*sinx2) + 8*F*R*\[Alpha]) - 
        4*(3*F*R5*\[Alpha] - 36*H*R2*sinx*\[Alpha]) + 
        R4*sinx*(8*F^2*R*sinx2*\[Alpha] + 8*H*sinx2*(F*R2 + 4*\[Alpha] - 
            sinx*\[Alpha])) - H*(-2*R2*R4*sinx*(1 - 2*F*sinx2) - 
          12*R4*sinx2^2*\[Alpha] + sinx*(F*(-8*R*R4*sinx + 12*R6*sinx2) + 
            24*R3*sinx*\[Alpha] + 2*R4*(-2*R2 + 24*sinx2*\[Alpha]))) + 
        R*(-18*F*R*R4*sinx*\[Alpha] - 2*H*R2*sinx*(-48*sinx*\[Alpha] - 
            36*R*sinx2*\[Alpha]) - 2*H*(4*R4*(1 - 2*F*sinx2) + 
            sinx*(4*F*R3 + 36*R*\[Alpha])) - 2*R2*(-6*F*R2*\[Alpha] + 
            sinx*(-48*H*sinx*\[Alpha] - 36*H*R*sinx2*\[Alpha]))) - 
        sinx*(-6*F*R5*\[Alpha] + 24*H*R3*sinx*\[Alpha] + 
          2*R4*((ddH - 2*H)*R2 + 24*H*sinx2*\[Alpha]) + 
          F*(12*H*R6*sinx2 + R4*(-8*H*R*sinx - 6*R*(1 - 2*F*sinx2)*
               \[Alpha]))) - R2*(-8*F*R4*sinx*\[Alpha] - 
          2*R4*sinx2*(-4*F + 6*F^2*sinx2)*\[Alpha] + 
          sinx*(6*F*R4*sinx*\[Alpha] - 24*H*R2*sinx2*\[Alpha] + 
            F*(-16*R4*\[Alpha] + 6*R4*sinx*(1 - 2*F*sinx2)*\[Alpha])))) + 
      cosx5*(-(H*sinx*(-8*R*R4*sinx + 12*R6*sinx2)) + 8*F*R4*sinx2*\[Alpha] - 
        2*R5*(F*R2 + 4*\[Alpha] - 8*F*sinx2*\[Alpha]) - 
        sinx*(12*H*R6*sinx2 + 4*F*R4*\[Alpha] + 
          R4*(-8*H*R*sinx - 6*R*(1 - 2*F*sinx2)*\[Alpha])) - 
        4*(6*H*R4 + 3*R4*(-6*F*sinx*\[Alpha] + R*(1 - 2*F*sinx2)*\[Alpha])) + 
        R4*sinx*(8*H*R2*sinx2 - 8*R*sinx*(-(F*sinx*\[Alpha]) + 
            F*(4*\[Alpha] - sinx*\[Alpha]))) - 
        R2*(-2*R4*sinx2*(-2 + 12*F*sinx2)*\[Alpha] - 
          2*R4*sinx*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha]) + 
          sinx*(-16*R4*\[Alpha] + 6*R4*sinx*(1 - 2*F*sinx2)*\[Alpha] + 
            F*(24*R3*sinx*\[Alpha] + 2*R4*(-2*R2 + 24*sinx2*\[Alpha])))) + 
        R*(-2*H*(-16*R3 + 4*R3*sinx) - 2*R2*(4*F*R4 + 36*F*R*sinx*\[Alpha] - 
            6*R2*(1 - 2*F*sinx2)*\[Alpha]) - 
          R4*(6*R*sinx*(1 - 2*F*sinx2)*\[Alpha] + sinx*(12*R*\[Alpha] + 
              F*(-48*sinx*\[Alpha] - 36*R*sinx2*\[Alpha]))))) + 
      cosx9*(2*R4*sinx2*(ddH - 2*H + 12*F*H*sinx2)*\[Alpha] + 
        8*H*R4*sinx*sinx2*(-(F*sinx*\[Alpha]) + 
          F*(4*\[Alpha] - sinx*\[Alpha])) - R2*(4*F^2*R4*sinx2*\[Alpha] + 
          F*sinx*(6*F*R4*sinx*\[Alpha] - 24*H*R2*sinx2*\[Alpha])) - 
        R4*(dF*dH*R2*sinx - 2*H*sinx*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha])) - 
        4*(3*H^2*R2 + 6*H*R2*(-6*F*sinx*\[Alpha] + R*(1 - 2*F*sinx2)*
             \[Alpha])) - sinx*(8*(ddH - 2*H)*R4*\[Alpha] + 
          6*H*R4*sinx*(1 - 2*F*sinx2)*\[Alpha] + 
          F*(-6*F*R5*\[Alpha] + 24*H*R3*sinx*\[Alpha] + 
            2*R4*((ddH - 2*H)*R2 + 24*H*sinx2*\[Alpha]))) - 
        H*(-2*R4*sinx2*(-2 + 12*F*sinx2)*\[Alpha] - 
          2*R4*sinx*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha]) + 
          sinx*(-16*R4*\[Alpha] + 6*R4*sinx*(1 - 2*F*sinx2)*\[Alpha] + 
            F*(24*R3*sinx*\[Alpha] + 2*R4*(-2*R2 + 24*sinx2*\[Alpha])))) + 
        R*(-2*H*(4*F*R4 + 36*F*R*sinx*\[Alpha] - 6*R2*(1 - 2*F*sinx2)*
             \[Alpha]) - 2*H*R2*(6*R*sinx*(1 - 2*F*sinx2)*\[Alpha] + 
            sinx*(12*R*\[Alpha] + F*(-48*sinx*\[Alpha] - 36*R*sinx2*
                 \[Alpha]))) - 2*R2*(6*H*R*sinx*(1 - 2*F*sinx2)*\[Alpha] + 
            sinx*(-6*(ddH - 2*H)*R*\[Alpha] + F*(-48*H*sinx*\[Alpha] - 
                36*H*R*sinx2*\[Alpha]))))), "W" -> 0, 
    "dF" -> -(cosx5*dH*R2^2*R4*sinx) - 6*R9*sinx + 3*cosx^15*dH*H^2*R^2*sinx*
       \[Alpha] + 3*cosx^13*dH*F*H*R4*sinx^2*\[Alpha] - 
      6*cosx^12*F*H^2*R4*sinx*sinx2*\[Alpha] + 
      cosx9*(-(dH*H*R2*R4*sinx) + 3*dH*F*R2*R4*sinx^2*\[Alpha]) + 
      cosx^14*(-4*H^3*R*sinx*\[Alpha] - 6*H^3*R^2*sinx2*\[Alpha]) + 
      cosx^11*(6*dH*H*R^2*R2*sinx*\[Alpha] - H*(4*dH*R4*sinx*\[Alpha] - 
          3*dH*R4*sinx^2*\[Alpha])) + cosx7*(3*dH*R^2*R4*sinx*\[Alpha] - 
        R2*(4*dH*R4*sinx*\[Alpha] - 3*dH*R4*sinx^2*\[Alpha])) + 
      cosx2*(2*R7*sinx*\[Alpha] - R2*(8*R5*sinx*\[Alpha] - 
          6*R*R4*sinx^2*\[Alpha])) + cosx8*(-4*H^2*R*R4*sinx - 
        6*F*H*R2*R4*sinx*sinx2*\[Alpha] - H*(-2*H*R2*R4*sinx2 - 
          6*F*R*R4*sinx^2*\[Alpha])) + cosx4*(-8*H*R*R6*sinx - 2*H*R7*sinx - 
        R2*(-2*H*R2*R4*sinx2 - 6*F*R*R4*sinx^2*\[Alpha])) + 
      cosx10*(-12*H^2*R3*sinx*\[Alpha] + R*(6*H^2*R2*sinx*\[Alpha] - 
          12*H^2*R*R2*sinx2*\[Alpha]) - H*(-8*H*R4*sinx2*\[Alpha] + 
          6*H*R4*sinx*sinx2*\[Alpha])) + cosx6*(-12*H*R5*sinx*\[Alpha] - 
        H*(8*R5*sinx*\[Alpha] - 6*R*R4*sinx^2*\[Alpha]) + 
        R*(12*H*R4*sinx*\[Alpha] - 6*H*R*R4*sinx2*\[Alpha]) - 
        R2*(-8*H*R4*sinx2*\[Alpha] + 6*H*R4*sinx*sinx2*\[Alpha])), "dB" -> 0, 
    "dH" -> -(cosx5*dF*R2^2*R4*sinx) + 
      cosx2*(4*R7*sinx - R2*sinx*(4*R*R4 - 12*R6*sinx)) + 
      3*cosx^16*F*H^2*R2*\[Alpha] + cosx^15*(3*dF*H^2*R^2*sinx*\[Alpha] + 
        6*dH*F*H*R2*sinx*\[Alpha]) + cosx^13*(-2*dH*F^2*R4*sinx2*\[Alpha] - 
        H*sinx*(-6*dH*R2*\[Alpha] - 3*dF*F*R4*sinx*\[Alpha])) + 
      cosx9*(-(dF*H*R2*R4*sinx) + 2*dH*R4*sinx*(F*R2 + 4*\[Alpha] - 
          sinx*\[Alpha]) - R2*sinx*(-6*dH*R2*\[Alpha] - 3*dF*F*R4*sinx*
           \[Alpha])) + cosx7*(2*dH*R2*R4*sinx + 3*dF*R^2*R4*sinx*\[Alpha] - 
        R2*(4*dF*R4*sinx*\[Alpha] - 3*dF*R4*sinx^2*\[Alpha])) + 
      cosx^11*(6*dF*H*R^2*R2*sinx*\[Alpha] + 6*dH*F*R4*sinx*\[Alpha] - 
        H*(4*dF*R4*sinx*\[Alpha] - 3*dF*R4*sinx^2*\[Alpha]) + 
        2*dH*R4*sinx*(-(F*sinx*\[Alpha]) + F*(4*\[Alpha] - sinx*\[Alpha]))) + 
      cosx^14*(-(F*H*sinx*(-3*F*R4*\[Alpha] + 12*H*R2*sinx*\[Alpha])) - 
        H^2*R*(-3*R*(1 - 2*F*sinx2)*\[Alpha] + F*sinx*(24*\[Alpha] + 
            36*R*sinx*\[Alpha]))) + 
      cosx4*(4*R5*sinx*(F*R2 + 4*\[Alpha] - sinx*\[Alpha]) - 
        R*R4*sinx*(24*\[Alpha] + 36*R*sinx*\[Alpha]) - 
        R2*(R2*R4*(1 - 2*F*sinx2) + 12*R4*sinx3*\[Alpha] + 
          sinx*(F*(4*R*R4 - 12*R6*sinx) - 12*R3*\[Alpha] - 
            48*R4*sinx*\[Alpha]))) + cosx^12*(4*F^2*H*R4*sinx3*\[Alpha] + 
        R*(6*F*H*R3*\[Alpha] - H^2*sinx*(24*\[Alpha] + 36*R*sinx*\[Alpha])) - 
        H*(4*F*R4*\[Alpha] + 12*F^2*R4*sinx3*\[Alpha] + 
          sinx*(-3*F*R4*\[Alpha] + 12*H*R2*sinx*\[Alpha] - 
            3*F*R4*(1 - 2*F*sinx2)*\[Alpha]))) + 
      cosx8*(R4*sinx*(-4*F^2*R*sinx*\[Alpha] - 4*H*sinx*(F*R2 + 4*\[Alpha] - 
            sinx*\[Alpha])) + R*(3*F*R5*\[Alpha] - 2*H*R2*sinx*
           (24*\[Alpha] + 36*R*sinx*\[Alpha])) - 
        H*(R2*R4*(1 - 2*F*sinx2) + 12*R4*sinx3*\[Alpha] + 
          sinx*(F*(4*R*R4 - 12*R6*sinx) - 12*R3*\[Alpha] - 
            48*R4*sinx*\[Alpha])) - R2*(4*F*R4*\[Alpha] + 
          12*F^2*R4*sinx3*\[Alpha] + sinx*(-3*F*R4*\[Alpha] + 
            12*H*R2*sinx*\[Alpha] - 3*F*R4*(1 - 2*F*sinx2)*\[Alpha]))) + 
      cosx10*(-(F*R2*sinx*(-3*F*R4*\[Alpha] + 12*H*R2*sinx*\[Alpha])) - 
        4*H*R4*sinx2*(-(F*sinx*\[Alpha]) + F*(4*\[Alpha] - sinx*\[Alpha])) - 
        2*H*R*R2*(-3*R*(1 - 2*F*sinx2)*\[Alpha] + 
          F*sinx*(24*\[Alpha] + 36*R*sinx*\[Alpha])) - 
        H*(24*F*R4*sinx3*\[Alpha] + R4*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha]) + 
          sinx*(-3*R4*(1 - 2*F*sinx2)*\[Alpha] + F*(-12*R3*\[Alpha] - 
              48*R4*sinx*\[Alpha])))) + 
      cosx6*(-(H*sinx*(4*R*R4 - 12*R6*sinx)) - 
        R*R4*(-3*R*(1 - 2*F*sinx2)*\[Alpha] + F*sinx*(24*\[Alpha] + 
            36*R*sinx*\[Alpha])) + R4*sinx*(-4*H*R2*sinx + 
          4*R*(-(F*sinx*\[Alpha]) + F*(4*\[Alpha] - sinx*\[Alpha]))) - 
        R2*(24*F*R4*sinx3*\[Alpha] + R4*(F*R2 + 4*(1 - 2*F*sinx2)*\[Alpha]) + 
          sinx*(-3*R4*(1 - 2*F*sinx2)*\[Alpha] + F*(-12*R3*\[Alpha] - 
              48*R4*sinx*\[Alpha])))), "dW" -> 0, "ddB" -> 0, 
    "ddH" -> -2*cosx3*R2^2*R4*sinx + 6*cosx^15*F*H^2*R^2*sinx*\[Alpha] + 
      cosx^13*(6*H^2*R^2*sinx*\[Alpha] + 2*F^2*H*R4*sinx2*\[Alpha]) + 
      cosx^11*(12*F*H*R^2*R2*sinx*\[Alpha] - H*(8*F*R4*sinx*\[Alpha] - 
          4*F*R4*sinx2*\[Alpha])) + cosx7*(-2*H*R2*R4*sinx + 
        6*F*R^2*R4*sinx*\[Alpha] - R2*(8*F*R4*sinx*\[Alpha] - 
          4*F*R4*sinx2*\[Alpha])) + cosx9*(12*H*R^2*R2*sinx*\[Alpha] + 
        2*F^2*R2*R4*sinx2*\[Alpha] - H*(-2*R4*sinx2*\[Alpha] + 
          sinx*(2*F*R2*R4 + 8*R4*\[Alpha]))) + 
      cosx5*(6*R^2*R4*sinx*\[Alpha] - R2*(-2*R4*sinx2*\[Alpha] + 
          sinx*(2*F*R2*R4 + 8*R4*\[Alpha]))), 
    "C0" -> (-2*C0*cosx3*R6)/(R4 - 3*cosx6*H*\[Alpha] - 
       cosx2*R2*(-1 + sinx)*\[Alpha] - cosx4*F*R2*sinx*\[Alpha])|>, 
  "eq3" -> <|"F" -> -4*(1 + B*cosx2)^2*R2*(cosx2*R + sinx - 2*R*sinx2) - 
      2*cosx2*cosx4*(1 + cosx2*F)*R2*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))^
        2*\[Alpha] - cosx2^2*(cosx*dB - 2*B*sinx)*(2 + cosx*dB*sinx + 
        B*(2*cosx2 - 2*sinx2))*(-R4 + 3*cosx6*H*\[Alpha] - 
        cosx2*R2*\[Alpha]) + 2*(cosx + B*cosx3)^2*sinx*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) - 
      cosx2*(1 + B*cosx2)*(cosx*dB - 2*B*sinx)*(cosx2 - 2*sinx2)*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) - 
      (3*(C0 + B*C0*cosx2)^2*cosx4^2*R2*R4*sinx*\[Alpha])/
       ((cosx4*H + R2)^2*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
           \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) + 
      (6*(C0 + B*C0*cosx2)^2*cosx4^2*R2*R4*sinx*\[Alpha]*
        (-R4 + 5*cosx6*H*\[Alpha] + cosx4*F*R2*sinx*\[Alpha] + 
         cosx2*R2*(1 + sinx)*\[Alpha]))/((cosx4*H + R2)^2*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^3) + (1 + B*cosx2)*(1 + cosx2*F)*
       (2*cosx2^2*R2*sinx*(2*cosx3*dB - 3*sinx + cosx2*ddB*sinx - 
          6*cosx*dB*sinx2 + B*(-9*cosx2*sinx + 6*sinx3))*\[Alpha] - 
        R2*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*(-3*cosx6*\[Alpha] + 
          6*cosx4*sinx2*\[Alpha])) + cosx2*(1 + B*cosx2)*
       (2*cosx2*(1 + cosx2*F)*R2*sinx*(2*cosx3*dB - 3*sinx + cosx2*ddB*sinx - 
          6*cosx*dB*sinx2 + B*(-9*cosx2*sinx + 6*sinx3))*\[Alpha] - 
        2*(2*cosx3*dB - 3*sinx + cosx2*ddB*sinx - 6*cosx*dB*sinx2 + 
          B*(-9*cosx2*sinx + 6*sinx3))*(R4 - 3*cosx6*H*\[Alpha] + 
          cosx2*R2*\[Alpha]) - R2*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*
         (4*R - 3*cosx6*F*\[Alpha] - 3*cosx5*dF*sinx*\[Alpha] + 
          3*cosx4*(-1 + 2*F*sinx2)*\[Alpha])), 
    "B" -> -8*cosx2*(1 + B*cosx2)*(3*cosx2*H + 
        R2*(R + cosx*dF*R*sinx - (1 + sinx)^(-1)) + 
        F*R2*(cosx2*R + sinx - 2*R*sinx2)) - 2*cosx4*(1 + cosx2*F)^2*R2*
       (1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*(cosx2 - 2*sinx2)*\[Alpha] + 
      2*cosx2*(1 + cosx2*F)*sinx*(2 + cosx*dB*sinx + B*(2*cosx2 - 2*sinx2))*
       (-R4 + 3*cosx6*H*\[Alpha] - cosx2*R2*\[Alpha]) - 
      cosx2*(1 + cosx2*F)*(cosx*dB - 2*B*sinx)*(2*cosx2 - 2*sinx2)*
       (-R4 + 3*cosx6*H*\[Alpha] - cosx2*R2*\[Alpha]) - 
      2*cosx3*(cosx + B*cosx3)*(cosx*dF - 2*F*sinx)*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) + 
      2*cosx2*(1 + B*cosx2)*sinx*(1 + cosx*dF*sinx + F*(cosx2 - 2*sinx2))*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) - 
      cosx2^2*(cosx*dB - 2*B*sinx)*(1 + cosx*dF*sinx + F*(cosx2 - 2*sinx2))*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) - 
      (6*C0*cosx2*(C0 + B*C0*cosx2)*cosx4*R4*(-R4 + 5*cosx6*H*\[Alpha] + 
         cosx4*F*R2*sinx*\[Alpha] + cosx2*R2*(1 + sinx)*\[Alpha]))/
       ((cosx4*H + R2)^2*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
           \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) + 
      cosx2*(1 + cosx2*F)*(2*cosx2*(1 + cosx2*F)*R2*sinx*
         (2*cosx3*dB - 3*sinx + cosx2*ddB*sinx - 6*cosx*dB*sinx2 + 
          B*(-9*cosx2*sinx + 6*sinx3))*\[Alpha] - 
        2*(2*cosx3*dB - 3*sinx + cosx2*ddB*sinx - 6*cosx*dB*sinx2 + 
          B*(-9*cosx2*sinx + 6*sinx3))*(R4 - 3*cosx6*H*\[Alpha] + 
          cosx2*R2*\[Alpha]) - R2*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*
         (4*R - 3*cosx6*F*\[Alpha] - 3*cosx5*dF*sinx*\[Alpha] + 
          3*cosx4*(-1 + 2*F*sinx2)*\[Alpha])) + (1 + B*cosx2)*(1 + cosx2*F)*
       (2*cosx2*(1 + cosx2*F)*R2*sinx*(-9*cosx2*sinx + 6*sinx3)*\[Alpha] - 
        2*(-9*cosx2*sinx + 6*sinx3)*(R4 - 3*cosx6*H*\[Alpha] + 
          cosx2*R2*\[Alpha]) - R2*(cosx2 - 2*sinx2)*
         (4*R - 3*cosx6*F*\[Alpha] - 3*cosx5*dF*sinx*\[Alpha] + 
          3*cosx4*(-1 + 2*F*sinx2)*\[Alpha])), 
    "H" -> -12*cosx2*(1 + B*cosx2)^2 + 3*(cosx + B*cosx3)^2*cosx6*
       (cosx*dF - 2*F*sinx)*\[Alpha] + 3*cosx2*(1 + B*cosx2)*cosx6*
       (cosx*dB - 2*B*sinx)*(1 + cosx*dF*sinx + F*(cosx2 - 2*sinx2))*
       \[Alpha] - 3*cosx2*cosx6*(1 + cosx2*F)*(cosx*dB - 2*B*sinx)*
       (2 + cosx*dB*sinx + B*(2*cosx2 - 2*sinx2))*\[Alpha] + 
      6*(1 + B*cosx2)*cosx6*(1 + cosx2*F)*(2*cosx3*dB - 3*sinx + 
        cosx2*ddB*sinx - 6*cosx*dB*sinx2 + B*(-9*cosx2*sinx + 6*sinx3))*
       \[Alpha] - (15*(C0 + B*C0*cosx2)^2*cosx4*cosx6*R4*\[Alpha])/
       ((cosx4*H + R2)^2*(-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*
           \[Alpha] + cosx4*F*R2*sinx*\[Alpha])^2) + 
      (18*(C0 + B*C0*cosx2)^2*cosx4*cosx6*R4*\[Alpha]*
        (-R4 + 5*cosx6*H*\[Alpha] + cosx4*F*R2*sinx*\[Alpha] + 
         cosx2*R2*(1 + sinx)*\[Alpha]))/((cosx4*H + R2)^2*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^3) + (6*(C0 + B*C0*cosx2)^2*cosx4^2*R4*
        (-R4 + 5*cosx6*H*\[Alpha] + cosx4*F*R2*sinx*\[Alpha] + 
         cosx2*R2*(1 + sinx)*\[Alpha]))/((cosx4*H + R2)^3*
        (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
          cosx4*F*R2*sinx*\[Alpha])^2), "W" -> 0, 
    "dF" -> -4*cosx*(1 + B*cosx2)^2*R*R2*sinx + 3*(1 + B*cosx2)*cosx5*
       (1 + cosx2*F)*R2*sinx*(1 + cosx*dB*sinx + B*(cosx2 - 2*sinx2))*
       \[Alpha] - cosx*(cosx + B*cosx3)^2*(R4 - 3*cosx6*H*\[Alpha] + 
        cosx2*R2*\[Alpha]) - cosx*cosx2*(1 + B*cosx2)*sinx*
       (cosx*dB - 2*B*sinx)*(R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]), 
    "dB" -> -2*cosx*cosx4*(1 + cosx2*F)^2*R2*sinx*(1 + cosx*dB*sinx + 
        B*(cosx2 - 2*sinx2))*\[Alpha] - cosx*cosx2*(1 + cosx2*F)*sinx*
       (cosx*dB - 2*B*sinx)*(-R4 + 3*cosx6*H*\[Alpha] - cosx2*R2*\[Alpha]) - 
      cosx*cosx2*(1 + cosx2*F)*(2 + cosx*dB*sinx + B*(2*cosx2 - 2*sinx2))*
       (-R4 + 3*cosx6*H*\[Alpha] - cosx2*R2*\[Alpha]) - 
      cosx*cosx2*(1 + B*cosx2)*(1 + cosx*dF*sinx + F*(cosx2 - 2*sinx2))*
       (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) + 
      (1 + B*cosx2)*(1 + cosx2*F)*(2*cosx2*(1 + cosx2*F)*R2*sinx*
         (2*cosx3 - 6*cosx*sinx2)*\[Alpha] - 2*(2*cosx3 - 6*cosx*sinx2)*
         (R4 - 3*cosx6*H*\[Alpha] + cosx2*R2*\[Alpha]) - 
        cosx*R2*sinx*(4*R - 3*cosx6*F*\[Alpha] - 3*cosx5*dF*sinx*\[Alpha] + 
          3*cosx4*(-1 + 2*F*sinx2)*\[Alpha])), "dH" -> 0, "dW" -> 0, 
    "ddB" -> (1 + B*cosx2)*(1 + cosx2*F)*(2*cosx2^2*(1 + cosx2*F)*R2*sinx^2*
        \[Alpha] - 2*cosx2*sinx*(R4 - 3*cosx6*H*\[Alpha] + 
         cosx2*R2*\[Alpha])), "ddH" -> 0, 
    "C0" -> (-6*(1 + B*cosx2)*(C0 + B*C0*cosx2)*cosx4*R4*
       (-R4 + 5*cosx6*H*\[Alpha] + cosx4*F*R2*sinx*\[Alpha] + 
        cosx2*R2*(1 + sinx)*\[Alpha]))/((cosx4*H + R2)^2*
       (-R4 + 3*cosx6*H*\[Alpha] + cosx2*R2*(-1 + sinx)*\[Alpha] + 
         cosx4*F*R2*sinx*\[Alpha])^2)|>, 
  "eq4" -> <|"F" -> -1/2*(cosx*cosx2*dW*(cosx4*H + R2)^(3/2)*R4)/
        Sqrt[1 + cosx2*F] + (2*cosx2*(cosx4*H + R2)^(3/2)*R4*sinx*W)/
       Sqrt[1 + cosx2*F] + (3*cosx2*cosx7*dW*H*(cosx4*H + R2)^(3/2)*\[Alpha])/
       (2*Sqrt[1 + cosx2*F]) - (cosx2*cosx3*dW*R2*(cosx4*H + R2)^(3/2)*
        \[Alpha])/(2*Sqrt[1 + cosx2*F]) + 
      (cosx2*cosx3*dW*R2*(cosx4*H + R2)^(3/2)*sinx*\[Alpha])/
       (2*Sqrt[1 + cosx2*F]) + (cosx2*cosx5*dW*F*R2*(cosx4*H + R2)^(3/2)*sinx*
        \[Alpha])/(2*Sqrt[1 + cosx2*F]) + cosx5*dW*Sqrt[1 + cosx2*F]*R2*
       (cosx4*H + R2)^(3/2)*sinx*\[Alpha] - 
      (6*cosx2*cosx6*H*(cosx4*H + R2)^(3/2)*sinx*W*\[Alpha])/
       Sqrt[1 + cosx2*F] + (2*cosx2^2*R2*(cosx4*H + R2)^(3/2)*sinx*W*
        \[Alpha])/Sqrt[1 + cosx2*F] - (2*cosx2^2*R2*(cosx4*H + R2)^(3/2)*
        sinx2*W*\[Alpha])/Sqrt[1 + cosx2*F] - 
      (2*cosx2*cosx4*F*R2*(cosx4*H + R2)^(3/2)*sinx2*W*\[Alpha])/
       Sqrt[1 + cosx2*F] - 4*cosx4*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*
       sinx2*W*\[Alpha], "B" -> (C0*cosx2*R2)/(2*Sqrt[1 + B*cosx2]), 
    "H" -> (-3*cosx*cosx4*dW*Sqrt[1 + cosx2*F]*Sqrt[cosx4*H + R2]*R4)/2 + 
      6*cosx4*Sqrt[1 + cosx2*F]*Sqrt[cosx4*H + R2]*R4*sinx*W + 
      (9*cosx4*cosx7*dW*Sqrt[1 + cosx2*F]*H*Sqrt[cosx4*H + R2]*\[Alpha])/2 - 
      (3*cosx3*cosx4*dW*Sqrt[1 + cosx2*F]*R2*Sqrt[cosx4*H + R2]*\[Alpha])/2 + 
      3*cosx7*dW*Sqrt[1 + cosx2*F]*(cosx4*H + R2)^(3/2)*\[Alpha] + 
      (3*cosx3*cosx4*dW*Sqrt[1 + cosx2*F]*R2*Sqrt[cosx4*H + R2]*sinx*
        \[Alpha])/2 + (3*cosx4*cosx5*dW*F*Sqrt[1 + cosx2*F]*R2*
        Sqrt[cosx4*H + R2]*sinx*\[Alpha])/2 - 18*cosx4*cosx6*
       Sqrt[1 + cosx2*F]*H*Sqrt[cosx4*H + R2]*sinx*W*\[Alpha] + 
      6*cosx2*cosx4*Sqrt[1 + cosx2*F]*R2*Sqrt[cosx4*H + R2]*sinx*W*\[Alpha] - 
      12*cosx6*Sqrt[1 + cosx2*F]*(cosx4*H + R2)^(3/2)*sinx*W*\[Alpha] - 
      6*cosx2*cosx4*Sqrt[1 + cosx2*F]*R2*Sqrt[cosx4*H + R2]*sinx2*W*
       \[Alpha] - 6*cosx4^2*F*Sqrt[1 + cosx2*F]*R2*Sqrt[cosx4*H + R2]*sinx2*W*
       \[Alpha], "W" -> 4*Sqrt[1 + cosx2*F]*(cosx4*H + R2)^(3/2)*R4*sinx - 
      12*cosx6*Sqrt[1 + cosx2*F]*H*(cosx4*H + R2)^(3/2)*sinx*\[Alpha] + 
      4*cosx2*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*sinx*\[Alpha] - 
      4*cosx2*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*sinx2*\[Alpha] - 
      4*cosx4*F*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*sinx2*\[Alpha], 
    "dF" -> 0, "dB" -> 0, "dH" -> 0, 
    "dW" -> -(cosx*Sqrt[1 + cosx2*F]*(cosx4*H + R2)^(3/2)*R4) + 
      3*cosx7*Sqrt[1 + cosx2*F]*H*(cosx4*H + R2)^(3/2)*\[Alpha] - 
      cosx3*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*\[Alpha] + 
      cosx3*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*sinx*\[Alpha] + 
      cosx5*F*Sqrt[1 + cosx2*F]*R2*(cosx4*H + R2)^(3/2)*sinx*\[Alpha], 
    "ddB" -> 0, "ddH" -> 0, "C0" -> Sqrt[1 + B*cosx2]*R2|>|>]
