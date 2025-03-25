filter' p = concatMap box
                where box x = [x | p x]
                
                
main :: IO ()
main = do
    putStrLn "Enter a list of integers (e.g., [1,2,3,4]):"
    input <- getLine
    let numbers = read input :: [Int]
    let result = filter' odd numbers
    putStrLn $ "Filtered out numbers: " ++ show result

