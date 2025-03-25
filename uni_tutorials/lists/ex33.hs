subCard :: Int -> [a] -> [[a]]
subCard 0 _ = [[]]
subCard _ [] = []
subCard n (x:xs) = map (x:) (subCard (n-1) xs) ++ subCard n xs