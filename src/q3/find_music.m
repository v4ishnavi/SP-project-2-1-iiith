function y_final = find_music(Y1, Y2, Y3, Y4)
y_final = zeros(1, length(Y1));
for i = 1:length(Y1)
    y_final(i) = min([Y1(i), Y2(i), Y3(i), Y4(i)]);
end
end