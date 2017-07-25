function [A, k] = readVisitationData(filename, n)
%This function reads in a visitation data spreadsheet and returns the 
%adjacency matrix associated with the nth path in the spreadsheet. 
M = xlsread(filename);
x = 1;
A = zeros(29);
i = 1;

if M(n, 1) == 1 
    k = ', entered from African/Asian gallery';
elseif M(n, 1) == 2
    k = ', entered from Community Commons';
else
    k = ', entered from East Lobby';
end

while (x ~= 0 && (M(n, i+1) ~= 0))
    x = M(n, i);
    y = M(n, i+1);
    corn = [x y];
    if (y ~= 0)
        A(y, x) = 1;
        A(x, y) = 1;
    end
    i = i+1;
end    
end