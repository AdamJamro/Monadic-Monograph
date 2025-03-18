divides :: Int -> Int -> Bool
divides x y = mod y x == 0

firstDivisors :: Int -> [Int]
firstDivisors n = [x | x <- [1..(floor (sqrt (fromIntegral n)))], x `divides` n]

--lastDivisors :: Int -> [Int]
--lastDivisors n = foldl (\acc x ->
--                         if (x/=(div n x) && x/=1) then (div n x) : acc
 --                        else acc
--                       )
--                       [] (firstDivisors n)

sumOfDivisors :: Int -> Int
sumOfDivisors n = sum (map (\x -> if (x * x /= n && x /= 1) then x + (div n x) else x) (firstDivisors n))


amicablePairs limit = [(m,n) | m <- [1..limit],
                               let n = sumOfDivisors m,
                               n > m,
                               n <= limit,
                               (sumOfDivisors n) == m]
