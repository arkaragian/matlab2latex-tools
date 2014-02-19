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

end %Function end

