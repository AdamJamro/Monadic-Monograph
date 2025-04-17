import Data.List
-- Deterministic finite automaton

data NFA state symbol =
    NFAConstructor
    { nfaTransition :: state -> symbol -> [state]
    , nfaStart :: state
    , nfaAcceptStates :: [state]
    , nfaAlphabet :: [symbol]
    , nfaStates :: [state]
    } 


data DFA state symbol =
    DFAConstructor
    { transition :: state -> symbol -> state
    , start :: state
    , acceptStates :: [state]
    , alphabet :: [symbol]
    , states :: [state]
    }

determine :: (Eq state, Ord state) => NFA state symbol -> DFA [state] symbol
determine (NFAConstructor nfaTransition nfaStart nfaAcceptStates nfaAlphabet nfaStates) = DFAConstructor
  { transition = dfaTransition
  , start = [nfaStart]
  , acceptStates =
                [subset | subset <- reachableStates, any (`elem` nfaAcceptStates) subset]
  , alphabet = nfaAlphabet
  , states = reachableStates
  }
   where
    powerset :: [a] -> [[a]]
    powerset [] = [[]]
    powerset (x:xs) = let ps = powerset xs in ps ++ map (x:) ps
    reachableStates =
        let reachable = iterate propagate [[nfaStart]]
        in
            fst . head $ dropWhile (not . areTheSame) (zip reachable (tail reachable))  -- Get all reachable states from the start state
    areTheSame :: Eq state => ([state], [state]) -> Bool
    areTheSame ([], []) = True
    areTheSame ([], _) = False
    areTheSame (_, []) = False 
    areTheSame (x:xs, y:ys) = (x == y) && areTheSame (xs,ys)
    propagate [] = []
    propagate (x:xs)
        = nub . sort $
        (nub . sort $ map propagateForSymbol nfaAlphabet) ++ propagate xs
        where
            propagateForSymbol input_symbol = nub . sort $ concatMap (`nfaTransition` input_symbol) x
    dfaTransition states input_symbol = nub . sort $ concatMap (`nfaTransition` input_symbol) states
 
accepts :: Eq state => DFA state symbol -> [symbol] -> Bool
accepts dfa = (`elem` acceptStates dfa) . foldl (transition dfa) (start dfa)

nfaAccepts :: (Eq state, Ord state) => NFA state symbol -> [symbol] -> Bool
nfaAccepts nfa = accepts (determine nfa)

data CustomStates = Accept | Reject
    deriving (Eq, Show, Ord)
data CustomALphabet = ZERO | ONE
    deriving (Eq, Show, Ord)

customNFA :: NFA CustomStates CustomALphabet
customNFA = NFAConstructor
  { nfaTransition = \q a -> case (q, a) of
    (Reject, ONE) -> [Reject, Accept]
    (Reject, ZERO) -> [Reject]
    (_, _) -> []
  , nfaStart = Reject
  , nfaAcceptStates = [Accept]
  , nfaAlphabet = [ZERO, ONE]
  , nfaStates = [Reject, Accept]
  }

