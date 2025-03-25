-- bad O(n^2):

rev :: [a] -> [a]
rev []     = []
rev (x:xs) = rev xs ++ [x]

-- good O(n):

rev' :: [a] -> [a]
rev' xs = rev'' xs []
          where
            rev'' []     acc = acc
            rev'' (x:xs) acc = rev'' xs (x:acc)


-- cleaner (and the same as previous):
rev''' :: [a] -> [a]
rev''' = foldl (flip (:)) []