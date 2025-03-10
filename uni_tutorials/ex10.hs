myMap :: (a->b) -> [a] -> [b]
myMap f = foldr ((:) . f) []
-- myMap f = foldr (\x acc -> f x : acc) []

myZip :: [a] -> [b] -> [(a,b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys

myZipWith :: (a->b->c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

myFilter :: (a->Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs) = if f x then x : myFilter f xs else myFilter f xs

myTake :: Int -> [a] -> [a]
myTake n _ | n <= 0 = []
myTake _ [] = []
myTake n (x:xs) = x : myTake (n-1) xs

myDrop :: Int -> [a] -> [a]
myDrop n xs | n <= 0 = xs
myDrop _ [] = []
myDrop n (x:xs) = myDrop (n-1) xs