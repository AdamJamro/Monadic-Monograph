dec2int :: [Int] -> Int
dec2int = foldl (\acc x -> acc * 10 + x) 0