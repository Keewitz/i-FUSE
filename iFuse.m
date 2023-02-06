num=xlsread('HASILVIBRATIONSENSOR') % Mengimport sample data dari excel 
Fs=16; % Frequency sampling sebanyak 1600 Hz
Ts=1/Fs; % Rumus periode sampling yaitu 1 dibagi dengan banyaknya frequency sampling 
t = 0:Ts:1; % Indexing signal 0 sampai 1

t=num(:,2) % Time
y=num(:,1) % Raw Data
figure(1); % Membuat Figure 1
plot(t,y) % Memplot signal y terhadap waktu
xlabel('Time(s)') % Memberi label pada sumbu x dengan nama "Time (s)" 
ylabel('Data') % Memberi label pada sumbu Y dengan nama "Data"
title('Raw Data') % Memberi judul pada grafik dengan nama "Rawdata"
legend % Untuk melakukan penamaan grafik pada matlab 

Y = fft(y,1024); % Operasi fft dalam 2^n atau 1024 bit
Ym= abs(Y); % Mencari magnitude fft
f= Fs*(0:511)/1024; % f indexing fft untuk salah satu
figure(2);  % Membuat Figure 2
plot(f,Ym(1:512)) % Memplot signal f sebanyak 512 sampling 
xlabel('Frequency(Hz)'); % Memberikan label sumbu X grafik dengan nama Frequency(Hz)
ylabel('Amplitude'); % Memberikan label pada sumbu Y grafik dengan nama Amplitude
title('Sinus and Noise Spectrum') % Memberikan judul pada grafik dengan nama "Sinus and Noise Spectrum"

z = filter(B,1,y); % Mendevelop FIR dengan koefiesien B
figure(3) % Membuat Figure 3
plot(t,z) % Memplot signal z terhadap waktu
xlabel('Time(s)') % Memberi label pada sumbu X dengan Time(s)
ylabel('Data') % Memberi label pada sumbu Y dengan nama Data
title('Signal After Filtered') % Memberikan judul pada grafik dengan nama "Signal After Filtered"

Z = fft(z,1024); % Operasi fft dalam 2^n atau 1024 bit
Zm = abs(Z); % Mencari magnitude fft
f = Fs*(0:511)/1024; % f indexing fft untuk salah satu
figure(4) % Membuat Figure 4
plot(f,Zm(1:512)) % Memplot signal f sebanyak 512 sampling 
xlabel('Frequency(Hz)'); % Memberikan label sumbu x grafik dengan nama Frequency(Hz)
ylabel('Amplitude'); % Memberikan label pada sumbu y grafik dengan nama Amplitude
title('Signal After Filtered Spectrum') % Memberikan judul pada grafik dengan nama "Signal After Filtered Spectrum"
