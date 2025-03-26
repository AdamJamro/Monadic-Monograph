import Data.List (nub)

type Hetman = [Int]

combOk (a,b) (c,d) = abs(a-c) /= abs(b-d)
colOk _ _ _ [] = True
colOk x xs = all (combOk x) xs
colOk i v c (x:xs)
   | combOk (i,v) (c,x) = colOk i v (c+1) xs
   | otherwise = False

isLegal n perm = all [colOk i (perm !! i) 0 (zip [0..] perm) | i <- [0..n-1]]

queens n = filter (islegal n) $ permutations [1..n]
