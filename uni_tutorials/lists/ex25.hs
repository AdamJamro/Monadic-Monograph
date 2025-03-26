badqs [] = []
badqs (x:xs) = badqs [y | y<-xs, y <=x] ++ [x] ++ badqs [y | y<-xs, y>x]


-- optimized:
-- opted out from filtering the whole list twice
-- opted out from going one extra step of recursion for single element lists
qs [] = []
qs [x] = [x]
qs (x:xs) = qs left ++ [x] ++ qs right
            where (left,right) = partition (<=x) xs

partition _ [] = ([],[])
partition p [x] = if p x then ([x],[])
                  else ([],[x])
partition p (x:xs) = let (l,r) = partition p xs
                     in
                       if p x then (x:l, r)
                       else (l, x:r)

-- badqs on 10^4 reversed list:
-- (22.78 secs, 17e9 bytes)
-- qs on 10^4 reversed list:
-- (39.80 secs, 29e9 bytes)

