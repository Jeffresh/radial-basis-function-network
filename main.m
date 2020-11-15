clear all
%pkg load statistics

% Número de ejempjos
n_data= 10000;

% Generación de datos
X_real = rand(1,n_data) * (5*pi);                    
y_real  = sinc(X_real);

% Generación de ruido
noise     = 0.3 * std(y_real) ;
y_noise = noise * rand(1, n_data);

%Agregación del ruido
y_noise = y_real + y_noise;

% Muestra
n_sample = n_data * 0.01;
all_ind = randperm(n_data);
ind_sample = all_ind(1:n_sample);

X =X_real(ind_sample)';
y = y_noise(ind_sample)';



plot(X_real, y_real, '.k'), hold on 
plot(X, y,'xr'), hold off
title("Data")
legend("Artificial data", "Sample")
axis([min(X_real) max(X_real) -0.5 1])


%Partición de los datos

n_examples = size(X,1);
n_train_examples = n_examples * 0.6;
n_test_examples = n_examples - n_train_examples;

ind = randperm(n_examples);
ind_train = ind(1:n_train_examples);
ind_test = ind(n_train_examples+1:end);

%Entrenamiento de la red

n_centers = 10
centers = linspace(min(X) ,max(X), 10);
n_hidden_layers = 10;

width = (max(centers) - min(centers)) / (sqrt(2*n_hidden_layers))
W = train(X_train, y_train, centers, width);

% Evaluación de la red

y_predict = predict(X_test, centers, width, W);

[x, i] = sort(X_test);

plot(x, y_test(i), 'r'),hold on;
plot(x, y_predict(i), 'b'), hold off;
title("Predictions over test data")
legend("Test data", "Predicted data")