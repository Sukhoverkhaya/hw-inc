function mS = Generator(A,F,P,PntS,TimeMd)

	%global PntS;   % Количество точек в секунду (частота дискретизации)
  %global TimeMd; % Моделируемый интервал времени Sec	

    Ln = TimeMd * PntS; % Количество точек моделируемого сигнала
    mS = zeros(1,Ln);  % Массив точек сигнала

    T = 1/F;    % период сигнала Sec
    w = 2*pi/T;
    for i = 1:1:Ln
        t = (i-1)/PntS; % текушее время Sec
        mS(i) = A * sin(t*w+P);
    end;

	return;
