% [G, F] = computeApproximationEquation(x, f) - funkcja obliczajaca
% macierz G oraz wektor F wymagane do rozwiazania ukladu rownan G*alfa = F,
% gdzie alfa jest wektorem zawierajacym wspolczynniki dla elementu
% optymalnego aproksymacji.
%
% Wejscie:
% * x - wektor dlugosci m >= 4, zawierajacy argumenty punktow pomiarowych
% * f - wektor dlugosci m >= 4, zawierajacy wartosci punktow pomiarowych
% 
% Wyjscie:
% * G - macierz 4x4 o elementach rzeczywistych
% * F - wektor dlugosci 4 o elementach rzeczywistych
% Sluza do obliczenia wspolczynnikow dla elementu optymalnego.
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [G, F] = computeApproximationEquation(x, f)
m = length(x);

% Wersja naiwna

% Obliczenie macierzy G
G = zeros(4);
xSquared = x.^2;
xCubed = xSquared .* x;
xQuad = xCubed .* x;
sinX = sin(x);

G(1, 1) = m;
G(1, 2) = sum(x);
for k=1:m
    G(1, 3) = G(1, 3) + xSquared(k);
    G(1, 4) = G(1, 4) + sinX(k);
    
    G(2, 3) = G(2, 3) + xCubed(k);
    G(2, 4) = G(2, 4) + x(k) * sinX(k);
    
    G(3, 3) = G(3, 3) + xQuad(k);
    G(3, 4) = G(3, 4) + xSquared(k) * sinX(k);
    
    G(4, 4) = G(4, 4) + sinX(k).^2;
end
G(2, 2) = G(1, 3);

% Ustawienie elementow pod diagonala (z symetrii iloczynu wektorowego)
G(2, 1) = G(1, 2);
G(3, 1) = G(1, 3);
G(3, 2) = G(2, 3);
G(4, 1) = G(1, 4);
G(4, 2) = G(2, 4);
G(4, 3) = G(3, 4);


% Obliczenie wektora F
F = zeros(4, 1);
F(1) = sum(f);
for k=1:m
    F(2) = F(2) + f(k) * x(k);
    F(3) = F(3) + f(k) * xSquared(k);
    F(4) = F(4) + f(k) * sinX(k);
end

end

