euler :: Int -> Int
euler n = length [x | x <- [1..n], gcd x n == 1]

eulersum :: Int -> Int
eulersum n = sum [euler x | x <- [1..n], mod n x == 0]

acceptInput :: IO Int
acceptInput = do
    n <- getLine
    case reads n :: [(Int, String)] of
        [(input, "")] -> return input
        other -> do
            putStrLn $ "Parsed input: " ++ show other
            putStrLn "Invalid input. Please enter a valid integer."
            acceptInput

main = do
    putStrLn "Enter a number to calculate the Euler's Totient Function"
    input <- acceptInput 
    putStrLn $ "eulersum(" ++ show input ++ ") = "  ++ show (eulersum input) 
            ++ ", totient(" ++ show input ++ ") = " ++ show (euler input)
