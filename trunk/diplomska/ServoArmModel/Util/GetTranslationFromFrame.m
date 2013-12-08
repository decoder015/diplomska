%-----------------------------------------------------
% returs translation part form frame
%-----------------------------------------------------
function [translationVector] =GetTranslationFromFrame(frame)
translationVector(1,1) = frame(1,4);
translationVector(1,2) = frame(2,4);
translationVector(1,3) = frame(3,4);
translationVector(1,4) = frame(4,4);
end