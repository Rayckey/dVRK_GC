function MATT = avggrav(MAT)

[rows, cols] = size( MAT);

temp_MAT = MAT((rows-2):rows,:)
for i = 1:8
    MATT(i) = mean(temp_MAT(:,i));
end

end