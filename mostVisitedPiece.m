  function [newString, S] = mostVisitedPiece(filename)
%this function returns the most visited piece 
exhibitnames = {'Cheney Miniatures', 'Bourdelle', 'Williams', 'Marcin', 'Prayer Mat', 'Gerard', 'Bonnard', 'Brady', 'Simmons', 'Toaster', 'Shower Curtain', 'Goldberg', 'Horn', 'Lobi', 'KS47', 'Bowls', 'Tent Post', 'Cradle', 'Page', 'Stieglitz', 'Johnston', 'Snelling', 'Poster', 'Quilt', 'Imagining Home Installation I', 'Imagining Home Installation II'}; 
B = xlsread(filename);
Q = size(B);
numPaths = Q(1);
O = zeros(29);
%sum all paths)
for i=1:numPaths
    A = readVisitationData(filename, i);
    O = O+A;
end
S = sum(O, 2);
ss = zeros(26, 1);
%don't count visiting the entracnes
for i=1:26
    ss(i) = S(3+i);
end
mx = max(ss);
piecenum = 0;
for i=1:26
    if ss(i) == mx
        piecenum = i;
    end
end
phrase = 'Most visited piece was';
pieceName = exhibitnames{piecenum};
newString = [phrase ' ' pieceName];
%disp(newString);
%hmo = HeatMap(O);
end
