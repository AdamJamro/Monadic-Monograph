data EvalResult = IntResult Int | DoubleResult Double | BoolResult Bool | ErrorResult String
    deriving Show

table = [(i, eval i) | i <- [1..22]]
    where
        eval 1 = IntResult (5 + 8)
        eval 2 = IntResult (3 * 5 + 8)
        eval 3 = IntResult (2 + 4)
        eval 4 = IntResult ((+) 2 4)
        eval 5 = DoubleResult (sqrt 16)
        eval 6 = IntResult (succ 6) -- or EnumResult
        eval 7 = IntResult (succ 7)
        eval 8 = IntResult (pred 9)
        eval 9 = IntResult (pred 8)
        eval 10 = DoubleResult (sin (pi / 2))
        eval 11 = IntResult (truncate pi)
        eval 12 = IntResult (round 3.5)
        eval 13 = IntResult (round 3.4)
        eval 14 = IntResult (floor 3.7)
        eval 15 = IntResult (ceiling 3.3)
        eval 16 = BoolResult (True && False)
        eval 17 = BoolResult (True && True)
        eval 18 = BoolResult (False || True)
        eval 19 = BoolResult (not False)
        eval 20 = BoolResult (not (True && True))
        eval 21 = BoolResult (5 == 5)
        eval 22 = BoolResult (1 == 0)
        eval 23 = BoolResult (5 /= 5)


main = do
    putStrLn "Enter an expression to evaluate or 'quit' to exit"
    expression <- getLine
    if expression == "quit"
        then return ()
        else do
            let result = lookup (read expression) table
            case result of
                Just x -> print x
                Nothing -> do
                    putStrLn "Invalid expression"
                    main