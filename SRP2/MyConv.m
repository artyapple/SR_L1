function g_Vek = MyConv(s_Vek, h_Vek)

[s_m,s_n] = size(s_Vek);
[h_m,h_n] = size(h_Vek);

len = s_m + h_m -1;
g_Vek = zeros(len,1);


for i=1:1:len
    
        i_old = i;
        tmp = 0;
        
        for j=1:1:h_m
            
            if (i_old > 0) && (i_old <= s_m)
                tmp = tmp + (s_Vek(i_old)*h_Vek(j));
            end
            
            i_old = i_old - 1;
            g_Vek(i) = tmp;
        end    

end	

return