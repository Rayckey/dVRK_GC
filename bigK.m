function  k= bigK(p,w)


k = [zeros(3,1) , hat(w)*hat(w),zeros(3,6);
    zeros(3,1), hat(p)*hat(w)*hat(w), Bdotw]

end