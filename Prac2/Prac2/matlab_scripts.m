% % plotting the sampled waveforms
% % Load the CSV file
% data = readtable('wave-lookups.csv');
% 
% % Extract data from the table
% index = data.index;
% sinusoid = data.sinusoid;
% sawtooth = data.sawtooth;
% triangle = data.triangle;
% 
% % Plot each waveform
% figure;
% plot(index, sinusoid, 'LineWidth', 2);
% hold on;
% plot(index, sawtooth, 'LineWidth', 2);
% plot(index, triangle, 'LineWidth', 2);
% hold off;
% 
% % Increase the font size for all text
% fontSize = 16; % Adjust this value as needed
% 
% % Add title and labels with increased font size
% title('Sampled Waveforms', 'FontSize', fontSize + 4);
% xlabel('Sample Index', 'FontSize', fontSize);
% ylabel('Amplitude', 'FontSize', fontSize);
% 
% % Add a legend with increased font size
% legend({'Sinusoid', 'Sawtooth', 'Triangle'}, 'FontSize', fontSize);
% 
% % Set the font size for the axes
% set(gca, 'FontSize', fontSize);
% 
% % Display the plot
% grid on;

% Plotting a sine wave with its PMW signal

% Generating the true wavefrom
% frequency = 1;  % Hz
% samples = 1000;
% time = linspace(0, 1/frequency, samples);
% sinusoid = (sin(time * 2 * pi * frequency) + 1)/2;
% 
% % Generating the PWM waveform
% lookup_samples = 16;
% time_per_sample = 1/frequency/lookup_samples;
% pwm = zeros(1, samples);
% j = 1;
% for i=1:lookup_samples
%     start_time = time(j);
%     duty_cycle = sinusoid(j);
%     end_of_high_time = start_time + time_per_sample * duty_cycle;
%     end_time = start_time + time_per_sample;
%     while time(j) < end_of_high_time && j < length(pwm)
%         pwm(j) = 1;
%         j = j + 1;
%     end
%     j = find(time > end_time, 1)
% end
% 
% % Plotting
% figure;
% plot(time, sinusoid, 'b', 'LineWidth', 2);
% hold on;
% plot(time, pwm, 'r', 'LineWidth', 2);
% 
% % Increase the font size for all text
% fontSize = 16; % Adjust this value as needed
% 
% title('Sine Wave and Corresponding PWM Signal', 'FontSize', fontSize + 4);
% xlabel('Time', 'FontSize', fontSize);
% ylabel('Amplitude', 'FontSize', fontSize);
% legend('Sine Wave', 'PWM Signal', 'FontSize', fontSize);
% 
% % % Set the font size for the axes
% % set(gca, 'FontSize', fontSize);
% % 
% % % Display the plot
% % grid on;
% 
% 
% 

% % Define the system
% num = 1; % Numerator coefficients (no zeros)
% den = [1 1]; % Denominator coefficients (pole at -1)
% 
% % Create the pole-zero plot
% pzplot(tf(num, den));
% hold on;
% 
% % Mark the pole with an 'x' and add text 'p'
% plot(-1, 0, 'x', 'MarkerSize', 10, 'LineWidth', 2); % Pole at -1
% text(-1, 0.1, 'p', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
% 
% % Adjust plot
% xlim([-2 0]);
% ylim([-1 1]);
% grid on;
% title('Pole-Zero Plot');
% xlabel('Real Part');
% ylabel('Imaginary Part');
% hold off;

% Define the system
num = [1];  % Numerator of the transfer function
den = [1 1];  % Denominator of the transfer function

% Create a transfer function
sys = tf(num, den);

% Generate the Bode plot
[mag, phase, w] = bode(sys);

% Convert phase to radians
phase_rad = phase(:) * pi / 180;

% Plot the phase plot on a logarithmic x-axis
figure;
semilogx(w, phase_rad);
xlabel('Frequency (rad/s)');
ylabel('Phase (radians)');

% Remove ticks on x and y axes
set(gca, 'XTick', []);
set(gca, 'YTick', []);
