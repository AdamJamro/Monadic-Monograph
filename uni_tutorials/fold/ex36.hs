-- O(n)
rev'' :: [a] -> [a]
rev'' [] = []
rev'' (x:xs) = foldl (flip (:)) [] (x:xs)


-- O(n^2)
rev''' :: [a] -> [a]
rev''' [] = []
rev''' (x:xs) = rev''' xs ++ [x]

