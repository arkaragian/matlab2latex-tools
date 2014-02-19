function mat2tex(A)

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
	%Compare vapriable type string
	vartype = class(endline);
	if(~strcmp(vartype,'logical'))
		error('endline Variable must be boolean!');
	end

	%Compare number vapriable size
	[r,c]   = size(number);
	if(r > 1 || c > 1)
		error('number Variable must be number not a matrix!');
	end

	exponent = floor(log10(abs(number)));
	mantissa = number/10^exponent;
	if(~endline) %If not endline
		if(abs(exponent)<=3)
			fprintf(' $%.4f$ &',number);
		else
			fprintf(' $%.2f \\cdot 10^{%d}$ &',mantissa,exponent);
		end
	else %If in endline print latex array endline
		if(abs(exponent)<=3)
			fprintf(' $%.4f$ \\\\',number);
		else
			fprintf(' $%.2f \\cdot 10^{%d}$ \\\\',mantissa,exponent);
		end
	end

	end %End of internal function

end %End of global function