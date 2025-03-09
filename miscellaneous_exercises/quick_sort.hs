main = interact withLists
        where 
            withLists line =
                unlines $ ["provide a list of integers to sort:"]
                     <> map parseLine readLines
                where 
                    readLines = takeWhile (/= "") (lines line)
                    parseLine = show . qsort . (map read :: [String] -> [Int]) . words
                    -- wordLists = map words readLines
                    -- integerWordLists = map (\x -> map read x :: [Int]) wordLists :: [[Int]]
                    -- sortedIntegerLists = map qsort integerWordLists
                    -- parsedLines = map show sortedIntegerLists

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = let
    left = qsort [t|t <- xs, t <= x]
    right = qsort [t|t <- xs, t > x]
    in left ++ [x] ++ right