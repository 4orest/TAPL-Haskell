{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import System.Environment
import System.IO
import qualified Data.Text as T
import qualified Data.Text.IO as TI
import Lib

main :: IO ()
main = do
    args <- getArgs
    let fileName = head args
    input <- TI.readFile fileName
    TI.putStrLn input
    
