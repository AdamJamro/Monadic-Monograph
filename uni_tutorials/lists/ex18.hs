inits' xs = foldl (\acc x -> acc ++ [last acc ++ [x]]) [[]] xs
