function y = GuitarDelay (x, delay, f)
    
    fileSize = size(x,1);
    y = zeros(fileSize,1);

    for idx = delay+1:numel(x)        
        y(idx) = x(idx)+f*x(idx-delay);
    end

return