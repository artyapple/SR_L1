function y = GuitarDistortion (x, Typ, D)

switch Typ
    case 1
        y = tanh(D*x);
    case 2
        z = D*x;
        y = -sign(-z).*(1-exp(sign(-z).*z));
    otherwise
        disp('Typ ist ungültig! "1": Tangens Hyperbolicus "2": nach Bendiksen')
end


return