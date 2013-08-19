module Main where
import Data.List

insertionSort :: (Ord a) => [a] -> [a]
-- insertionSort (x:xs) = foldr insert [x] xs --less but slower

insertionSort (x:xs) = insertionSortIter [x] xs 
    where insertionSortIter sorted []      =  sorted  
          insertionSortIter sorted (x:xs)  =  insertionSortIter (insert x sorted) xs
--          insert x []  = [x] --already done in data.list
--          insert x yarr@(y:ys) = if x > y then y:(insert x ys) else x:yarr
