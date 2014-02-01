--not true quicksort from example.
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort ([y | y <- xs, y < x]) ++ (x: quickSort ([z | z <- xs, z >= x]))
--quickSort (x:xs) = quickSort lowlist ++ (x: (quickSort highlist))
--    where (lowlist, highlist) = splitByValue x xs
--          splitByValue n (y:[]) = if(y < n) then ([y], [])  else ([], [y])
--          splitByValue n (y:ys) = if(y < n) then splitIter n ys ([y], [])  else splitIter n ys ([], [y])
--          splitIter n (y:[]) (l, h)  = if(y < n) then (y:l, h)  else (l, y:h)
--          splitIter n (y:ys) (l, h)  = if(y < n) then splitIter n ys (y:l, h)  else splitIter n ys (l, y:h)