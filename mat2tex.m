A=rand(5,10);

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

