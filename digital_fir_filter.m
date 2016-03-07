function digital_fir_filter

  load ('filter_specifications.mat')

  [N, Fo, Ao, W] = firpmord(F,A,DEV,1);
  Bk = firpm(N,Fo,Ao,W);
  [H,W] = freqz(Bk,1,Num_Points);
  figure(1);
  plot(W/2,abs(H));
  xlabel('Digital Frequency');
  ylabel('Magnitude');
  title('Filter response');
  disp('FIR Filter Design');
  disp('Bk:'); disp(Bk);
  disp('Filter length: '); disp(N);
  grid on;

  figure(2);
  zplane(Bk,1);
  xlabel('Real Part');
  ylabel('Imaginary Part');
  title('Pole/Zero Diagram');
  grid on;
