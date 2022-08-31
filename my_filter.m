function [yn, buf]  = my_filter(xn, Bxx, Axx, buf)
  
  n = buf.Pz; 
  l = length(Bxx);
  buf.zX(buf.Pz) = xn;
  
  yn = Bxx(1)*xn;                        n = n-1; if n == 0; n = l; end
  for i = 2:length(Bxx)
      yn = yn + Bxx(i)*buf.zX(n) - Axx(i)*buf.zY(n); n = n-1; if n == 0; n = l; end
  end

  buf.zY(buf.Pz) = yn/Axx(1);
  buf.Pz = buf.Pz+1;
  if buf.Pz > l; buf.Pz = 1; end

end