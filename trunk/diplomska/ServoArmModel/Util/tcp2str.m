function [strPos, strOrnt]=tcp2str(tcp)
rpy = tr2rpy(tcp);
rpy =radtodeg(rpy);
pos = GetTranslationFromFrame(tcp);

strOrnt = sprintf('Rx:%6.4f, Ry:%6.4f, Rz:%6.4f', rpy(1), rpy(2), rpy(3) );
strPos =  sprintf('X:%6.4f, Y:%6.4f, Z:%6.4f', pos(1), pos(2), pos(3) );
end