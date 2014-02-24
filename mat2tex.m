function mat2tex(A)
% MAT2TEX  prints a table to LaTex format.
%   MAT2TEX(A) prints the LaTex format of matrix A to the screen.


[rows,cols] = size(A);

for i=1:1:rows
    for j=1:1:cols
        if(j==cols) %end of line
            printNumber(A(i,j),true);
        else        %in the matrix
            printNumber(A(i,j),false);
        end
    end
    fprintf('\n');
end

%Internal function
function printNumber(number,endline)
    zero =false;
    
	%Compare vapriable type string
	vartype = class(endline);
	if(~strcmp(vartype,'logical'))
		error('endline Variable must be boolean!');
	end

	%Compare number variable size
	[r,c]   = size(number);
	if(r > 1 || c > 1)
		error('number Variable must be number not a matrix!');
	end

	exponent = floor(log10(abs(number)));
	mantissa = number/10^exponent;
    
    %Detect zero
    if(abs(exponent) == Inf)
        exponent = 2;
        zero=true;
    end
    
	
	%Four cases. In matrix 0 or not
	%            Endline   0 or not
	if(~endline) %If not endline
		if(abs(exponent)<=3)
            if(zero)
                fprintf(' $%d$ &',0);
            else
                fprintf(' $%.4f$ &',number);
            end
		else
			fprintf(' $%.2f \\cdot 10^{%d}$ &',mantissa,exponent);
		end
	else %If in endline print latex array endline
		if(abs(exponent)<=3)
            if(zero)
                fprintf(' $%d$ \\\\',0);
            else
                fprintf(' $%.4f$ \\\\',number);
            end
		else
			fprintf(' $%.2f \\cdot 10^{%d}$ \\\\',mantissa,exponent);
		end
	end

	end %End of internal function

end %End of global function