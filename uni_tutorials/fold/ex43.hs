alternateSum :: [Int] -> Int
alternateSum xs = snd $ foldl update (0, 0) xs
  where
    update (counter, acc) x =
        if even counter
        then (counter + 1, acc + x)
        else (counter + 1, acc - x)