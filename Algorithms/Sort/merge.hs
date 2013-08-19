module Main where
import Data.List


mergeSort :: (Ord a) => [a] -> [a]
mergeSort (x:[])      = [x]
mergeSort  list       = merge (mergeSort list1) (mergeSort list2)
        where (list1, list2) = splitAt (length list `div` 2) list
              merge [] list                 = list
              merge list []                 = list
              merge xarr@(x:xs) yarr@(y:ys) = if x < y then x:(merge xs (yarr)) 
                                                       else y:(merge (xarr) ys)
