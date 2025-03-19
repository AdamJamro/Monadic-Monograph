-- empty

partition _ [] = ([],[])
partition p (x:xs) = let (l,r) = partition p xs
                     in
                       if (p x) then (x:l, r)
                       else (l, x:r)


badqs [] = []
badqs [x] = [x]
badqs (x:xs) = [y | y<-xs, y <=x] ++ [x] ++ [y | y<-xs, y>x]


qs [] = []
qs [x] = [x]
qs (x:xs) = qs left ++ [x] ++ qs right
            where (left,right) = partition (<=x) xs
