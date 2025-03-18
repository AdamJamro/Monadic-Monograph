phi:: Int -> Int
phi n = foldl (\acc x -> if gcd n x == 1 then acc + 1 else acc) 0 [1..n]


sumPhi:: Int -> Int
sumPhi n = foldl (+) 0 divisors
           where
            divisors = [y| y<-[1..n], mod y n == 0]