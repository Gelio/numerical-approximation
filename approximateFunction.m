% Skrypt do testowania zadania aproksymacji (aproksymacja funkcji)
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% *Konfiguracja*
f = @(x)(x.^2);
% Argumenty punktow pomiarow
x = [-1 1 2 4 5 6];

% Ilosc punktow na wykresie
pointsCount = 500;

% Dodatkowy odstep od skrajnych punktow pomiaru, na ktorych tez zostanie
% narysowany wykres
paddingMultiplier = 0.2;

minNoiseMultiplier = 0.5;
maxNoiseMultiplier = 2;

minNoiseConstant = 0;
maxNoiseConstant = 10;



% *Koniec konfiguracji*

% Wartosci w punktach pomiarow
y = f(x);
% Generowanie "szumu"
noiseConstants = randi((maxNoiseConstant - minNoiseConstant), size(y));
noiseMultipliers = randi((maxNoiseMultiplier - minNoiseMultiplier) * 100, size(y)) / 100 + minNoiseMultiplier;
yWithNoise = y .* noiseMultipliers + noiseConstants;

plotApproximation(x, yWithNoise, pointsCount, paddingMultiplier);