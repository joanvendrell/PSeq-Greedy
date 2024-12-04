%
%  Function to compute percent-point probability P_i[W \leq l]
%
function f_i_l = compute_probability(p,i,l)
    % Basic Case: if l>=2 -- note that l=2 means 1 path active
    n=length(p)+1;
    if (i+l-2)>(n-1) % I will need a sequence from i to i+l-2, otherwise 0
        f_i_l = 0;
    else
        f_i_l = prod(p(i:i+l-2));
        if (i-1)>=1 % I make it independent to the previous sequence
            f_i_l = (1-p(i-1))*f_i_l;
        end
        if (i-l)>=1 % I make it independent to the more previous sequence
            q = 0;
            for j=1:(i-l)
                q = q + compute_probability(p,j,l);
            end
            f_i_l = f_i_l*(1-q);
        end
    end
end