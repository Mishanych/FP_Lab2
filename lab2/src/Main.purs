module Main where

import Lab2 as Lab2
import Data.List (List(..), (:))
import Prelude
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
    log $ show $ Lab2.findIndex (\x -> x > 2) (1:2:5:10:Nil)
    log $ show $ Lab2.findIndex (\x -> x > 10) (1:2:5:10:Nil)
    log $ show $ Lab2.findLastIndex (\x -> x > 2) (1:2:5:10:Nil)
    log $ show $ Lab2.findLastIndex (\x -> x > 10) (1:2:5:10:Nil)
    log $ show $ Lab2.zip (1:2:3:Nil) ('a':'b':'c':Nil)
    log $ show $ Lab2.unzip (Lab2.zip (1:2:3:Nil) ('a':'b':'c':Nil))
    log $ show $ Lab2.filter (\x -> x > 0) (1:2:5:10:Nil)
    log $ show $ Lab2.filter (\x -> x > 2) (1:2:5:10:Nil)
    log $ show $ Lab2.filter (\x -> x > 10) (1:2:5:10:Nil)
    log $ show $ Lab2.filterTail (\x -> x > 0) (1:2:5:10:Nil) Nil
    log $ show $ Lab2.filterTail (\x -> x > 2) (1:2:5:10:Nil) Nil
    log $ show $ Lab2.filterTail (\x -> x > 10) (1:2:5:10:Nil) Nil
    log $ show $ Lab2.take 2 (1:2:5:10:Nil)
    log $ show $ Lab2.take 0 (1:2:5:10:Nil)
    log $ show $ Lab2.take 10 (1:2:5:10:Nil)
    log $ show $ Lab2.takeTail 2 (1:2:5:10:Nil) Nil
    log $ show $ Lab2.takeTail 0 (1:2:5:10:Nil) Nil
    log $ show $ Lab2.takeTail 10 (1:2:5:10:Nil) Nil




