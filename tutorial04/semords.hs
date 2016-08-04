

-- A semordnilap is a pair of words (a,b) where a is b spelled backwards.

longestSemord strs =
   let allPairs = [(x,y) | x <- strs, y <- strs, x /= y]
       semords  = filter (\(x,y) -> reverse x == y) allPairs
       longer (a,b) (c,d) = if length a > length c then (a,b) else (c,d)
    in foldl1 longer semords


