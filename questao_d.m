% ==================================================
% SCRIPT DEFINITIVO DO ITEM D (CORRIGIDO)
% Copia e Cola Tudo isso de uma vez no Octave
% ==================================================

% --- 1. DADOS ORIGINAIS E LIMPEZA (Repetindo para garantir contexto) ---
t_orig = linspace(1,25,25);
y_orig = [5.0291 6.5099 5.3666 4.1272 4.2948 6.1261 12.5140 10.0502 9.1614 7.5677 7.2920 10.0357 11.0708 13.4045 12.8415 11.9666 11.0765 11.7774 14.5701 17.0440 17.0398 15.9069 15.4850 15.5112 17.6572];

% Criando cópias para limpar
t_clean = t_orig;
y_clean = y_orig;

% Removendo o 7º elemento (t=7, outlier)
t_clean(7) = [];
y_clean(7) = [];

% --- 2. COEFICIENTES CALCULADOS NO ITEM C ---
beta_1 = 3.1536;
beta_2 = 0.5869;
beta_3 = 1.9733;

% --- 3. CRIANDO A CURVA SUAVE (200 PONTOS) ---
xx = linspace(0, 26, 200);
yy = beta_1 + (beta_2 * xx) + (beta_3 * sin(xx));

% --- 4. VISUALIZAÇÃO (AQUI ESTÁ A CORREÇÃO) ---
figure;
hold on; % Trava a figura para sobrepor
grid on; % Liga a grade

% Camada 1: A curva ajustada (Linha vermelha contínua)
plot(xx, yy, '-', 'LineWidth', 2, 'Color', 'r');

% Camada 2: Os dados bons/limpos (Bolinhas ciano com borda azul)
plot(t_clean, y_clean, 'o', 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'c');

% Camada 3: O OUTLIER NO t=7 (Estrelinha Magenta GIGANTE e GROSSA)
% Mudei a cor para 'm' (magenta), aumentei tamanho e espessura
plot(7, 12.5140, '*', 'MarkerSize', 14, 'LineWidth', 3, 'Color', 'm');

% --- 5. FORÇANDO OS EIXOS PARA GARANTIR VISUALIZAÇÃO ---
% axis([xmin xmax ymin ymax])
% x de 0 a 26, y de 0 a 20 (garantindo que y=12.5 apareça bem)
axis([0 26 0 20]);

% Acabamento
title('Item d');
legend('Curva Ajustada', 'Dados Validos', 'Outlier Excluido', 'Location', 'northwest');

hold off;
