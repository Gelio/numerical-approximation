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

minNoiseMultiplier = 1;
maxNoiseMultiplier = 1;

minNoiseConstant = 0;
maxNoiseConstant = 0;



% *Koniec konfiguracji*

% Wartosci w punktach pomiarow
y = f(x);
% Generowanie "szumu"
if maxNoiseConstant == minNoiseConstant
    noiseConstants = maxNoiseConstant;
else
    noiseConstants = randi((maxNoiseConstant - minNoiseConstant), size(y));
end
if maxNoiseMultiplier == minNoiseMultiplier
    noiseMultipliers = maxNoiseMultiplier;
else
    noiseMultipliers = randi((maxNoiseMultiplier - minNoiseMultiplier) * 100, size(y)) / 100 + minNoiseMultiplier;
end
yWithNoise = y .* noiseMultipliers + noiseConstants;

plotApproximation(x, yWithNoise, pointsCount, paddingMultiplier);

% Dodanie wykresu funkcji f
currentAxis = axis;
rangeX = linspace(currentAxis(1), currentAxis(2), pointsCount);
functionValues = f(rangeX);

hold on;
plot(rangeX, functionValues, 'm', 'DisplayName', 'Funkcja aproksymowana');

% Zmiana zakresu osi
newAxis = currentAxis;
newAxis(3) = min(currentAxis(3), min(functionValues));
newAxis(4) = max(currentAxis(4), max(functionValues));
axis(newAxis);

% Uaktualnienie legendy
legend('off');
legend('show');
