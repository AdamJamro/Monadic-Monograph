import Data.List (transpose)

longestCommonPrefix :: [String] -> String
longestCommonPrefix [] = ""
longestCommonPrefix [x] = x
longestCommonPrefix (x:xs) = foldl commonPrefix x xs
  where
    commonPrefix [] _ = []
    commonPrefix _ [] = []
    commonPrefix (x:xs) (y:ys)
      | x == y = x : commonPrefix xs ys
      | otherwise = []


longestCommonPrefix' :: [[Char]] -> String
longestCommonPrefix' [] = ""
longestCommonPrefix' [x] = x
longestCommonPrefix' xs =
    concat $ takeWhile (/= []) (map reduce (transpose' xs))
        where
            reduce :: [Char] -> [Char]
            reduce [] = []
            reduce [x] = [x]
            reduce (x:y:xs) = if x == y then reduce (y:xs) else []


transpose' :: [[a]] -> [[a]]
transpose' [] = []
transpose' ([]:xs) = [] -- arbitrary, [] works in our case
transpose' xs = concatMap (\x -> [head x | (not.null) x]) xs : transpose' (concatMap (\x -> [tail x | (not.null) x]) xs)