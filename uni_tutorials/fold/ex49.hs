foldl' f z []   = z
foldl' f z (x:xs) =
    let z' = f z x
    in seq z' $ foldl' f z' xs 

dotprod :: (Num a) => [a] -> [a] -> a
dotprod xs ys = foldl' (+) 0 (zipWith (*) xs ys)