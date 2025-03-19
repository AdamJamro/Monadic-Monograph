tails' xs = foldr (\x acc -> [x : (head acc)] ++ acc) [[]] xs
