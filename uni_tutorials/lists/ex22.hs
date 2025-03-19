import Data.List (permutations, delete)


--permutations' (x:xs) = [x : permutations' xs] ++

permutations1 :: Eq a => [a] -> [[a]]
permutations1 [] = [[]]
permutations1 xs = do
                     a <- xs
                     let l = delete a xs
                     ls <- permutations l
                     return $ a : ls


permutations2 :: Eq a => [a] -> [[a]]
permutations2 [] = [[]]
permutations2 xs = [y:zs | y <- xs, zs <- permutations2 (remove y xs)]
                   where
                     remove _ [] = []
                     remove x (y:ys)
                           | x == y    = ys
                           | otherwise = y : (remove x ys)


permutations3 :: [a] -> [[a]]
permutations3 (x:xs) = [zs | ys <- permutations3 xs, zs <- insertEverywhere x ys]
                      where
                        insertEverywhere x [] = [[x]]
                        insertEverywhere x (y:ys) = (x:y:ys) : [y:zs | zs <- insertEverywhere x ys]


permutations4 :: [a] -> [[a]]
permutations4 [] = [[]]
permutations4 (x:xs) = [ys ++ [x] ++ as | (ys,as) <- concat (map splits (permutations4 xs))]
