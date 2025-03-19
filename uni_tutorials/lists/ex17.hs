import Data.List (sort)

removeDups :: [Int] -> [Int]
removeDups xs = foldr (\x acc -> 
                        if (acc == [] || head acc /= x)
                        then (x : acc)
                        else acc
                        ) [] (sort xs)
