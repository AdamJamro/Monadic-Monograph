module Matrix(Matrix, addM, multM, intPowerM, dims, transposeM) where
import Data.List (transpose)

safeHead (x:_) = [x]
safeHead _ = []

type Matrix a = [[a]]
type Vector a = [a]

dims :: Matrix a -> (Int, Int)
dims [] = (0, 0)
dims m = (length m, length (safeHead m))

addM :: Num a => Matrix a -> Matrix a -> Matrix a
addM = zipWith (zipWith (+))

safeAddM :: Num a => Matrix a -> Matrix a -> Maybe (Matrix a)
safeAddM a b = if dims a /= dims b then Nothing else Just (zipWith (zipWith (+)) a b)

transposeM :: Matrix a -> Matrix a
transposeM = transpose


-- | Matrix multiplication
multM :: Num a => Matrix a -> Matrix a -> Matrix a
multM [] _ = []
multM _ [] = []
multM a b = [ [ sum $ zipWith (*) ar bc | bc <- transposedB ] | ar <- a ]
    where
        transposedB = transpose b


-- assume dimensions are ok! 
intPowerM m 0 = identityM $ dims m
intPowerM m n = multM m (intPowerM m (n-1))
        
identityM :: Num a => (Int, Int) -> Matrix a
identityM (0, 0) = [[]]
identityM (1, 1) = [[1]]
identityM (n, m) = [ [if i == j then 1 else 0 | j <- [1..m]] | i <- [1..n]]

matrixVectorProd :: Num a => Matrix a -> Vector a -> Vector a
matrixVectorProd m v = [ sum $ zipWith (*) r v | r <- m ]

subM :: Num a => Matrix a  -> Matrix a -> Matrix a
subM = zipWith (zipWith (-))