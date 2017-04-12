
function MATT = avggravx(MAT)

[rows, cols] = size( MAT);
if rows == 6
    
    temp_MAT = MAT((rows-5):rows,:)
    
    temp_MAT(6,:) = [];
    
    temp_MAT(4,:) = [];
    
    temp_MAT(2,:) = [];
    for i = 1:8
        MATT(i) = mean(temp_MAT(:,i));
    end
end
if rows == 2
    MATT = MAT ( 1,:);
    
    
end