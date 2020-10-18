import Data.Char
import Control.Monad

main = forever $ do
    putStrLn "** Entrez ligne **"
    l <- getLine
    putStrLn $ map toUpper l
  