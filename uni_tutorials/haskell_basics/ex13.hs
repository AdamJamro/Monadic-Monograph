phi:: Int -> Int
phi n = foldl (\acc x -> if gcd n x == 1 then acc + 1 else acc) 0 [1..n]


sumPhi:: Int -> Int
sumPhi n = foldl (+) 0 divisors
           where
            divisors = [y| y<-[1..n], mod y n == 0]







--partition _ [] = ([],[])
--partition p (x:xs) = if p x then ((x:l),r)
--                            else (l,(x:r))
--                      where (l,r) = partition p xs

