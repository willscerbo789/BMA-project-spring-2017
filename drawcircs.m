function nice = drawcircs(S)
point = [168 280 1405 905 1127 920 1026 1359 692 1020 862 1256 851 569 1022 558 532 490 791 478 294 189 189 189 423 860 944 584 1280];
paint = [799 991 804 898 661 572 464 421 134 134 134 134 446 173 383 592 501 424 591 153 176 293 451 546 555 552 471 841 862];
for i=1:29
   paint(i) = 1080 - paint(i);
end
%disp(paint)
r=50; % some radius
%color=[1 0 0]; % red color
for j=1:29
    
    %if j>3
        t=linspace(0,2*pi);
        mw = max(S);
        mn = min(S);
        x = S(j)/(abs(mw-mn));
        if (x >= 1)
            x = 1;
        end
        %display(x); 
        r = S(j)*(7.5);
        l = fill(point(j)+r*cos(t),paint(j)+r*sin(t),[1 1-x 0]); % this creates a filled circle centered at (E,N)
        set(l, 'facealpha', .8);
    %end
end

end