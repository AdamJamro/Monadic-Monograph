module AST where
import Data.Text (Text)
import qualified Data.Text as T
import Data.Map (Map)
import qualified Data.Map as M
import Text.Megaparsec
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L
import Data.Void (Void)

-- CSS Abstract Syntax Tree:

type CSS = [Rule]

data Rule = Rule
    { selectors :: [Selector]
    , declarations :: [Declaration]
    } deriving (Show, Eq)

type Selector = Text -- e.g., "h1", ".class", "#id"

data Declaration = Declaration
    { property :: Property
    , value :: Value
    } deriving (Show, Eq)

type Property = Text -- e.g., "color"
type Value = Text    -- e.g., "red", "#FFF", "10px"

-- type alias
type Parser = Parsec Void Text -- Void - no custom error, Text - input stream
