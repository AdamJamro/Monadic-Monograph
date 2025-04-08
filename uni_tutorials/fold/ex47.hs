subsetlist:: Eq a => [a]->[a]->Bool
subsetlist [] _ = True
subsetlist _ [] = False
subsetlist (x:xs) (y:ys) = if x == y then subsetlist xs ys else subsetlist (x:xs) ys
