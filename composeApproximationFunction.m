% fOpt = composeApproximationFunction(alfa) - funkcja zwracajaca element
% optymalny na podstawie podanych wspolczynnikow w wektorze alfa.
%
% Wejscie:
% * alfa - wektor dlugosci 4 zawierajacy wspolczynniki do kombinacji
% liniowej dla elementu optymalnego aproksymacji
% Powinien byc uzyskany jako wynik funkcji
% `computeApproximationCoefficients`
%
% Wyjscie:
% * fOpt - uchwyt do funkcji bedacej elementem optymalnym aproksymacji
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function fOpt = composeApproximationFunction(alfa)
% Baza: 1, x, x^2, sin x
fOpt = @(x)(alfa(1) + alfa(2) * x + alfa(3) * x.^2 + alfa(4) * sin(x));
end

