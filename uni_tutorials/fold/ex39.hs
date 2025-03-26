
eminussum :: Int -> [Int] -> Int
eminussum e xs = foldl (\acc x -> acc - x) e xs
