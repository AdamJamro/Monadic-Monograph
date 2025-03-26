remdup :: [Int] -> [Int]
remdup [] = []
remdup (x:xs) = foldr (\x acc -> if x == head acc then acc else x : acc) [x] xs