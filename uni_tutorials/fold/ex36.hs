-- O(n)
rev' [] = []
rev' (x:xs) = foldl (flip (:)) [] (x:xs)
