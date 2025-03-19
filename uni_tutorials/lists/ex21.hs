partition :: (a->Bool) -> [a] -> ([a], [a])
partition p xs = (filter p xs, filter (not.p) xs)


partition2 :: (a->Bool) -> [a] -> ([a], [a])
partition2 _ [] = ([],[])
partition2 p (x:xs) = let (l,r) = partition2 p xs
                      in
                        if (p x) then (x:l, r)
                        else (l, x:r)
