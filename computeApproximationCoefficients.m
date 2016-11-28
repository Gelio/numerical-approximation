% alfa = computeApproximationCoefficients(G, F) - funkcja rozwiazujaca
% uklad rownan G * alfa = F potrzebny do uzyskania wspolczynnikow dla
% elementu optymalnego aproksymacji.
%
% Wejscie:
% * G - macierz 4x4 o elementach rzeczywistych
% * F - wektor dlugosci 4 o elementach rzeczywistych
% Oba argumenty wejsciowe powinny byc uzyskane na podstawie funkcji
% `computeApproximationEquation`
%
% Wyjscie:
% * alfa - wektor dlugosci 4 zawierajacy wspolczynniki do kombinacji
% liniowej dla elementu optymalnego aproksymacji
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function alfa = computeApproximationCoefficients(G, F)
% Rozwiazanie ukladu rownan G * alfa = F
alfa = G \ F;
end

