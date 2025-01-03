{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Data.Text as T
import qualified Data.Text.IO as TI
import Lib
import qualified System.Environment
import qualified System.Exit
import System.IO

type ErrorMessage = T.Text

parseArgs :: IO FilePath
parseArgs = do
  args <- System.Environment.getArgs
  let len = length args
  if len == 0
    then
      System.Exit.die "You must specify an input file"
    else
      if len >= 2
        then
          System.Exit.die "You must specify exactly one input file"
        else
          return $ head args

processFile :: FilePath -> Either ErrorMessage T.Text
-- processFile path = Left "error"

processFile path = Right "true"

printResult :: Either ErrorMessage T.Text -> IO ()
printResult (Left errMsg) = do
  TI.hPutStrLn stderr errMsg
  System.Exit.exitFailure
printResult (Right out) = TI.putStr out

main :: IO ()
main = do
  inFile <- parseArgs
  let out = processFile inFile
  printResult out

-- args <- getArgs
-- let fileName = head args
-- input <- TI.readFile fileName
-- TI.putStrLn input
