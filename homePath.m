function E = homePath(filename)
%returns an adjacency matrix with the average path through imagining home
B = xlsread(filename);
Q = size(B);
numPaths = Q(1);
O = zeros(29);
%sum all paths
for i=1:numPaths
    A = readVisitationData(filename, i);
    O = O+A;
end
S = sum(O);
%pos is the most-used entrance to imagining home, 1 = aa/cone, 2 = commons,
%3 = east lobby entrance. most likely it'll be the east lobby entrance
[a, pos] = max([S(1) S(2) S(3)]);
ogPos = pos;
E = zeros(29);
[a, pos2] = max(O(:, pos));
%disp(pos2);
E(pos2, pos) = 1;
E(pos, pos2) = 1;
O(:, pos) = 0;
O(pos2, :) = 0;
pos = pos2;
while ~((pos==1)||(pos==2)||(pos==3))
    [maxVal, pos2] = max(O(:, pos));
    if pos2 == ogPos
        z = zeros(29, 1);
        z(pos2) = maxVal;
        l = O(:, pos) - z;
        [maxVal, pos2] = max(l);
    end
    E(pos2, pos) = 1;
    E(pos, pos2) = 1;
    O(:, pos) = 0;
    O(pos2, :) = 0;
    pos = pos2;
end


end