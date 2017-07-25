function plotVisitationData(filename, filename2, yes, pAths, aVg, cIRcs) 
%This function plots the visitation data from a given excel spreadsheet
%name. 
B = xlsread(filename);
Q = size(B);
numPaths = Q(1);
point = [168 280 1405 905 1127 920 1026 1359 692 1020 862 1256 851 569 1022 558 532 490 791 478 294 189 189 189 423 860 944 584 1280];
paint = [799 991 804 898 661 572 464 421 134 134 134 134 446 173 383 592 501 424 591 153 176 293 451 546 555 552 471 841 862];

for i=1:29
    paint(i) = 1080 - paint(i);
end

xy = [point ; paint]';
[L, T, S] = xlsread(filename2);


legendInfo = cell(numPaths, 1);

for o=1:numPaths 
    legendInfo{o} = 'suh';
end

L = homePath(filename);
[str, s3] = mostVisitedPiece(filename);

%plot heat circles


hold on

%plot walking paths 

 
for i=1:numPaths
    [A, k] = readVisitationData(filename, i);
    x = rand(1, 3);
    if (pAths == 1)
        gplotdc(A, xy, i, 'color', x, 'LineWidth', 1, 'LineStyle', '-');
    end
    legendInfo{i} = strcat(S{i}, k);
    %if cIRcs == 1
    %    drawcircs(s3);
    %end
end
if (pAths == 1)
    l = legend(legendInfo);
    l.ItemHitFcn = @hitcallback_ex2;
end

%display(colorvalues)


%plot the average path
if (aVg == 1) 
    gplotdc(L, xy, i, 'color', [0 0 0], 'LineWidth', 2, 'LineStyle', ':');
end


%display image (still troubleshooting this)
if (yes == 1) 
    [woah, map, transparency] = imread('floorplan.png');
    lit = imagesc([0 1584], [0 1080], woah);
end
lit.AlphaData = .4;

end  