(* Created with the Wolfram Language : www.wolfram.com *)
Function[{F, B, H, W, dF, dB, dH, dW, ddB, ddH, C0}, 
 <|"eq1" -> <|"F" -> 4*(B*cosx^4 + (1 + cosx^2)*sinx)*
       (-6*cosx^14*H^2*R^3*sinx*\[Alpha] + R^6*(-10*R^3*sinx - 
          2*cosx^6*R^2*sinx*(cosx*dH - 4*H*sinx) + 30*cosx^6*R*sinx*
           (-1 + F*sinx)*\[Alpha] + 6*cosx^8*sinx^2*(cosx^4*F + 
            (1 + cosx^2)*sinx)*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          6*cosx^12*sinx*(-1 + F*sinx)*(cosx*dH - 4*H*sinx)*\[Alpha]) + 
        cosx^2*H*R^4*(-6*cosx^4*R^3*sinx + 6*cosx^12*sinx*
           (cosx*dH - 4*H*sinx)*\[Alpha] + 3*cosx^2*R*(-4*cosx^4*sinx + 
            2*cosx^4*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha])) - 
      (C0^2*cosx^6*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*
        (-18*cosx^6*R^6*sinx*\[Alpha] + 54*cosx^14*H*R^2*sinx*\[Beta] + 
         9*cosx^4*R^4*(-6*cosx^4*sinx + 10*cosx^4*sinx^2*(cosx^4*F + 
             (1 + cosx^2)*sinx))*\[Beta]))/((cosx^6*H + R^2)*
        (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
          9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 6*cosx^8*H*R^2*
           (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^2) + 
      (2*C0^2*cosx^6*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*
        (-6*cosx^6*R^6*sinx*\[Alpha] + 18*cosx^14*H*R^2*sinx*\[Beta] + 
         18*cosx^12*R^4*sinx*(-1 + F*sinx)*\[Beta])*
        (R^8 + 6*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
          \[Alpha] + 45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*
          (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
           5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
            (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
       ((cosx^6*H + R^2)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
          45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
          6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
         3) + (cosx^4*F + (1 + cosx^2)*sinx)*(4*sinx + cosx*dB*sinx + 
        B*(cosx^2 - 4*sinx^2))*(72*cosx^20*H^2*R^2*sinx*\[Beta] + 
        2*cosx^6*H*R^3*(12*cosx^6*R^3*sinx*\[Alpha] + 18*cosx^8*R*sinx*
           \[Beta] - 27*cosx^14*sinx*(cosx*dH - 4*H*sinx)*\[Beta]) - 
        R^5*(-60*cosx^6*R^3*sinx*\[Alpha] - 18*cosx^12*R^2*sinx*
           (cosx*dH - 4*H*sinx)*\[Alpha] + 180*cosx^12*R*sinx*(-1 + F*sinx)*
           \[Beta] + 9*cosx^10*(cosx*dH - 4*H*sinx)*(-6*cosx^4*sinx + 
            10*cosx^4*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])) + 
      cosx^4*(4*sinx + cosx*dB*sinx + B*(cosx^2 - 4*sinx^2))*
       (72*cosx^22*H^3*\[Beta] - 9*cosx^16*H^2*R*
         (5*cosx^6*(cosx*dH - 4*H*sinx) + 
          R*(2 - 8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)))*\[Beta] + 
        2*cosx^6*H*R^3*(-4*R^5 + 3*cosx^8*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          6*cosx^2*R^3*(-3 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] + 18*cosx^8*R*(-1 + F*sinx)*\[Beta] + 
          9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx))*\[Beta]) - 
        R^5*(10*R^5 + cosx^6*R^4*(cosx*dH - 4*H*sinx) - 
          60*cosx^6*R^3*(-1 + F*sinx)*\[Alpha] + 6*cosx^8*R^2*
           (cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] + 90*cosx^12*R*(-1 + F*sinx)^2*\[Beta] + 
          9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 6*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx) + 5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*
           \[Beta])), "B" -> 4*cosx^4*(3*cosx^16*H^3*R*\[Alpha] + 
        R^6*(-10*R^3*(-1 + F*sinx) - 2*cosx^2*R^2*sinx*(cosx^4*F + 
            (1 + cosx^2)*sinx)*(cosx*dH - 4*H*sinx) + 15*cosx^6*R*
           (-1 + F*sinx)^2*\[Alpha] + 6*cosx^8*sinx*(cosx^4*F + 
            (1 + cosx^2)*sinx)*(-1 + F*sinx)*(cosx*dH - 4*H*sinx)*\[Alpha]) - 
        cosx^4*H^2*(2*cosx^4*R^5 + 3*cosx^6*R^3*
           (1 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha]) + 
        cosx^2*H*R^4*(2*R^3*(4 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)) + 
          6*cosx^8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(cosx*dH - 4*H*sinx)*
           \[Alpha] + 3*cosx^2*R*(3 - 4*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
            sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Alpha])) - 
      (C0^2*cosx^10*R^9*(R^8 + 6*cosx^2*R^6*
          (1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha] + 
         45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*
          (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
           5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
            (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
       ((cosx^6*H + R^2)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
          45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
          6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
         2) + (cosx^4*F + (1 + cosx^2)*sinx)*(cosx^2 - 4*sinx^2)*
       (72*cosx^22*H^3*\[Beta] - 9*cosx^16*H^2*R*
         (5*cosx^6*(cosx*dH - 4*H*sinx) + 
          R*(2 - 8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)))*\[Beta] + 
        2*cosx^6*H*R^3*(-4*R^5 + 3*cosx^8*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          6*cosx^2*R^3*(-3 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] + 18*cosx^8*R*(-1 + F*sinx)*\[Beta] + 
          9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx))*\[Beta]) - 
        R^5*(10*R^5 + cosx^6*R^4*(cosx*dH - 4*H*sinx) - 
          60*cosx^6*R^3*(-1 + F*sinx)*\[Alpha] + 6*cosx^8*R^2*
           (cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] + 90*cosx^12*R*(-1 + F*sinx)^2*\[Beta] + 
          9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 6*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx) + 5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*
           \[Beta])), "H" -> 4*(B*cosx^4 + (1 + cosx^2)*sinx)*
       (9*cosx^16*H^2*R*\[Alpha] - 24*cosx^10*H*R^4*sinx^2*
         (cosx^4*F + (1 + cosx^2)*sinx)*\[Alpha] + 
        R^6*(8*cosx^2*R^2*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx) - 
          24*cosx^8*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)*(-1 + F*sinx)*
           \[Alpha]) - 2*cosx^4*H*(2*cosx^4*R^5 + 3*cosx^6*R^3*
           (1 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha]) + 
        cosx^2*R^4*(2*R^3*(4 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)) + 
          6*cosx^8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(cosx*dH - 4*H*sinx)*
           \[Alpha] + 3*cosx^2*R*(3 - 4*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
            sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Alpha])) - 
      (C0^2*cosx^6*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*(90*cosx^16*H*\[Beta] + 
         6*cosx^8*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
            (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
       ((cosx^6*H + R^2)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
          45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
          6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
         2) + (2*C0^2*cosx^6*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*
        (90*cosx^16*H*\[Beta] + 6*cosx^8*R^2*(-(R^2*\[Alpha]) + 
           3*cosx^6*(-1 + F*sinx)*\[Beta]))*
        (R^8 + 6*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
          \[Alpha] + 45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*
          (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
           5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
            (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
       ((cosx^6*H + R^2)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
          45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
          6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
         3) + (C0^2*cosx^12*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*
        (R^8 + 6*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
          \[Alpha] + 45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*
          (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
           5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
            (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
       ((cosx^6*H + R^2)^2*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
          45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
          6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
         2) + (cosx^4*F + (1 + cosx^2)*sinx)*(4*sinx + cosx*dB*sinx + 
        B*(cosx^2 - 4*sinx^2))*(216*cosx^22*H^2*\[Beta] + 
        180*cosx^22*H^2*R*sinx*\[Beta] - 18*cosx^16*H*R*
         (5*cosx^6*(cosx*dH - 4*H*sinx) + 
          R*(2 - 8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)))*\[Beta] + 
        2*cosx^6*H*R^3*(-12*cosx^8*R^2*sinx*\[Alpha] - 36*cosx^10*sinx*
           (1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta]) + 
        2*cosx^6*R^3*(-4*R^5 + 3*cosx^8*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          6*cosx^2*R^3*(-3 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] + 18*cosx^8*R*(-1 + F*sinx)*\[Beta] + 
          9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx))*\[Beta]) - R^5*(-4*cosx^6*R^4*sinx - 
          24*cosx^8*R^2*sinx*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
           \[Alpha] - 36*cosx^10*sinx*(1 - 6*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx) + 5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*
           \[Beta])), "W" -> 0, "dF" -> 0, 
    "dB" -> cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
      (72*cosx^22*H^3*\[Beta] - 9*cosx^16*H^2*R*
        (5*cosx^6*(cosx*dH - 4*H*sinx) + 
         R*(2 - 8*sinx*(cosx^4*F + (1 + cosx^2)*sinx)))*\[Beta] + 
       2*cosx^6*H*R^3*(-4*R^5 + 3*cosx^8*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
         6*cosx^2*R^3*(-3 + 2*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha] + 
         18*cosx^8*R*(-1 + F*sinx)*\[Beta] + 9*cosx^10*(cosx*dH - 4*H*sinx)*
          (1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta]) - 
       R^5*(10*R^5 + cosx^6*R^4*(cosx*dH - 4*H*sinx) - 
         60*cosx^6*R^3*(-1 + F*sinx)*\[Alpha] + 6*cosx^8*R^2*
          (cosx*dH - 4*H*sinx)*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
          \[Alpha] + 90*cosx^12*R*(-1 + F*sinx)^2*\[Beta] + 
         9*cosx^10*(cosx*dH - 4*H*sinx)*(1 - 6*sinx*(cosx^4*F + 
             (1 + cosx^2)*sinx) + 5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*
          \[Beta])), "dH" -> 4*(B*cosx^4 + (1 + cosx^2)*sinx)*
       (6*cosx^11*H*R^4*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*\[Alpha] + 
        R^6*(-2*cosx^3*R^2*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
          6*cosx^9*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(-1 + F*sinx)*
           \[Alpha])) + (cosx^4*F + (1 + cosx^2)*sinx)*
       (4*sinx + cosx*dB*sinx + B*(cosx^2 - 4*sinx^2))*
       (-45*cosx^23*H^2*R*\[Beta] + 2*cosx^6*H*R^3*(3*cosx^9*R^2*\[Alpha] + 
          9*cosx^11*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta]) - 
        R^5*(cosx^7*R^4 + 6*cosx^9*R^2*(1 - 3*sinx*(cosx^4*F + 
              (1 + cosx^2)*sinx))*\[Alpha] + 9*cosx^11*
           (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
            5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta])), "dW" -> 0, 
    "ddB" -> 0, "ddH" -> 0, 
    "C0" -> (-2*C0*cosx^6*R^9*(B*cosx^4 + (1 + cosx^2)*sinx)*
       (R^8 + 6*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
         \[Alpha] + 45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*
         (1 - 6*sinx*(cosx^4*F + (1 + cosx^2)*sinx) + 
          5*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2)*\[Beta] + 
        6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^2*
           (-1 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
      ((cosx^6*H + R^2)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
         45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
        2)|>, "eq2" -> <|"F" -> 10*cosx^7*H*R^11 + 
      10*R^12*(rh + 5*cosx*sinx - 5*rh*sinx^2) - 60*cosx^5*R^10*sinx*
       (-1 + F*sinx)*\[Alpha] - 20*cosx^5*R^10*sinx*
       (2*H*R*sinx - 3*\[Alpha] + 3*F*sinx*\[Alpha]) + 
      27*cosx^9*R^6*sinx^3*(cosx^4*F + (1 + cosx^2)*sinx)^2*
       (4*H - cosx^6*(cosx*dH - 4*H*sinx)^2 + 4*R*(-(cosx*dH) + 4*H*sinx) - 
        2*(cosx^6*H + R^2)*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 
          4*H*(cosx^2 - 5*sinx^2)))*\[Beta] - 
      (C0^2*cosx^5*R^10*(-6*cosx^6*R^6*sinx*\[Alpha] + 18*cosx^14*H*R^2*sinx*
          \[Beta] + 18*cosx^12*R^4*sinx*(-1 + F*sinx)*\[Beta]))/
       (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
         9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 6*cosx^8*H*R^2*
          (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^2 + 
      3*cosx^3*R^2*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2*
       (15*R^6*(cosx^2 - 4*sinx^2)*(2*R + cosx^6*(cosx*dH - 4*H*sinx))*
         \[Beta] - H*R^2*(-30*cosx^6*R^3*(cosx^2 - 4*sinx^2)*\[Beta] - 
          15*cosx^12*R^2*(cosx*dH - 4*H*sinx)*(cosx^2 - 4*sinx^2)*\[Beta])) + 
      cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
       (-72*cosx^20*H^3*R^3*(cosx^2 - 4*sinx^2)*\[Beta] - 
        6*R^8*(cosx^2 - 4*sinx^2)*(10*R + 3*cosx^6*(cosx*dH - 4*H*sinx))*
         (R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 6*cosx^6*H*R^7*
         (cosx^2 - 4*sinx^2)*(14*R^2*\[Alpha] + 3*cosx^6*R*
           (cosx*dH - 4*H*sinx)*\[Alpha] + 36*cosx^2*\[Beta]) - 
        3*cosx^6*H^2*R^2*(8*cosx^6*R^5*(cosx^2 - 4*sinx^2)*\[Alpha] + 
          36*cosx^8*R^3*(cosx^2 - 4*sinx^2)*\[Beta] - 18*cosx^14*R^2*
           (cosx*dH - 4*H*sinx)*(cosx^2 - 4*sinx^2)*\[Beta])) - 
      cosx*R*(cosx^6*H + R^2)*(-(cosx^4*R*(cosx*dH - 4*H*sinx)*
          (cosx^2 - 4*sinx^2)*(R^8 + 6*cosx^2*R^6*\[Alpha] + 
           45*cosx^16*H^2*\[Beta] + 9*cosx^4*R^4*\[Beta] - 
           6*cosx^8*H*R^2*(R^2*\[Alpha] + 3*cosx^2*\[Beta]))) + 
        2*(cosx^2 - 4*sinx^2)*(36*cosx^20*H^3*\[Beta] - 9*cosx^14*H^2*R^2*
           \[Beta] - 15*R^6*(2*R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 
          2*H*(2*cosx^4*R^8 + 9*cosx^6*R^6*\[Alpha] + 9*cosx^8*R^4*
             \[Beta]))) + 6*cosx^7*R^2*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)*
       (48*cosx^14*H^3*\[Beta] + 15*R^6*(2*R + cosx^6*(cosx*dH - 4*H*sinx))*
         ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*\[Beta] + 
        4*R^6*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 4*H*(cosx^2 - 5*sinx^2))*
         (R^2*\[Alpha] + 3*cosx^2*\[Beta]) + 2*cosx^2*R^4*
         (cosx*dH - 4*H*sinx)*(cosx^4*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          12*R*\[Beta] + 9*cosx^6*(cosx*dH - 4*H*sinx)*\[Beta]) + 
        4*cosx^6*H^2*R*(-(R^3*\[Alpha]) + 18*cosx^2*R*\[Beta] + 
          3*cosx^10*(ddH - 4*H)*R*\[Beta] - 6*cosx^9*dH*(2 + 5*R*sinx)*
           \[Beta] + 12*cosx^8*H*sinx*(4 + 5*R*sinx)*\[Beta]) - 
        H*R^2*(32*R^4*\[Alpha] + 24*cosx^2*R^2*\[Beta] + 
          72*cosx^8*R*(cosx*dH - 4*H*sinx)*\[Beta] - 
          6*cosx^14*(cosx*dH - 4*H*sinx)^2*\[Beta] - 15*cosx^12*R^2*
           (cosx*dH - 4*H*sinx)*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta] - 2*cosx^6*R^3*(-4*cosx*dH*\[Alpha] - 2*cosx^2*ddH*R*
             \[Alpha] + 20*cosx*dH*R*sinx*\[Alpha] + 
            8*H*(cosx^2*R + sinx*(2 - 5*R*sinx))*\[Alpha] + 60*sinx*\[Beta] + 
            15*cosx*dF*sinx*\[Beta] + 15*F*(cosx^2 - 4*sinx^2)*\[Beta]))) + 
      cosx^5*sinx*(720*cosx^22*H^4*\[Beta] - 
        6*R^8*(10*R + 3*cosx^6*(cosx*dH - 4*H*sinx))*((4 + cosx*dF)*sinx + 
          F*(cosx^2 - 4*sinx^2))*(R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 
        2*R^8*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 4*H*(cosx^2 - 5*sinx^2))*
         (R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]) + 
        6*cosx^14*H^3*R*(-4*R^3*\[Alpha] + 126*cosx^2*R*\[Beta] - 
          12*cosx^6*R^2*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta] - 15*cosx^8*(cosx*(-(cosx*ddH*R) + 2*dH*(4 + 5*R*sinx)) + 
            4*H*(cosx^2*R - sinx*(8 + 5*R*sinx)))*\[Beta]) - 
        R^6*(cosx*dH - 4*H*sinx)*(-4*R*(R^4 - 9*cosx^4*\[Beta]) + 
          cosx^6*(cosx*dH - 4*H*sinx)*(R^4 + 18*cosx^2*R^2*\[Alpha] + 
            45*cosx^4*\[Beta])) - 3*cosx^6*H^2*R^2*
         (-8*R^6 + 8*cosx^6*R^5*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Alpha] + 72*cosx^4*R^2*\[Beta] - 45*cosx^16*(cosx*dH - 4*H*sinx)^
            2*\[Beta] - 18*cosx^14*R^2*(cosx*dH - 4*H*sinx)*
           ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*\[Beta] + 
          18*cosx^10*R*(cosx*(-(cosx*ddH*R) + 2*dH*(7 + 5*R*sinx)) + 
            4*H*(cosx^2*R - sinx*(14 + 5*R*sinx)))*\[Beta] - 
          4*cosx^8*R^3*(2*cosx*dH*\[Alpha] - cosx^2*ddH*R*\[Alpha] + 
            10*cosx*dH*R*sinx*\[Alpha] + 4*H*(cosx^2*R - sinx*(2 + 5*R*sinx))*
             \[Alpha] - 36*sinx*\[Beta] - 9*cosx*dF*sinx*\[Beta] - 
            9*F*(cosx^2 - 4*sinx^2)*\[Beta])) + 
        2*H*R^4*(3*cosx^14*(cosx*dH - 4*H*sinx)^2*(-(R^2*\[Alpha]) + 
            27*cosx^2*\[Beta]) - 3*cosx^6*R^3*((4 + cosx*dF)*sinx + 
            F*(cosx^2 - 4*sinx^2))*(14*R^2*\[Alpha] + 3*cosx^6*R*
             (cosx*dH - 4*H*sinx)*\[Alpha] + 36*cosx^2*\[Beta]) + 
          4*cosx^6*(cosx*dH - 4*H*sinx)*(R^5 + 9*cosx^2*R^3*\[Alpha] + 
            27*cosx^4*R*\[Beta]) + R^2*(34*R^4 + 96*cosx^2*R^2*\[Alpha] + 
            18*cosx^4*\[Beta] + cosx^6*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 
              4*H*(cosx^2 - 5*sinx^2))*(-R^4 + 9*cosx^4*\[Beta])))), 
    "B" -> 0, "H" -> -40*cosx^7*H*R^8 - 80*cosx*R^10 + 
      10*cosx^7*R^8*(-4*H + F*R^3) + 10*cosx^6*dF*R^11*sinx - 
      40*cosx^5*R^11*sinx*(-1 + F*sinx) - 120*cosx^9*H*R^6*\[Alpha] - 
      120*cosx^3*R^8*\[Alpha] + 9*cosx^5*R^6*sinx^3*
       (cosx^4*F + (1 + cosx^2)*sinx)^3*(4 + 16*R*sinx + 
        8*cosx^6*sinx*(cosx*dH - 4*H*sinx) - 8*(cosx^6*H + R^2)*
         (cosx^2 - 5*sinx^2) - 2*cosx^6*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 
          4*H*(cosx^2 - 5*sinx^2)))*\[Beta] - 
      (C0^2*cosx^5*R^10*(90*cosx^16*H*\[Beta] + 6*cosx^8*R^2*
          (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta])))/
       (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
         9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 6*cosx^8*H*R^2*
          (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^2 - 
      cosx*R*(cosx^6*H + R^2)*(12*cosx^8*H*R*(cosx^6*H + R^2)*\[Alpha] + 
        4*cosx^6*H*R*(3*cosx^8*H*\[Alpha] - 
          2*(R^4 + 3*cosx^2*R^2*\[Alpha])) + 4*R*(cosx^6*H + R^2)*
         (3*cosx^8*H*\[Alpha] - 2*(R^4 + 3*cosx^2*R^2*\[Alpha])) - 
        cosx^4*R*(cosx*dH - 4*H*sinx)*((4 + cosx*dF)*sinx + 
          F*(cosx^2 - 4*sinx^2))*(90*cosx^16*H*\[Beta] - 
          6*cosx^8*R^2*(R^2*\[Alpha] + 3*cosx^2*\[Beta])) + 
        4*cosx^4*R*sinx*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
         (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
          9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
            3*cosx^2*\[Beta])) + 2*((4 + cosx*dF)*sinx + 
          F*(cosx^2 - 4*sinx^2))*(108*cosx^20*H^2*\[Beta] - 
          18*cosx^14*H*R^2*\[Beta] - 2*(2*cosx^4*R^8 + 9*cosx^6*R^6*
             \[Alpha] + 9*cosx^8*R^4*\[Beta]))) - 
      cosx^7*R*(4*H*R*(cosx^6*H + R^2)*(3*cosx^8*H*\[Alpha] - 
          2*(R^4 + 3*cosx^2*R^2*\[Alpha])) - cosx^4*R*(cosx*dH - 4*H*sinx)*
         ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
         (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
          9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
            3*cosx^2*\[Beta])) + 2*((4 + cosx*dF)*sinx + 
          F*(cosx^2 - 4*sinx^2))*(36*cosx^20*H^3*\[Beta] - 
          9*cosx^14*H^2*R^2*\[Beta] - 15*R^6*(2*R^2*\[Alpha] + 
            3*cosx^2*\[Beta]) - 2*H*(2*cosx^4*R^8 + 9*cosx^6*R^6*\[Alpha] + 
            9*cosx^8*R^4*\[Beta]))) + 3*cosx^3*R^2*sinx^2*
       (cosx^4*F + (1 + cosx^2)*sinx)^2*(144*cosx^14*H^2*\[Beta] - 
        60*cosx^6*R^6*sinx*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
         \[Beta] + 16*R^6*(cosx^2 - 5*sinx^2)*(R^2*\[Alpha] + 
          3*cosx^2*\[Beta]) + 2*cosx^2*R^4*(cosx*dH - 4*H*sinx)*
         (-4*cosx^4*R^2*sinx*\[Alpha] - 36*cosx^6*sinx*\[Beta]) - 
        8*cosx^2*R^4*sinx*(cosx^4*R^2*(cosx*dH - 4*H*sinx)*\[Alpha] + 
          12*R*\[Beta] + 9*cosx^6*(cosx*dH - 4*H*sinx)*\[Beta]) + 
        4*cosx^6*H^2*R*(-12*cosx^10*R*\[Beta] + 12*cosx^8*sinx*(4 + 5*R*sinx)*
           \[Beta]) + 8*cosx^6*H*R*(-(R^3*\[Alpha]) + 18*cosx^2*R*\[Beta] + 
          3*cosx^10*(ddH - 4*H)*R*\[Beta] - 6*cosx^9*dH*(2 + 5*R*sinx)*
           \[Beta] + 12*cosx^8*H*sinx*(4 + 5*R*sinx)*\[Beta]) - 
        H*R^2*(-16*cosx^6*R^3*(cosx^2*R + sinx*(2 - 5*R*sinx))*\[Alpha] - 
          288*cosx^8*R*sinx*\[Beta] + 48*cosx^14*sinx*(cosx*dH - 4*H*sinx)*
           \[Beta] + 60*cosx^12*R^2*sinx*((4 + cosx*dF)*sinx + 
            F*(cosx^2 - 4*sinx^2))*\[Beta]) - 
        R^2*(32*R^4*\[Alpha] + 24*cosx^2*R^2*\[Beta] + 
          72*cosx^8*R*(cosx*dH - 4*H*sinx)*\[Beta] - 
          6*cosx^14*(cosx*dH - 4*H*sinx)^2*\[Beta] - 15*cosx^12*R^2*
           (cosx*dH - 4*H*sinx)*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta] - 2*cosx^6*R^3*(-4*cosx*dH*\[Alpha] - 2*cosx^2*ddH*R*
             \[Alpha] + 20*cosx*dH*R*sinx*\[Alpha] + 
            8*H*(cosx^2*R + sinx*(2 - 5*R*sinx))*\[Alpha] + 60*sinx*\[Beta] + 
            15*cosx*dF*sinx*\[Beta] + 15*F*(cosx^2 - 4*sinx^2)*\[Beta]))) + 
      cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(2880*cosx^22*H^3*\[Beta] - 
        360*cosx^22*H^3*R*(cosx^2*R - sinx*(8 + 5*R*sinx))*\[Beta] + 
        72*cosx^6*R^8*sinx*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
         (R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 8*R^8*(cosx^2 - 5*sinx^2)*
         (R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]) + 
        4*cosx^6*R^6*sinx*(cosx*dH - 4*H*sinx)*
         (R^4 + 18*cosx^2*R^2*\[Alpha] + 45*cosx^4*\[Beta]) - 
        3*cosx^6*H^2*R^2*(-16*cosx^8*R^3*(cosx^2*R - sinx*(2 + 5*R*sinx))*
           \[Alpha] + 360*cosx^16*sinx*(cosx*dH - 4*H*sinx)*\[Beta] + 
          72*cosx^10*R*(cosx^2*R - sinx*(14 + 5*R*sinx))*\[Beta] + 
          72*cosx^14*R^2*sinx*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta]) + 18*cosx^14*H^2*R*(-4*R^3*\[Alpha] + 
          126*cosx^2*R*\[Beta] - 12*cosx^6*R^2*((4 + cosx*dF)*sinx + 
            F*(cosx^2 - 4*sinx^2))*\[Beta] - 15*cosx^8*
           (cosx*(-(cosx*ddH*R) + 2*dH*(4 + 5*R*sinx)) + 
            4*H*(cosx^2*R - sinx*(8 + 5*R*sinx)))*\[Beta]) + 
        4*R^6*sinx*(-4*R*(R^4 - 9*cosx^4*\[Beta]) + 
          cosx^6*(cosx*dH - 4*H*sinx)*(R^4 + 18*cosx^2*R^2*\[Alpha] + 
            45*cosx^4*\[Beta])) + 2*H*R^4*(36*cosx^12*R^4*sinx*
           ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*\[Alpha] - 
          24*cosx^14*sinx*(cosx*dH - 4*H*sinx)*(-(R^2*\[Alpha]) + 
            27*cosx^2*\[Beta]) + 4*cosx^6*R^2*(cosx^2 - 5*sinx^2)*
           (-R^4 + 9*cosx^4*\[Beta]) - 16*cosx^6*sinx*
           (R^5 + 9*cosx^2*R^3*\[Alpha] + 27*cosx^4*R*\[Beta])) - 
        6*cosx^6*H*R^2*(-8*R^6 + 8*cosx^6*R^5*((4 + cosx*dF)*sinx + 
            F*(cosx^2 - 4*sinx^2))*\[Alpha] + 72*cosx^4*R^2*\[Beta] - 
          45*cosx^16*(cosx*dH - 4*H*sinx)^2*\[Beta] - 18*cosx^14*R^2*
           (cosx*dH - 4*H*sinx)*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta] + 18*cosx^10*R*(cosx*(-(cosx*ddH*R) + 2*dH*(7 + 
                5*R*sinx)) + 4*H*(cosx^2*R - sinx*(14 + 5*R*sinx)))*\[Beta] - 
          4*cosx^8*R^3*(2*cosx*dH*\[Alpha] - cosx^2*ddH*R*\[Alpha] + 
            10*cosx*dH*R*sinx*\[Alpha] + 4*H*(cosx^2*R - sinx*(2 + 5*R*sinx))*
             \[Alpha] - 36*sinx*\[Beta] - 9*cosx*dF*sinx*\[Beta] - 
            9*F*(cosx^2 - 4*sinx^2)*\[Beta])) + 
        2*R^4*(3*cosx^14*(cosx*dH - 4*H*sinx)^2*(-(R^2*\[Alpha]) + 
            27*cosx^2*\[Beta]) - 3*cosx^6*R^3*((4 + cosx*dF)*sinx + 
            F*(cosx^2 - 4*sinx^2))*(14*R^2*\[Alpha] + 3*cosx^6*R*
             (cosx*dH - 4*H*sinx)*\[Alpha] + 36*cosx^2*\[Beta]) + 
          4*cosx^6*(cosx*dH - 4*H*sinx)*(R^5 + 9*cosx^2*R^3*\[Alpha] + 
            27*cosx^4*R*\[Beta]) + R^2*(34*R^4 + 96*cosx^2*R^2*\[Alpha] + 
            18*cosx^4*\[Beta] + cosx^6*(cosx*(-(cosx*ddH) + 10*dH*sinx) + 
              4*H*(cosx^2 - 5*sinx^2))*(-R^4 + 9*cosx^4*\[Beta])))), 
    "W" -> 0, "dF" -> 10*cosx^6*H*R^11*sinx + 10*R^13*sinx + 
      3*cosx^3*R^2*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2*
       (15*cosx*R^6*sinx*(2*R + cosx^6*(cosx*dH - 4*H*sinx))*\[Beta] - 
        H*R^2*(-30*cosx^7*R^3*sinx*\[Beta] - 15*cosx^13*R^2*sinx*
           (cosx*dH - 4*H*sinx)*\[Beta])) + 
      cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
       (-72*cosx^21*H^3*R^3*sinx*\[Beta] - 6*cosx*R^8*sinx*
         (10*R + 3*cosx^6*(cosx*dH - 4*H*sinx))*(R^2*\[Alpha] + 
          3*cosx^2*\[Beta]) - 6*cosx^7*H*R^7*sinx*(14*R^2*\[Alpha] + 
          3*cosx^6*R*(cosx*dH - 4*H*sinx)*\[Alpha] + 36*cosx^2*\[Beta]) - 
        3*cosx^6*H^2*R^2*(8*cosx^7*R^5*sinx*\[Alpha] + 36*cosx^9*R^3*sinx*
           \[Beta] - 18*cosx^15*R^2*sinx*(cosx*dH - 4*H*sinx)*\[Beta])) - 
      cosx*R*(cosx^6*H + R^2)*(-(cosx^5*R*sinx*(cosx*dH - 4*H*sinx)*
          (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
           9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
             3*cosx^2*\[Beta]))) + 2*cosx*sinx*(36*cosx^20*H^3*\[Beta] - 
          9*cosx^14*H^2*R^2*\[Beta] - 15*R^6*(2*R^2*\[Alpha] + 
            3*cosx^2*\[Beta]) - 2*H*(2*cosx^4*R^8 + 9*cosx^6*R^6*\[Alpha] + 
            9*cosx^8*R^4*\[Beta]))), "dB" -> 0, 
    "dH" -> 9*cosx^5*R^6*sinx^3*(cosx^4*F + (1 + cosx^2)*sinx)^3*
       (-4*cosx*R - 20*cosx*(cosx^6*H + R^2)*sinx - 
        2*cosx^7*(cosx*dH - 4*H*sinx))*\[Beta] + cosx^6*R^2*(cosx^6*H + R^2)*
       ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
       (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
        9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
          3*cosx^2*\[Beta])) + 3*cosx^3*R^2*sinx^2*
       (cosx^4*F + (1 + cosx^2)*sinx)^2*(-24*cosx^15*H^2*R*(2 + 5*R*sinx)*
         \[Beta] + 15*cosx^7*R^6*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
         \[Beta] + 40*cosx*R^6*sinx*(R^2*\[Alpha] + 3*cosx^2*\[Beta]) + 
        2*cosx^2*R^4*(cosx*dH - 4*H*sinx)*(cosx^5*R^2*\[Alpha] + 
          9*cosx^7*\[Beta]) + 2*cosx^3*R^4*(cosx^4*R^2*(cosx*dH - 4*H*sinx)*
           \[Alpha] + 12*R*\[Beta] + 9*cosx^6*(cosx*dH - 4*H*sinx)*\[Beta]) - 
        H*R^2*(-2*cosx^6*R^3*(-4*cosx*\[Alpha] + 20*cosx*R*sinx*\[Alpha]) + 
          72*cosx^9*R*\[Beta] - 12*cosx^15*(cosx*dH - 4*H*sinx)*\[Beta] - 
          15*cosx^13*R^2*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta])) + cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
       (-180*cosx^23*H^3*R*(4 + 5*R*sinx)*\[Beta] - 18*cosx^7*R^8*
         ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*(R^2*\[Alpha] + 
          3*cosx^2*\[Beta]) - 20*cosx*R^8*sinx*(R^4 + 6*cosx^2*R^2*\[Alpha] + 
          9*cosx^4*\[Beta]) - cosx^7*R^6*(cosx*dH - 4*H*sinx)*
         (R^4 + 18*cosx^2*R^2*\[Alpha] + 45*cosx^4*\[Beta]) - 
        3*cosx^6*H^2*R^2*(-4*cosx^8*R^3*(2*cosx*\[Alpha] + 
            10*cosx*R*sinx*\[Alpha]) - 90*cosx^17*(cosx*dH - 4*H*sinx)*
           \[Beta] + 36*cosx^11*R*(7 + 5*R*sinx)*\[Beta] - 
          18*cosx^15*R^2*((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*
           \[Beta]) - cosx*R^6*(-4*R*(R^4 - 9*cosx^4*\[Beta]) + 
          cosx^6*(cosx*dH - 4*H*sinx)*(R^4 + 18*cosx^2*R^2*\[Alpha] + 
            45*cosx^4*\[Beta])) + 2*H*R^4*(-9*cosx^13*R^4*
           ((4 + cosx*dF)*sinx + F*(cosx^2 - 4*sinx^2))*\[Alpha] + 
          6*cosx^15*(cosx*dH - 4*H*sinx)*(-(R^2*\[Alpha]) + 
            27*cosx^2*\[Beta]) + 10*cosx^7*R^2*sinx*
           (-R^4 + 9*cosx^4*\[Beta]) + 4*cosx^7*(R^5 + 9*cosx^2*R^3*
             \[Alpha] + 27*cosx^4*R*\[Beta]))), "dW" -> 0, "ddB" -> 0, 
    "ddH" -> 18*cosx^7*R^6*(cosx^6*H + R^2)*sinx^3*
       (cosx^4*F + (1 + cosx^2)*sinx)^3*\[Beta] + 3*cosx^3*R^2*sinx^2*
       (cosx^4*F + (1 + cosx^2)*sinx)^2*(-4*cosx^8*H*R^6*\[Alpha] + 
        12*cosx^16*H^2*R^2*\[Beta] - 4*cosx^2*R^6*(R^2*\[Alpha] + 
          3*cosx^2*\[Beta])) + cosx*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
       (90*cosx^24*H^3*R^2*\[Beta] - 2*cosx^8*H*R^6*
         (-R^4 + 9*cosx^4*\[Beta]) + 2*cosx^2*R^8*
         (R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]) - 
        3*cosx^6*H^2*R^2*(4*cosx^10*R^4*\[Alpha] - 18*cosx^12*R^2*\[Beta])), 
    "C0" -> (2*C0*cosx^5*R^10)/(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
       45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
       6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))|>, 
  "eq3" -> <|"F" -> -(cosx^4*(-((4 + cosx*dB)*sinx) + B*(-1 + 5*sinx^2))*
        (-27*cosx^16*(4 + cosx*dB)*F^2*R^4*sinx^2*\[Beta] - 
         45*cosx^16*H^2*(2 + cosx*dB + (3 - 2*cosx*dB)*sinx^2 + 
           (-1 + cosx*dB)*sinx^4)*\[Beta] + 6*cosx^10*(4 + cosx*dB)*F*R^2*
          sinx*(2*R^4*\[Alpha] - 6*cosx^8*H*\[Beta] + 
           3*R^2*(2 - 8*sinx^2 + 9*sinx^4 - 3*sinx^6)*\[Beta]) + 
         6*cosx^8*H*R^2*(R^2*(2 + 3*sinx^2 - sinx^4)*\[Alpha] + 
           3*cosx^2*(2 - 13*sinx^2 + 39*sinx^4 - 32*sinx^6 + 8*sinx^8)*
            \[Beta] - cosx*dB*(-1 + sinx^2)^2*(-(R^2*\[Alpha]) + 
             3*(-1 + 5*sinx^2 - 6*sinx^4 + 2*sinx^6)*\[Beta])) - 
         R^4*(cosx^5*dB*R^4 + 24*cosx^10*R^2*\[Alpha] + 6*cosx^11*dB*R^2*
            \[Alpha] - 24*cosx^8*R^2*sinx^2*\[Alpha] - 6*cosx^7*dB*R^2*sinx^2*
            \[Alpha] - 6*cosx^9*dB*R^2*sinx^2*\[Alpha] - R^2*(-1 + 5*sinx^2)*
            (R^2*(-2 + sinx^2) - 6*cosx^2*\[Alpha]) + 36*cosx^16*\[Beta] + 
           9*cosx^17*dB*\[Beta] - 72*cosx^12*sinx^2*\[Beta] - 
           72*cosx^14*sinx^2*\[Beta] - 18*cosx^13*dB*sinx^2*\[Beta] - 
           18*cosx^15*dB*sinx^2*\[Beta] + cosx^4*(4*R^4 + 
             6*R^2*(-1 + 5*sinx^2)*\[Alpha] + 9*(-1 + 5*sinx^2)*\[Beta]) + 
           3*cosx^6*(-3*\[Beta] + sinx^2*(-8*R^2*\[Alpha] + 15*\[Beta]))) + 
         B*(6*cosx^8*H*R^2*(-6*F*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*\[Beta] + 
             6*sinx*(-1 + sinx^2)^3*(2 - 11*sinx^2 + 5*sinx^4)*\[Beta]) + 
           R^4*(27*F^2*sinx*(-1 + sinx^2)^8*(-1 + 5*sinx^2)*\[Beta] - 
             6*F*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*(-2*R^2*\[Alpha] + 3*
                (-2 + 8*sinx^2 - 9*sinx^4 + 3*sinx^6)*\[Beta]) - 
             3*(-1 + sinx^2)^3*(4*R^2*sinx*(2 - 11*sinx^2 + 5*sinx^4)*
                \[Alpha] + 3*sinx*(8 - 64*sinx^2 + 148*sinx^4 - 155*sinx^6 + 
                 78*sinx^8 - 15*sinx^10)*\[Beta]))))) + 
      (B*cosx^4 + (1 + cosx^2)*sinx)*(-4*(B*cosx^4 + (1 + cosx^2)*sinx)*
         (3*cosx^6*R^4*sinx*(-1 + F*sinx)*\[Alpha] + 6*cosx^8*H*R^2*
           (R + sinx - 5*R*sinx^2)*\[Alpha] + 6*cosx^6*R^5*sinx*
           ((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*\[Alpha] - 
          2*R^5*(1 - 5*sinx^2)*(R^2 - 3*cosx^6*(-1 + F*sinx)*\[Alpha]) + 
          3*R^4*sinx*(-2*R^2 + cosx^6*(-1 + F*sinx)*\[Alpha])) + 
        45*cosx^8*R^4*sinx*(cosx^4*F + (1 + cosx^2)*sinx)^2*(1 - 5*sinx^2)*
         ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*\[Beta] + 
        54*cosx^4*R^4*sinx^2*(-1 + sinx^2)^2*(-(sinx*(-2 + sinx^2)) + 
           F*(-1 + sinx^2)^2)^2*(4 + 2*cosx*dB + ddB*sinx - 
          12*(2 + cosx*dB)*sinx^2 - ddB*sinx^3 + 5*B*sinx*(-3 + 7*sinx^2))*
         \[Beta] + 2*(cosx^4*F + (1 + cosx^2)*sinx)*((4 + cosx*dB)*sinx + 
          B*(1 - 5*sinx^2))*(27*cosx^14*H*R^2*(1 - 5*sinx^2)*\[Beta] - 
          9*cosx^6*R^4*(1 - 5*sinx^2)*(R^2*\[Alpha] + 3*cosx^2*\[Beta])) - 
        (3*C0^2*cosx^6*R^8*(B*cosx^4 + (1 + cosx^2)*sinx)*
          (-6*cosx^6*R^6*sinx*\[Alpha] + 30*cosx^14*H*R^2*sinx*\[Beta] + 
           cosx^4*R^4*(9*cosx^4*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)*
              \[Beta] + 3*cosx^4*sinx*(-2 + 3*sinx*(cosx^4*F + (1 + cosx^2)*
                  sinx))*\[Beta])))/((cosx^6*H + R^2)^2*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^2) + (6*C0^2*cosx^6*R^8*(B*cosx^4 + 
           (1 + cosx^2)*sinx)*(-6*cosx^6*R^6*sinx*\[Alpha] + 
           18*cosx^14*H*R^2*sinx*\[Beta] + 18*cosx^12*R^4*sinx*(-1 + F*sinx)*
            \[Beta])*(R^8 + 2*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*
                sinx))*\[Alpha] + 105*cosx^16*H^2*\[Beta] + 
           30*cosx^10*H*R^2*(1 + cosx^4*F*sinx + (1 + cosx^2)*sinx^2)*
            \[Beta] + cosx^4*R^4*(-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 
             3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(-2 + 3*sinx*(cosx^4*F + 
                 (1 + cosx^2)*sinx))*\[Beta])))/((cosx^6*H + R^2)^2*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^3) + 6*cosx^6*R^2*sinx*(cosx^4*F + 
          (1 + cosx^2)*sinx)*(-4*(4 + 2*cosx*dB + ddB*sinx - 
            2*(8 + 5*cosx*dB)*sinx^2 - ddB*sinx^3 + B*sinx*(-13 + 25*sinx^2))*
           (R^4*\[Alpha] - 3*cosx^8*H*\[Beta] + 3*cosx^2*R^2*\[Beta]) + 
          ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*
           (-24*cosx^8*H*sinx*\[Beta] + R^2*(8*R*(-1 + R*sinx)*\[Alpha] + 
              3*cosx^2*((8 + 20*cosx^4 + 5*cosx^5*dF)*sinx + 5*cosx^4*F*
                 (1 - 5*sinx^2))*\[Beta]))) + 
        2*cosx^4*((4 + 2*cosx*dB + ddB*sinx - 2*(8 + 5*cosx*dB)*sinx^2 - 
            ddB*sinx^3 + B*sinx*(-13 + 25*sinx^2))*
           (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
            9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
              3*cosx^2*\[Beta])) + ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*
           (-90*cosx^16*H^2*sinx*\[Beta] + 3*cosx^8*H*R^2*
             (4*R*(-1 + R*sinx)*\[Alpha] + 12*cosx^2*sinx*\[Beta] + 
              9*cosx^6*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*\[Beta]) + 
            R^4*(4*R*(R^2 + 3*cosx^2*\[Alpha]) - 9*cosx^6*((4 + cosx*dF)*
                 sinx + F*(1 - 5*sinx^2))*(R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 
              2*sinx*(R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]))))), 
    "B" -> -(cosx^4*(-((4 + cosx*dB)*sinx) + B*(-1 + 5*sinx^2))*
        (45*H^2*(-1 + sinx^2)^8*(2 + cosx*dF + (3 - 2*cosx*dF)*sinx^2 + 
           (-1 + cosx*dF)*sinx^4)*\[Beta] + 6*cosx^8*H*R^2*
          (-4*cosx^4*R^2*\[Alpha] - cosx^5*dF*R^2*\[Alpha] + 
           R^2*(1 - 5*sinx^2)*\[Alpha] + R^2*(1 - 6*sinx^2 + 5*sinx^4)*
            \[Alpha] - 3*cosx^7*dF*\[Beta] + 3*cosx^8*(1 - 5*sinx^2)*
            \[Beta] - 3*F^2*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*\[Beta] + 
           3*(-1 + sinx^2)^3*(3 + 5*sinx^2 + 2*F*sinx*(2 - 11*sinx^2 + 5*
                sinx^4))*\[Beta]) + R^4*(4*cosx^4*R^4 + cosx^5*dF*R^4 + 
           R^4*(-1 + 5*sinx^2) + R^4*(-1 + 6*sinx^2 - 5*sinx^4) + 
           6*cosx^7*dF*R^2*\[Alpha] + 9*cosx^9*dF*\[Beta] + 
           9*cosx^12*(-1 + 5*sinx^2)*\[Beta] + 9*cosx^14*(-1 + 5*sinx^2)*
            \[Beta] + 9*F^3*sinx*(-1 + sinx^2)^8*(-1 + 5*sinx^2)*\[Beta] + 
           6*cosx^8*(R^2*(-1 + 5*sinx^2)*\[Alpha] + 6*\[Beta]) - 
           3*F^2*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*(-2*R^2*\[Alpha] + 
             3*(-2 + 8*sinx^2 - 9*sinx^4 + 3*sinx^6)*\[Beta]) - 
           3*(-1 + sinx^2)^3*(2*R^2*(3 + 5*sinx^2 + 2*F*sinx*(2 - 11*sinx^2 + 
                 5*sinx^4))*\[Alpha] + 3*F*sinx*(8 - 64*sinx^2 + 148*sinx^4 - 
               155*sinx^6 + 78*sinx^8 - 15*sinx^10)*\[Beta])))) - 
      cosx^4*(-1 + 5*sinx^2)*(-9*cosx^16*(4 + cosx*dB)*F^3*R^4*sinx^2*
         \[Beta] + 3*cosx^10*(4 + cosx*dB)*F^2*R^2*sinx*
         (2*R^4*\[Alpha] - 6*cosx^8*H*\[Beta] + 3*R^2*(2 - 8*sinx^2 + 
            9*sinx^4 - 3*sinx^6)*\[Beta]) - cosx*(1 + cosx^2)*sinx*
         (45*cosx^16*(dB - dF)*H^2*\[Beta] - 6*cosx^8*H*R^2*
           ((dB - dF)*R^2*\[Alpha] - 12*cosx*\[Beta] + 12*cosx^5*\[Beta] + 
            3*cosx^6*dB*\[Beta] - 3*cosx^2*dF*\[Beta]) + 
          R^4*((dB - dF)*R^4 - 24*cosx*R^2*\[Alpha] + 24*cosx^5*R^2*
             \[Alpha] + 6*cosx^6*dB*R^2*\[Alpha] - 6*cosx^2*dF*R^2*\[Alpha] - 
            36*cosx^3*\[Beta] + 36*cosx^11*\[Beta] + 9*cosx^12*dB*\[Beta] - 
            9*cosx^4*dF*\[Beta])) + B*(45*H^2*(-1 + sinx^2)^8*
           (2 + cosx*dF + (3 - 2*cosx*dF)*sinx^2 + (-1 + cosx*dF)*sinx^4)*
           \[Beta] + 6*cosx^8*H*R^2*(-4*cosx^4*R^2*\[Alpha] - 
            cosx^5*dF*R^2*\[Alpha] + R^2*(1 - 5*sinx^2)*\[Alpha] + 
            R^2*(1 - 6*sinx^2 + 5*sinx^4)*\[Alpha] - 3*cosx^7*dF*\[Beta] + 
            3*cosx^8*(1 - 5*sinx^2)*\[Beta] - 3*F^2*(-1 + sinx^2)^5*
             (-1 + 5*sinx^2)*\[Beta] + 3*(-1 + sinx^2)^3*(3 + 5*sinx^2 + 
              2*F*sinx*(2 - 11*sinx^2 + 5*sinx^4))*\[Beta]) + 
          R^4*(4*cosx^4*R^4 + cosx^5*dF*R^4 + R^4*(-1 + 5*sinx^2) + 
            R^4*(-1 + 6*sinx^2 - 5*sinx^4) + 6*cosx^7*dF*R^2*\[Alpha] + 
            9*cosx^9*dF*\[Beta] + 9*cosx^12*(-1 + 5*sinx^2)*\[Beta] + 
            9*cosx^14*(-1 + 5*sinx^2)*\[Beta] + 9*F^3*sinx*(-1 + sinx^2)^8*
             (-1 + 5*sinx^2)*\[Beta] + 6*cosx^8*(R^2*(-1 + 5*sinx^2)*
               \[Alpha] + 6*\[Beta]) - 3*F^2*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*
             (-2*R^2*\[Alpha] + 3*(-2 + 8*sinx^2 - 9*sinx^4 + 3*sinx^6)*
               \[Beta]) - 3*(-1 + sinx^2)^3*(2*R^2*(3 + 5*sinx^2 + 
                2*F*sinx*(2 - 11*sinx^2 + 5*sinx^4))*\[Alpha] + 
              3*F*sinx*(8 - 64*sinx^2 + 148*sinx^4 - 155*sinx^6 + 78*sinx^8 - 
                15*sinx^10)*\[Beta]))) - 
        F*(45*cosx^16*H^2*(2 + cosx*dB + (3 - 2*cosx*dB)*sinx^2 + 
            (-1 + cosx*dB)*sinx^4)*\[Beta] - 6*cosx^8*H*R^2*
           (R^2*(2 + 3*sinx^2 - sinx^4)*\[Alpha] + 3*cosx^2*(2 - 13*sinx^2 + 
              39*sinx^4 - 32*sinx^6 + 8*sinx^8)*\[Beta] - 
            cosx*dB*(-1 + sinx^2)^2*(-(R^2*\[Alpha]) + 3*(-1 + 5*sinx^2 - 
                6*sinx^4 + 2*sinx^6)*\[Beta])) + 
          R^4*(cosx^5*dB*R^4 + 24*cosx^10*R^2*\[Alpha] + 6*cosx^11*dB*R^2*
             \[Alpha] - 24*cosx^8*R^2*sinx^2*\[Alpha] - 6*cosx^7*dB*R^2*
             sinx^2*\[Alpha] - 6*cosx^9*dB*R^2*sinx^2*\[Alpha] - 
            R^2*(-1 + 5*sinx^2)*(R^2*(-2 + sinx^2) - 6*cosx^2*\[Alpha]) + 
            36*cosx^16*\[Beta] + 9*cosx^17*dB*\[Beta] - 72*cosx^12*sinx^2*
             \[Beta] - 72*cosx^14*sinx^2*\[Beta] - 18*cosx^13*dB*sinx^2*
             \[Beta] - 18*cosx^15*dB*sinx^2*\[Beta] + 
            cosx^4*(4*R^4 + 6*R^2*(-1 + 5*sinx^2)*\[Alpha] + 
              9*(-1 + 5*sinx^2)*\[Beta]) + 3*cosx^6*(-3*\[Beta] + 
              sinx^2*(-8*R^2*\[Alpha] + 15*\[Beta]))))) + 
      (B*cosx^4 + (1 + cosx^2)*sinx)*(-4*cosx^4*(-6*cosx^2*H*R^4 + 
          15*cosx^10*H^2*\[Alpha] + 6*cosx^8*H*R^2*
           (-1 + (4 + cosx*dF)*R*sinx + F*(R + sinx - 5*R*sinx^2))*\[Alpha] - 
          2*R^5*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*
           (R^2 - 3*cosx^6*(-1 + F*sinx)*\[Alpha]) + 3*R^4*(-1 + F*sinx)*
           (-2*R^2 + cosx^6*(-1 + F*sinx)*\[Alpha])) + 90*cosx^4*R^4*sinx^3*
         (-3 + 7*sinx^2)*(-(sinx*(-2 + sinx^2)) + F*(-1 + sinx^2)^2)^3*
         \[Beta] - (3*C0^2*cosx^10*R^8*(R^8 + 2*cosx^2*R^6*
            (1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha] + 
           105*cosx^16*H^2*\[Beta] + 30*cosx^10*H*R^2*(1 + cosx^4*F*sinx + 
             (1 + cosx^2)*sinx^2)*\[Beta] + cosx^4*R^4*
            (-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 3*sinx*(cosx^4*F + 
               (1 + cosx^2)*sinx)*(-2 + 3*sinx*(cosx^4*F + (1 + cosx^2)*
                  sinx))*\[Beta])))/((cosx^6*H + R^2)^2*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^2) + 3*cosx^2*R^2*sinx*
         (cosx^4*F + (1 + cosx^2)*sinx)^2*(-4*sinx*(-13 + 25*sinx^2)*
           (R^4*\[Alpha] - 3*cosx^8*H*\[Beta] + 3*cosx^2*R^2*\[Beta]) + 
          (1 - 5*sinx^2)*(-24*cosx^8*H*sinx*\[Beta] + 
            R^2*(8*R*(-1 + R*sinx)*\[Alpha] + 3*cosx^2*((8 + 20*cosx^4 + 
                  5*cosx^5*dF)*sinx + 5*cosx^4*F*(1 - 5*sinx^2))*\[Beta]))) + 
        2*(cosx^4*F + (1 + cosx^2)*sinx)*(sinx*(-13 + 25*sinx^2)*
           (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
            9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
              3*cosx^2*\[Beta])) + (1 - 5*sinx^2)*(-90*cosx^16*H^2*sinx*
             \[Beta] + 3*cosx^8*H*R^2*(4*R*(-1 + R*sinx)*\[Alpha] + 
              12*cosx^2*sinx*\[Beta] + 9*cosx^6*((4 + cosx*dF)*sinx + 
                F*(1 - 5*sinx^2))*\[Beta]) + 
            R^4*(4*R*(R^2 + 3*cosx^2*\[Alpha]) - 9*cosx^6*((4 + cosx*dF)*
                 sinx + F*(1 - 5*sinx^2))*(R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 
              2*sinx*(R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]))))) + 
      cosx^4*(-4*(B*cosx^4 + (1 + cosx^2)*sinx)*(-6*cosx^2*H*R^4 + 
          15*cosx^10*H^2*\[Alpha] + 6*cosx^8*H*R^2*
           (-1 + (4 + cosx*dF)*R*sinx + F*(R + sinx - 5*R*sinx^2))*\[Alpha] - 
          2*R^5*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*
           (R^2 - 3*cosx^6*(-1 + F*sinx)*\[Alpha]) + 3*R^4*(-1 + F*sinx)*
           (-2*R^2 + cosx^6*(-1 + F*sinx)*\[Alpha])) + 18*cosx^4*R^4*sinx^2*
         (-(sinx*(-2 + sinx^2)) + F*(-1 + sinx^2)^2)^3*(4 + 2*cosx*dB + 
          ddB*sinx - 12*(2 + cosx*dB)*sinx^2 - ddB*sinx^3 + 
          5*B*sinx*(-3 + 7*sinx^2))*\[Beta] - 
        (3*C0^2*cosx^6*R^8*(B*cosx^4 + (1 + cosx^2)*sinx)*
          (R^8 + 2*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
            \[Alpha] + 105*cosx^16*H^2*\[Beta] + 30*cosx^10*H*R^2*
            (1 + cosx^4*F*sinx + (1 + cosx^2)*sinx^2)*\[Beta] + 
           cosx^4*R^4*(-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 
             3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(-2 + 3*sinx*(cosx^4*F + 
                 (1 + cosx^2)*sinx))*\[Beta])))/((cosx^6*H + R^2)^2*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^2) + 3*cosx^2*R^2*sinx*
         (cosx^4*F + (1 + cosx^2)*sinx)^2*
         (-4*(4 + 2*cosx*dB + ddB*sinx - 2*(8 + 5*cosx*dB)*sinx^2 - 
            ddB*sinx^3 + B*sinx*(-13 + 25*sinx^2))*(R^4*\[Alpha] - 
            3*cosx^8*H*\[Beta] + 3*cosx^2*R^2*\[Beta]) + 
          ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*
           (-24*cosx^8*H*sinx*\[Beta] + R^2*(8*R*(-1 + R*sinx)*\[Alpha] + 
              3*cosx^2*((8 + 20*cosx^4 + 5*cosx^5*dF)*sinx + 5*cosx^4*F*
                 (1 - 5*sinx^2))*\[Beta]))) + 
        2*(cosx^4*F + (1 + cosx^2)*sinx)*((4 + 2*cosx*dB + ddB*sinx - 
            2*(8 + 5*cosx*dB)*sinx^2 - ddB*sinx^3 + B*sinx*(-13 + 25*sinx^2))*
           (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
            9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
              3*cosx^2*\[Beta])) + ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*
           (-90*cosx^16*H^2*sinx*\[Beta] + 3*cosx^8*H*R^2*
             (4*R*(-1 + R*sinx)*\[Alpha] + 12*cosx^2*sinx*\[Beta] + 
              9*cosx^6*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*\[Beta]) + 
            R^4*(4*R*(R^2 + 3*cosx^2*\[Alpha]) - 9*cosx^6*((4 + cosx*dF)*
                 sinx + F*(1 - 5*sinx^2))*(R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 
              2*sinx*(R^4 + 6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]))))), 
    "H" -> -(cosx^4*(-((4 + cosx*dB)*sinx) + B*(-1 + 5*sinx^2))*
        (-18*cosx^18*(4 + cosx*dB)*F^2*R^2*sinx*\[Beta] - 
         cosx*(1 + cosx^2)*sinx*(90*cosx^16*(dB - dF)*H*\[Beta] - 
           6*cosx^8*R^2*((dB - dF)*R^2*\[Alpha] - 12*cosx*\[Beta] + 
             12*cosx^5*\[Beta] + 3*cosx^6*dB*\[Beta] - 3*cosx^2*dF*
              \[Beta])) + B*(90*H*(-1 + sinx^2)^8*(2 + cosx*dF + 
             (3 - 2*cosx*dF)*sinx^2 + (-1 + cosx*dF)*sinx^4)*\[Beta] + 
           6*cosx^8*R^2*(-4*cosx^4*R^2*\[Alpha] - cosx^5*dF*R^2*\[Alpha] + 
             R^2*(1 - 5*sinx^2)*\[Alpha] + R^2*(1 - 6*sinx^2 + 5*sinx^4)*
              \[Alpha] - 3*cosx^7*dF*\[Beta] + 3*cosx^8*(1 - 5*sinx^2)*
              \[Beta] - 3*F^2*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*\[Beta] + 
             3*(-1 + sinx^2)^3*(3 + 5*sinx^2 + 2*F*sinx*(2 - 11*sinx^2 + 
                 5*sinx^4))*\[Beta])) - 
         F*(90*cosx^16*H*(2 + cosx*dB + (3 - 2*cosx*dB)*sinx^2 + 
             (-1 + cosx*dB)*sinx^4)*\[Beta] - 6*cosx^8*R^2*
            (R^2*(2 + 3*sinx^2 - sinx^4)*\[Alpha] + 3*cosx^2*
              (2 - 13*sinx^2 + 39*sinx^4 - 32*sinx^6 + 8*sinx^8)*\[Beta] - 
             cosx*dB*(-1 + sinx^2)^2*(-(R^2*\[Alpha]) + 3*(-1 + 5*sinx^2 - 
                 6*sinx^4 + 2*sinx^6)*\[Beta]))))) + 
      (B*cosx^4 + (1 + cosx^2)*sinx)*(-4*(B*cosx^4 + (1 + cosx^2)*sinx)*
         (-6*cosx^2*R^4 + 30*cosx^10*H*\[Alpha] + 6*cosx^8*R^2*
           (-1 + (4 + cosx*dF)*R*sinx + F*(R + sinx - 5*R*sinx^2))*
           \[Alpha]) + 3*cosx^2*R^2*sinx*(cosx^4*F + (1 + cosx^2)*sinx)^2*
         (-24*cosx^8*sinx*((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*\[Beta] + 
          12*cosx^8*(4 + 2*cosx*dB + ddB*sinx - 2*(8 + 5*cosx*dB)*sinx^2 - 
            ddB*sinx^3 + B*sinx*(-13 + 25*sinx^2))*\[Beta]) - 
        (3*C0^2*cosx^6*R^8*(B*cosx^4 + (1 + cosx^2)*sinx)*
          (-10*cosx^8*R^4*\[Alpha] + 210*cosx^16*H*\[Beta] + 
           30*cosx^10*R^2*(1 + cosx^4*F*sinx + (1 + cosx^2)*sinx^2)*\[Beta]))/
         ((cosx^6*H + R^2)^2*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
            45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^2) + (6*C0^2*cosx^6*R^8*(B*cosx^4 + 
           (1 + cosx^2)*sinx)*(90*cosx^16*H*\[Beta] + 6*cosx^8*R^2*
            (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))*
          (R^8 + 2*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
            \[Alpha] + 105*cosx^16*H^2*\[Beta] + 30*cosx^10*H*R^2*
            (1 + cosx^4*F*sinx + (1 + cosx^2)*sinx^2)*\[Beta] + 
           cosx^4*R^4*(-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 
             3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*(-2 + 3*sinx*(cosx^4*F + 
                 (1 + cosx^2)*sinx))*\[Beta])))/((cosx^6*H + R^2)^2*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^3) + (6*C0^2*cosx^12*R^8*(B*cosx^4 + 
           (1 + cosx^2)*sinx)*(R^8 + 2*cosx^2*R^6*
            (1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Alpha] + 
           105*cosx^16*H^2*\[Beta] + 30*cosx^10*H*R^2*(1 + cosx^4*F*sinx + 
             (1 + cosx^2)*sinx^2)*\[Beta] + cosx^4*R^4*
            (-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 3*sinx*(cosx^4*F + 
               (1 + cosx^2)*sinx)*(-2 + 3*sinx*(cosx^4*F + (1 + cosx^2)*
                  sinx))*\[Beta])))/((cosx^6*H + R^2)^3*
          (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*
             \[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
            6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
               \[Beta]))^2) + 2*(cosx^4*F + (1 + cosx^2)*sinx)*
         ((4 + 2*cosx*dB + ddB*sinx - 2*(8 + 5*cosx*dB)*sinx^2 - ddB*sinx^3 + 
            B*sinx*(-13 + 25*sinx^2))*(90*cosx^16*H*\[Beta] - 
            6*cosx^8*R^2*(R^2*\[Alpha] + 3*cosx^2*\[Beta])) + 
          ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*
           (-180*cosx^16*H*sinx*\[Beta] + 3*cosx^8*R^2*
             (4*R*(-1 + R*sinx)*\[Alpha] + 12*cosx^2*sinx*\[Beta] + 
              9*cosx^6*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*\[Beta])))), 
    "W" -> 0, "dF" -> (B*cosx^4 + (1 + cosx^2)*sinx)*
       (-4*(B*cosx^4 + (1 + cosx^2)*sinx)*(6*cosx^9*H*R^3*sinx*\[Alpha] - 
          2*cosx*R^5*sinx*(R^2 - 3*cosx^6*(-1 + F*sinx)*\[Alpha])) + 
        45*cosx^9*R^4*sinx^2*(cosx^4*F + (1 + cosx^2)*sinx)^2*
         ((4 + cosx*dB)*sinx + B*(1 - 5*sinx^2))*\[Beta] + 
        2*(cosx^4*F + (1 + cosx^2)*sinx)*((4 + cosx*dB)*sinx + 
          B*(1 - 5*sinx^2))*(27*cosx^15*H*R^2*sinx*\[Beta] - 
          9*cosx^7*R^4*sinx*(R^2*\[Alpha] + 3*cosx^2*\[Beta]))) - 
      cosx^4*(-((4 + cosx*dB)*sinx) + B*(-1 + 5*sinx^2))*
       (-(cosx*(1 + cosx^2)*sinx*(-45*cosx^16*H^2*\[Beta] - 
           6*cosx^8*H*R^2*(-(R^2*\[Alpha]) - 3*cosx^2*\[Beta]) + 
           R^4*(-R^4 - 6*cosx^2*R^2*\[Alpha] - 9*cosx^4*\[Beta]))) + 
        B*(45*H^2*(-1 + sinx^2)^8*(cosx - 2*cosx*sinx^2 + cosx*sinx^4)*
           \[Beta] + 6*cosx^8*H*R^2*(-(cosx^5*R^2*\[Alpha]) - 
            3*cosx^7*\[Beta]) + R^4*(cosx^5*R^4 + 6*cosx^7*R^2*\[Alpha] + 
            9*cosx^9*\[Beta]))), 
    "dB" -> -(cosx^4*(-((4 + cosx*dB)*sinx) + B*(-1 + 5*sinx^2))*
        (-9*cosx^17*F^3*R^4*sinx^2*\[Beta] + 3*cosx^11*F^2*R^2*sinx*
          (2*R^4*\[Alpha] - 6*cosx^8*H*\[Beta] + 3*R^2*(2 - 8*sinx^2 + 
             9*sinx^4 - 3*sinx^6)*\[Beta]) - cosx*(1 + cosx^2)*sinx*
          (45*cosx^16*H^2*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
             3*cosx^6*\[Beta]) + R^4*(R^4 + 6*cosx^6*R^2*\[Alpha] + 
             9*cosx^12*\[Beta])) - F*(45*cosx^16*H^2*(cosx - 2*cosx*sinx^2 + 
             cosx*sinx^4)*\[Beta] + R^4*(cosx^5*R^4 + 6*cosx^11*R^2*
              \[Alpha] - 6*cosx^7*R^2*sinx^2*\[Alpha] - 6*cosx^9*R^2*sinx^2*
              \[Alpha] + 9*cosx^17*\[Beta] - 18*cosx^13*sinx^2*\[Beta] - 
             18*cosx^15*sinx^2*\[Beta]) + 6*cosx^9*H*R^2*(-1 + sinx^2)^2*
            (-(R^2*\[Alpha]) + 3*(-1 + 5*sinx^2 - 6*sinx^4 + 2*sinx^6)*
              \[Beta])))) + cosx^5*sinx*(-9*cosx^16*(4 + cosx*dB)*F^3*R^4*
         sinx^2*\[Beta] + 3*cosx^10*(4 + cosx*dB)*F^2*R^2*sinx*
         (2*R^4*\[Alpha] - 6*cosx^8*H*\[Beta] + 3*R^2*(2 - 8*sinx^2 + 
            9*sinx^4 - 3*sinx^6)*\[Beta]) - cosx*(1 + cosx^2)*sinx*
         (45*cosx^16*(dB - dF)*H^2*\[Beta] - 6*cosx^8*H*R^2*
           ((dB - dF)*R^2*\[Alpha] - 12*cosx*\[Beta] + 12*cosx^5*\[Beta] + 
            3*cosx^6*dB*\[Beta] - 3*cosx^2*dF*\[Beta]) + 
          R^4*((dB - dF)*R^4 - 24*cosx*R^2*\[Alpha] + 24*cosx^5*R^2*
             \[Alpha] + 6*cosx^6*dB*R^2*\[Alpha] - 6*cosx^2*dF*R^2*\[Alpha] - 
            36*cosx^3*\[Beta] + 36*cosx^11*\[Beta] + 9*cosx^12*dB*\[Beta] - 
            9*cosx^4*dF*\[Beta])) + B*(45*H^2*(-1 + sinx^2)^8*
           (2 + cosx*dF + (3 - 2*cosx*dF)*sinx^2 + (-1 + cosx*dF)*sinx^4)*
           \[Beta] + 6*cosx^8*H*R^2*(-4*cosx^4*R^2*\[Alpha] - 
            cosx^5*dF*R^2*\[Alpha] + R^2*(1 - 5*sinx^2)*\[Alpha] + 
            R^2*(1 - 6*sinx^2 + 5*sinx^4)*\[Alpha] - 3*cosx^7*dF*\[Beta] + 
            3*cosx^8*(1 - 5*sinx^2)*\[Beta] - 3*F^2*(-1 + sinx^2)^5*
             (-1 + 5*sinx^2)*\[Beta] + 3*(-1 + sinx^2)^3*(3 + 5*sinx^2 + 
              2*F*sinx*(2 - 11*sinx^2 + 5*sinx^4))*\[Beta]) + 
          R^4*(4*cosx^4*R^4 + cosx^5*dF*R^4 + R^4*(-1 + 5*sinx^2) + 
            R^4*(-1 + 6*sinx^2 - 5*sinx^4) + 6*cosx^7*dF*R^2*\[Alpha] + 
            9*cosx^9*dF*\[Beta] + 9*cosx^12*(-1 + 5*sinx^2)*\[Beta] + 
            9*cosx^14*(-1 + 5*sinx^2)*\[Beta] + 9*F^3*sinx*(-1 + sinx^2)^8*
             (-1 + 5*sinx^2)*\[Beta] + 6*cosx^8*(R^2*(-1 + 5*sinx^2)*
               \[Alpha] + 6*\[Beta]) - 3*F^2*(-1 + sinx^2)^5*(-1 + 5*sinx^2)*
             (-2*R^2*\[Alpha] + 3*(-2 + 8*sinx^2 - 9*sinx^4 + 3*sinx^6)*
               \[Beta]) - 3*(-1 + sinx^2)^3*(2*R^2*(3 + 5*sinx^2 + 
                2*F*sinx*(2 - 11*sinx^2 + 5*sinx^4))*\[Alpha] + 
              3*F*sinx*(8 - 64*sinx^2 + 148*sinx^4 - 155*sinx^6 + 78*sinx^8 - 
                15*sinx^10)*\[Beta]))) - 
        F*(45*cosx^16*H^2*(2 + cosx*dB + (3 - 2*cosx*dB)*sinx^2 + 
            (-1 + cosx*dB)*sinx^4)*\[Beta] - 6*cosx^8*H*R^2*
           (R^2*(2 + 3*sinx^2 - sinx^4)*\[Alpha] + 3*cosx^2*(2 - 13*sinx^2 + 
              39*sinx^4 - 32*sinx^6 + 8*sinx^8)*\[Beta] - 
            cosx*dB*(-1 + sinx^2)^2*(-(R^2*\[Alpha]) + 3*(-1 + 5*sinx^2 - 
                6*sinx^4 + 2*sinx^6)*\[Beta])) + 
          R^4*(cosx^5*dB*R^4 + 24*cosx^10*R^2*\[Alpha] + 6*cosx^11*dB*R^2*
             \[Alpha] - 24*cosx^8*R^2*sinx^2*\[Alpha] - 6*cosx^7*dB*R^2*
             sinx^2*\[Alpha] - 6*cosx^9*dB*R^2*sinx^2*\[Alpha] - 
            R^2*(-1 + 5*sinx^2)*(R^2*(-2 + sinx^2) - 6*cosx^2*\[Alpha]) + 
            36*cosx^16*\[Beta] + 9*cosx^17*dB*\[Beta] - 72*cosx^12*sinx^2*
             \[Beta] - 72*cosx^14*sinx^2*\[Beta] - 18*cosx^13*dB*sinx^2*
             \[Beta] - 18*cosx^15*dB*sinx^2*\[Beta] + 
            cosx^4*(4*R^4 + 6*R^2*(-1 + 5*sinx^2)*\[Alpha] + 
              9*(-1 + 5*sinx^2)*\[Beta]) + 3*cosx^6*(-3*\[Beta] + 
              sinx^2*(-8*R^2*\[Alpha] + 15*\[Beta]))))) + 
      (B*cosx^4 + (1 + cosx^2)*sinx)*(18*cosx^4*R^4*sinx^2*
         (2*cosx - 12*cosx*sinx^2)*(-(sinx*(-2 + sinx^2)) + 
           F*(-1 + sinx^2)^2)^3*\[Beta] + 3*cosx^2*R^2*sinx*
         (cosx^4*F + (1 + cosx^2)*sinx)^2*(-4*(2*cosx - 10*cosx*sinx^2)*
           (R^4*\[Alpha] - 3*cosx^8*H*\[Beta] + 3*cosx^2*R^2*\[Beta]) + 
          cosx*sinx*(-24*cosx^8*H*sinx*\[Beta] + 
            R^2*(8*R*(-1 + R*sinx)*\[Alpha] + 3*cosx^2*((8 + 20*cosx^4 + 
                  5*cosx^5*dF)*sinx + 5*cosx^4*F*(1 - 5*sinx^2))*\[Beta]))) + 
        2*(cosx^4*F + (1 + cosx^2)*sinx)*((2*cosx - 10*cosx*sinx^2)*
           (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
            9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
              3*cosx^2*\[Beta])) + cosx*sinx*(-90*cosx^16*H^2*sinx*\[Beta] + 
            3*cosx^8*H*R^2*(4*R*(-1 + R*sinx)*\[Alpha] + 12*cosx^2*sinx*
               \[Beta] + 9*cosx^6*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*
               \[Beta]) + R^4*(4*R*(R^2 + 3*cosx^2*\[Alpha]) - 
              9*cosx^6*((4 + cosx*dF)*sinx + F*(1 - 5*sinx^2))*(
                R^2*\[Alpha] + 3*cosx^2*\[Beta]) - 2*sinx*(R^4 + 
                6*cosx^2*R^2*\[Alpha] + 9*cosx^4*\[Beta]))))), "dH" -> 0, 
    "dW" -> 0, "ddB" -> (B*cosx^4 + (1 + cosx^2)*sinx)*
      (18*cosx^4*R^4*sinx^2*(sinx - sinx^3)*(-(sinx*(-2 + sinx^2)) + 
          F*(-1 + sinx^2)^2)^3*\[Beta] - 12*cosx^2*R^2*sinx*
        (cosx^4*F + (1 + cosx^2)*sinx)^2*(sinx - sinx^3)*
        (R^4*\[Alpha] - 3*cosx^8*H*\[Beta] + 3*cosx^2*R^2*\[Beta]) + 
       2*(cosx^4*F + (1 + cosx^2)*sinx)*(sinx - sinx^3)*
        (R^8 + 6*cosx^2*R^6*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
         9*cosx^4*R^4*\[Beta] - 6*cosx^8*H*R^2*(R^2*\[Alpha] + 
           3*cosx^2*\[Beta]))), "ddH" -> 0, 
    "C0" -> (-6*C0*cosx^6*R^8*(B*cosx^4 + (1 + cosx^2)*sinx)^2*
       (R^8 + 2*cosx^2*R^6*(1 - 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*
         \[Alpha] + 105*cosx^16*H^2*\[Beta] + 30*cosx^10*H*R^2*
         (1 + cosx^4*F*sinx + (1 + cosx^2)*sinx^2)*\[Beta] + 
        cosx^4*R^4*(-10*cosx^4*H*\[Alpha] - 3*\[Beta] + 
          3*sinx*(cosx^4*F + (1 + cosx^2)*sinx)*
           (-2 + 3*sinx*(cosx^4*F + (1 + cosx^2)*sinx))*\[Beta])))/
      ((cosx^6*H + R^2)^2*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
         45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta]))^
        2)|>, "eq4" -> 
   <|"F" -> Sqrt[(cosx^6*H + R^2)^3]*Sqrt[cosx^4*F + (1 + cosx^2)*sinx]*
       (cosx*dW - 6*sinx*W)*(-6*cosx^6*R^6*sinx*\[Alpha] + 
        18*cosx^14*H*R^2*sinx*\[Beta] + 18*cosx^12*R^4*sinx*(-1 + F*sinx)*
         \[Beta]) + (cosx^4*Sqrt[(cosx^6*H + R^2)^3]*(cosx*dW - 6*sinx*W)*
        (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
         9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 6*cosx^8*H*R^2*
          (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta])))/
       (2*Sqrt[cosx^4*F + (1 + cosx^2)*sinx]), 
    "B" -> -1/2*(C0*cosx^4*R^4)/Sqrt[B*cosx^4 + (1 + cosx^2)*sinx], 
    "H" -> Sqrt[(cosx^6*H + R^2)^3]*Sqrt[cosx^4*F + (1 + cosx^2)*sinx]*
       (cosx*dW - 6*sinx*W)*(90*cosx^16*H*\[Beta] + 
        6*cosx^8*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta])) + 
      (3*cosx^6*(cosx^6*H + R^2)^2*Sqrt[cosx^4*F + (1 + cosx^2)*sinx]*
        (cosx*dW - 6*sinx*W)*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 
         45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 
         6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta])))/
       (2*Sqrt[(cosx^6*H + R^2)^3]), "W" -> -6*Sqrt[(cosx^6*H + R^2)^3]*sinx*
      Sqrt[cosx^4*F + (1 + cosx^2)*sinx]*(R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*
        \[Alpha] + 45*cosx^16*H^2*\[Beta] + 9*cosx^12*R^4*(-1 + F*sinx)^2*
        \[Beta] + 6*cosx^8*H*R^2*(-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*
          \[Beta])), "dF" -> 0, "dB" -> 0, "dH" -> 0, 
    "dW" -> cosx*Sqrt[(cosx^6*H + R^2)^3]*Sqrt[cosx^4*F + (1 + cosx^2)*sinx]*
      (R^8 - 6*cosx^6*R^6*(-1 + F*sinx)*\[Alpha] + 45*cosx^16*H^2*\[Beta] + 
       9*cosx^12*R^4*(-1 + F*sinx)^2*\[Beta] + 6*cosx^8*H*R^2*
        (-(R^2*\[Alpha]) + 3*cosx^6*(-1 + F*sinx)*\[Beta])), "ddB" -> 0, 
    "ddH" -> 0, "C0" -> -(R^4*Sqrt[B*cosx^4 + (1 + cosx^2)*sinx])|>|>]
