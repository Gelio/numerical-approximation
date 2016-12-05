% plotApproximation(x, f, pointsCount, paddingMultiplier) - funkcja
% rysujaca wykres elementu optymalnego na podstawie punktow pomiaru (x, f).
% Wartosci funkcji sa obliczane w pointsCount punktach. Dodatkowo mozna
% okreslic odstep od skrajnych punktow pomiaru, na ktorych tez wartosci
% zostana obliczone.
%
% Wejscie:
% * x, f - wektory dlugosci m >= 4 zawierajace punkty pomiarowe
% * pointsCount - ilosc punktow na ilu zostana obliczone wartosci do
% wykresu (domyslnie 500)
% * paddingMultiplier - odstep od skrajnych punktow pomiaru, na ktorych tez
% wartosci zostana obliczone (domyslnie 0.2)
%
% Wyjscie:
% brak, zostaje narysowany wykres
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function plotApproximation(x, f, pointsCount, paddingMultiplier)
if nargin == 2
    pointsCount = 500;
end
if nargin <= 3
    paddingMultiplier = 0.1667;
end

% Obliczenie elementow ukladu rownan G * alfa = F
[G, F] = computeApproximationEquation(x, f);

% Rozwiazanie ukladu rownan G * alfa = F
alfa = computeApproximationCoefficients(G, F);

% Sporzadzenie elementu optymalnego
fOpt = composeApproximationFunction(alfa);


% Przygotowanie argumentow do wykresu
minX = min(x);
maxX = max(x);
% Powiekszenie obszaru, na ktorym obliczone beda wartosci funkcji
% aproksymujacej
distance = maxX - minX;
padding = distance * paddingMultiplier;

plotX = linspace(min(x) - padding, max(x) + padding, pointsCount);
approximatedValues = fOpt(plotX);

% Naniesienie wartosci na wykres
figure;
grid on;
plot(x, f, 'r.', 'MarkerSize', 10, 'DisplayName', 'Punkty pomiarowe');
hold on;
grid on;
plot(plotX, approximatedValues, 'DisplayName', 'Element optymalny (funkcja aproksymuj¹ca)');

% Opis wykresu
title('Aproksymacja dyskretna z baz¹ 1, x, x^2, sin x');
%legend('Punkty pomiarowe', 'Element optymalny (funkcja aproksymuj¹ca)');
legend('show');
xlabel('x - argumenty');
ylabel('y - wartoœci funkcji');
xlim([min(plotX) max(plotX)]);

end

