
function MATT = avggravy(MAT)

    [rows, cols] = size( MAT);
if rows == 6
    
    
    

    
    temp_MAT = MAT((rows-5):rows,:)
    
    temp_MAT(5,:) = [];
    
    temp_MAT(3,:) = [];
    
    temp_MAT(1,:) = [];
    
    for i = 1:8
        MATT(i) = mean(temp_MAT(:,i));
    end
    
end
if rows == 2
    MATT = MAT ( 2,:);
end
end