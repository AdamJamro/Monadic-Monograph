power :: Int -> Int -> Int
power x y = y ^ x

p2, p3 :: Int -> Int
p2 = power 4
p3 = power 3

composition :: Int -> Int
composition = p2 . p3

main = putStr $ unlines [
        "p2 2 = " ++ show (p2 2),
        "p3 2 = " ++ show (p3 2),
        "p2 . p3 2 = " ++ show ((p2 . p3) 2),
        "p3 . p2 2 = " ++ show ((p3 . p2) 2)
        ]


p2_lambda = \x -> x ^ 4
p3_lambda = \x -> x ^ 3
composition_lambda = \x -> (p2_lambda . p3_lambda) x
extra_composition_lambda = \x -> ((\y -> y ^ 4) . (\z -> z ^ 3)) x