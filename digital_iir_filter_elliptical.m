function digital_iir_filter_elliptical

  load('filter_specifications.mat');

  Wp = Fp*2;
  [N,Wp] = ellipord(Wp,Ws,-20*log10(1-delta),-20*log10(delta));
  [Bk,Ak] = ellip(N+1,-20*log10(1-delta),-20*log10(delta),Wp);
  [H,W] = freqz(Bk, Ak, Num_Points);

  figure(1)
  plot(W/2,abs(H));
  xlabel('Digital Frequency');
  ylabel('Magnitude');
  title('Filter response');
  disp('IIR Elliptical Filter Design');
  disp('Bk:'); disp(Bk);
  disp('Ak:'); disp(Ak);
  disp('Filter length: '); disp(N+1);
  grid on;

  figure(2)
  zplane(Bk,Ak);
  xlabel('Real Part');
  ylabel('Imaginary Part');
  title('Pole/Zero Diagram');
  grid on;
