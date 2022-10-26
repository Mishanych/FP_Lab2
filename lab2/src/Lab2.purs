module Lab2 where

import Data.List (List(..), (:), reverse)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Tuple (Tuple(..),fst,snd)
import Prelude
import Effect (Effect)
import Effect.Console (log)

findIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndex p list = findElement 0 p list 
  where
  findElement :: Int -> (a -> Boolean) -> List a -> Maybe Int
  findElement n p (x : xs) | p x = Just n
                | otherwise = findElement (n + 1) p xs
  findElement _ _ Nil = Nothing

findLastIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findLastIndex p list = findElement 0 p list Nothing
  where
  findElement :: Int -> (a -> Boolean) -> List a -> Maybe Int -> Maybe Int
  findElement n p (x : xs) el | p x = findElement (n + 1) p xs (Just n) 
                | otherwise = findElement (n + 1) p xs el 
  findElement _ _ Nil el = el

zip :: forall a b. List a -> List b -> List (Tuple a b)
zip (x : xs) (y : ys) = Cons (Tuple x y) (zip xs ys)
zip _ _ = Nil

unzip :: forall a b. List (Tuple a b) -> Tuple (List a) (List b)
unzip zl = Tuple (unzipListX zl) (unzipListY zl)
  where
  unzipListX :: List (Tuple a b) -> List a
  unzipListX (z : zs) = Cons (fst z) (unzipListX zs)
  unzipListX Nil = Nil
  unzipListY :: List (Tuple a b) -> List b
  unzipListY (z : zs) = Cons (snd z) (unzipListY zs)
  unzipListY Nil = Nil

filter :: forall a. (a -> Boolean) -> List a -> List a
filter p (x : xs) 
    | p x = Cons x (filter p xs)
    | otherwise = filter p xs
filter _ Nil = Nil

filterTail :: forall a. (a -> Boolean) -> List a -> List a -> List a
filterTail p (x : xs) resultList 
    | p x = filterTail p xs (x : resultList) 
    | otherwise = filterTail p xs resultList
filterTail _ _ resultList = reverse resultList

take :: forall a. Int -> List a -> List a
take n (x : xs) 
    | n == 0 = Nil
    | otherwise = Cons x (take (n-1) xs)
take _ _ = Nil

takeTail :: forall a. Int -> List a -> List a -> List a
takeTail n (x : xs) resultList
    | n == 0 = reverse resultList
    | otherwise = takeTail (n-1) xs ( x : resultList )
takeTail _ _ resultList= reverse resultList


