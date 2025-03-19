isSorted [] = True
isSorted [_] = True
isSorted (x:y:xs) = x<=y && isSorted (y:xs)
