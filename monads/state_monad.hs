newtype State s a = State { runState :: s -> (a, s) }

-- monad needs to be a functor, so let's implement that explicitly
instance Functor (State s) where
    fmap f (State g) = State $ \s -> let (a, newState) = g s in (f a, newState)

-- monad needs to be an applicative functor, so let's implement that explicitly
instance Applicative (State s) where
    pure :: a -> State s a
    pure x = State (\s -> (x, s))
    (<*>) :: State s (a -> b) -> State s a -> State s b
    State fs <*> State as = State $ \s ->
        let (func, newState) = fs s
            (a, finalState) = as newState
        in (func a, finalState)

instance Monad (State s) where
    return :: a -> State s a
    return = pure
    (>>=) :: State s a -> (a -> State s b) -> State s b
    State f >>= g = State $ \s ->
        let (a, newState) = f s
            State h = g a
        in h newState


--playground

incrementState :: State Int Int
incrementState = State $ \s -> (s, s + 1)

increment2State :: State Int (Int,Int)
increment2State = do
    x <- incrementState
    y <- incrementState
    return (x, y)

increment3State :: State Int (Int, Int, Int)
increment3State = do
    x <- incrementState
    y <- incrementState
    z <- incrementState
    return (x, y, z)

increment :: Int -> State Int Int
increment n = State $ \s -> (s, s + n)


get :: State s s
get = State $ \s -> (s, s)

put :: s -> State s ()
put newState = State $ const ((), newState)

generateID :: State Int Int
generateID = do
    id <- get
    put (id + 1)
    return id

generateIDsAsState :: Int -> State Int [Int]
generateIDsAsState 0 = return []
generateIDsAsState n = do
    id <- generateID
    ids <- generateIDsAsState (n - 1)
    return (id : ids)

generateIDs :: Int -> Int -> [Int]
generateIDs start length = evalState (generateIDsAsState length) start



generateIDs' 0 = []
generateIDs' n = evalState (sequence (replicate n generateID)) 0

evalState state s = fst (runState state s)





type Seed = Int

nextRand :: State Seed Int
nextRand = do
  s <- get
  let s' = (s * 1103515245 + 12345) `mod` 2^31
  put s'
  return s'

randomList :: Int -> Seed -> [Int]
randomList 0 _ = []
randomList n seed = evalState (sequence (replicate n nextRand)) seed