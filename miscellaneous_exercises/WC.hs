main = interact wordCount
    where 
        wordCount input = unlines (map handleLine $ takeWhile (/= "") (lines input))
        handleLine line = show (length (words line))