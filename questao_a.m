t = linspace(1,25,25);
y = [5.0291 6.5099 5.3666 4.1272 4.2948 6.1261 12.5140 10.0502 9.1614 7.5677 7.2920 10.0357 11.0708 13.4045 12.8415 11.9666 11.0765 11.7774 14.5701 17.0440 17.0398 15.9069 15.4850 15.5112 17.6572];

matrizF = eye(2);
matriz_todo = [ones(1,25); t];

a11 = 25;
matrizF(1, 1) = a11;
a12 = 0;
a22 = 0;

for i = 1:25
  a12 = a12 + matriz_todo(2, i);
  a22 = a22 + matriz_todo(2, i)^2;
endfor
matrizF(1, 2) = a12;
matrizF(2, 1) = a12;
matrizF(2, 2) = a22;

matrizF

matrizb = [1; 1];
b1 = 0;
b2 = 0;

for i = 1:25
  b1 = b1 + (y(i)*matriz_todo(1, i));
  b2 = b2 + (y(i)*matriz_todo(2, i));
endfor

matrizb(1,1) = b1;
matrizb(2,1) = b2;

matrizb

valor_coef = matrizF \ matrizb

 %parte residuo;

y_previsto = valor_coef(1) + valor_coef(2) * t;

residuos = y_previsto - y;


plot(t, residuos, 'o-'); % 'o-' faz a linha com as bolinhas marcando os pontos
title('Residuos do Item A');
grid on;

