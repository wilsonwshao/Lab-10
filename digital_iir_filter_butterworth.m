function digital_iir_filter_butterworth

  load ('filter_specifications.mat');

  [N, Wn] = buttord(Wp, Ws, -20*log10(1-delta), -20*log10(delta) );
  [Bk,Ak] = butter(N, Wn);
  [H,W] = freqz(Bk, Ak, Num_Points);

  axis([0 1 -60 10]);
  figure(1)
  plot(W/2,abs(H));
  xlabel('Digital Frequency');
  ylabel('Magnitude');
  title('Filter response');
  disp('Butterworth Filter Design');
  disp('Bk:'); disp(Bk);
  disp('Ak:'); disp(Ak);
  disp('Filter length: '); disp(N);
  grid on;

  figure(2)
  zplane(Bk,Ak);
  xlabel('Real Part');
  ylabel('Imaginary Part');
  title('Pole/Zero Diagram');
  grid on;
