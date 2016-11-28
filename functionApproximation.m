% Skrypt do testowania zadania aproksymacji
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% *Konfiguracja*
% Argumenty punktow pomiarow
x = [-1 1 2 4 11 5 10];
% Wartosci w punktach pomiarow
f = [10 11 10 5 100 14 2];

% Ilosc punktow na wykresie
pointsCount = 500;

% *Koniec konfiguracji*





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
padding = distance / 6;

plotX = linspace(min(x) - padding, max(x) + padding, pointsCount);
approximatedValues = fOpt(plotX);

% Naniesienie wartosci na wykres
figure;
plot(x, f, 'r.', 'MarkerSize', 10);
hold on;
plot(plotX, approximatedValues);

% Opis wykresu
title('Aproksymacja dyskretna z baz¹ 1, x, x^2, sin x');
legend('Punkty pomiarowe', 'Element optymalny (funkcja aproksymuj¹ca)');
xlabel('x - argumenty');
ylabel('y - wartoœci funkcji');
xlim([min(plotX) max(plotX)]);