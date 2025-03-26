-- lmss :: [Int] -> [Int]
-- lmss xs = foldl (\acc x -> findMax acc x) (0,0) xs


-- findMax :: [Int] -> Int -> Int
-- findMax xs el = foldl (\acc x -> if el < x && x > acc then x else acc) 0 xs


-- lmss :: [Int] -> [Int]
lmss [] = []
lmss [x] = [x]
lmss (x:xs) = longestList (lmss xs) (x : lmss (filter (>x) xs))


longestList [] ys = ys
longestList xs [] = xs
longestList xs ys = if length xs > length ys then xs else ys


-- very inefficient
lmss''' :: [Int] -> [Int]
lmss''' [] = []
lmss''' xs = foldl (\acc x -> longestList acc (x : lmss''' (filter (>x) xs))) [] xs
