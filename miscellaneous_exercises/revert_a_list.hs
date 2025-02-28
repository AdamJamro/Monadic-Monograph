revertList :: [a] -> [a]
revertList [] = []
revertList (x:xs) = revertList xs ++ [x]

revertList2 :: [a] -> [a]
revertList2 [] = []
revertList2 list = foldr (\x acc -> acc ++ [x]) [] list

main :: IO ()
main = do
    let originalList = [1, 2, 3, 4, 5]
    let reversedList = revertList2 originalList
    print reversedList