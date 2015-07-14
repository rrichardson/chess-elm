module Chess.Util where

import Maybe exposing (map)
import List exposing (concatMap, filter, isEmpty, reverse, foldl, head)

takeWhile predicate lst = case lst of
  [] -> []
  (x::xs) -> if (predicate x)
             then x :: takeWhile predicate xs
             else []

dropWhile predicate lst = case lst of
  [] -> []
  (x::xs) -> if (predicate x)
             then dropWhile predicate xs
             else lst


(>>=) = flip concatMap

find : (a -> Bool) -> List a -> Maybe a
find f lst = case (filter f lst) of
  [] -> Nothing
  x::_ -> Just x

elem : a -> List a -> Bool
elem e lst = not << isEmpty <| filter (\x -> x == e) lst

groupElements lst =
  let group1 = foldl (\x (g::gs) -> if (head x == g) then (x::g)::gs else [x]::g::gs)
  in case (reverse lst) of
       [] -> []
       x::xs -> group1 [[x]] xs

{--

elm -m Chess\Util.elm
elm-repl
import Chess.Util (..)
takeWhile (\x -> x < 5) [2,4,1,7,2]
dropWhile (\x -> x < 5) [2,4,1,7,2]
mapMaybe (\x -> x + 5) <| Just 4
elem 2 [1,2,3]
groupElements [1,2,2,3,5,5,3,2]
:exit

-}
