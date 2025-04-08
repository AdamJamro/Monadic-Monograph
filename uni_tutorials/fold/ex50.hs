module Matrix(Matrix, addM, multM, intPowerM, dims, transposeM) where
import Data.List (transpose)

safeHead (x:_) = [x]
safeHead _ = []

type Matrix a = [[a]]

dims :: Matrix a -> (Int, Int)
dims [] = (0, 0)
dims m = (length m, length (safeHead m))

addM :: Num a => Matrix a -> Matrix a -> Maybe (Matrix a)
addM a b = if dims a /= dims b then Nothing else Just (zipWith (zipWith (+)) a b)

transposeM :: Matrix a -> Matrix a
transposeM = undefined

intPowerM = undefined

-- | Matrix multiplication
multM :: Num a => Matrix a -> Matrix a -> Matrix a
multM [] _ = []
multM _ [] = []

