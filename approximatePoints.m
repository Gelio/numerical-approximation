% Skrypt do testowania zadania aproksymacji (dla konkretnych punktów)
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% *Konfiguracja*
% Argumenty punktow pomiarow
x = [-1 1 2 4 11 5 10];
% Wartosci w punktach pomiarow
f = [10 11 10 5 100 14 2];

% Ilosc punktow na wykresie
pointsCount = 500;

% Dodatkowy odstep od skrajnych punktow pomiaru, na ktorych tez zostanie
% narysowany wykres
paddingMultiplier = 0.2;

% *Koniec konfiguracji*

plotApproximation(x, f, pointsCount, paddingMultiplier);