-- Deterministic finite automaton

data DFA state symbol = 
    LongDFA
     { states :: [state]
    , alphabet :: [symbol]
    , transition :: state -> symbol -> state
    , start :: state
    , acceptStates :: [state]
    } 
    | ShortDFA 
    { transition :: state -> symbol -> state
    , start :: state
    , acceptStates :: [state]
    }

accepts :: Eq state => DFA state symbol -> [symbol] -> Bool
accepts dfa = (`elem` acceptStates dfa) . foldl (transition dfa) (start dfa)

-- dfa :: DFA Int Char
-- dfa = LongDFA
--   { states = [0, 1, 2]
--   , alphabet = ['a', 'b']
--   , transition = \q a -> case (q, a) of
--       (0, 'a') -> 1
--       (0, 'b') -> 0
--       (1, 'a') -> 1
--       (1, 'b') -> 2
--       (2, 'a') -> 1
--       (2, 'b') -> 0
--       _ -> error "Invalid transition"
--   , start = 0
--   , accept = (== 2)
--   }

data CustomStates = EVEN | ODD | First0 | Second1 | Init | Reject
    deriving (Eq, Show)
data CustomALphabet = ZERO | ONE
    deriving (Eq, Show)

customDFA :: DFA CustomStates CustomALphabet
customDFA = ShortDFA
  { transition = \q a -> case (q, a) of
    (Init, ONE) -> Reject
    (Init, ZERO) -> First0
    (First0, ONE) -> Second1
    (First0, ZERO) -> Reject
    (Second1, ONE) -> EVEN
    (Second1, ZERO) -> ODD
    (EVEN, ONE) -> ODD
    (EVEN, ZERO) -> EVEN
    (ODD, ONE) -> EVEN
    (ODD, ZERO) -> ODD
    (Reject, _) -> Reject
  , start = Init
  , acceptStates = [EVEN]
  }