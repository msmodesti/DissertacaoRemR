% Golden Ratio Search Algorithm with Machine Time and Error Calculation
% Function: f(x) = x^4 + 10*x*sin(x^2)

% Define the function
f = @(x) x.^4 + 10*x.*sin(x.^2);

% Define the search interval [a, b]
a = -10; % lower bound
b = 10;  % upper bound

% Golden ratio calculation
golden_ratio = (sqrt(5) - 1) / 2;

% Initial points
x1 = b - golden_ratio * (b - a);
x2 = a + golden_ratio * (b - a);

% Initial function evaluations
f1 = f(x1);
f2 = f(x2);

% Start the timer
tic;

% Main loop
while abs(b - a) > 1e-6
    if f1 < f2
        b = x2;
        x2 = x1;
        x1 = b - golden_ratio * (b - a);
        f2 = f1;
        f1 = f(x1);
    else
        a = x1;
        x1 = x2;
        x2 = a + golden_ratio * (b - a);
        f1 = f2;
        f2 = f(x2);
    end
end

% Stop the timer
elapsed_time = toc;

% Find the minimum
if f1 < f2
    xmin = x1;
    fmin = f1;
else
    xmin = x2;
    fmin = f2;
end

% Expected minimum (for error calculation)
expected_min = fmin; % Replace with the expected minimum value

% Calculate the error
error = abs(fmin - expected_min);

% Display the results
disp('Minimum point:');
disp(xmin);
disp('Minimum value:');
disp(fmin);
disp('Elapsed time (s):');
disp(elapsed_time);
disp('Error:');
disp(error);
