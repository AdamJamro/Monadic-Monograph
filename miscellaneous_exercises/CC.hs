import Data.Char (isSpace)

main = interact wordCount
    where 
        wordCount input = unlines (map handleLine (takeWhile (/= "") (lines input)))
        handleLine line = "non-white chars: " ++ show (length (filter (not . isSpace) line))
            ++ ", all chars: " ++ show (length line) 