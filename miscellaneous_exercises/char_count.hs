import System.Environment (getArgs)
import System.IO (readFile)
main :: IO ()
main = do
    args <- getArgs
    case args of
        [fileName] -> do
            content <- readFile fileName
            let charCount = length content
            putStrLn $ "Character count: " ++ show charCount
        _ -> putStrLn "Usage: char_count <filename>"