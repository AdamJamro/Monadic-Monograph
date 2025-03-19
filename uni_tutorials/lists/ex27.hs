bubblePass :: Ord a => [a] -> [a]
bubblePass [] = []
bubblePass [x] = [x]
bubblePass (x:y:xs)
    | x > y     = y : bubblePass (x:xs)  -- Swap if out of order
    | otherwise = x : bubblePass (y:xs)  -- Keep in order

bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs
    | sorted xs = xs                     -- If the list is already sorted, return it
    | otherwise = bubbleSort (bubblePass xs)  -- Otherwise, perform another pass
  where
    sorted [] = True                     -- Helper function to check if the list is sorted
    sorted [_] = True
    sorted (x:y:ys) = x <= y && sorted (y:ys)


-- more elegant solution
bsort :: Ord a => [a] -> [a]
bsort s = case bsort' s of
              t | t == s    -> t
                | otherwise -> bsort t
  where bsort' (x:x2:xs) 
                | x > x2    = x2 : bsort' (x:xs)
                | otherwise = x : bsort' (x2:xs)
        bsort' s = s

