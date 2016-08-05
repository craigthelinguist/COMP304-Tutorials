

-- A semordnilap is a pair of words (a,b) where a is b spelled backwards.

longestSemord strs =
   let semords = [(x,y) | x <- strs, y <- strs, x /= y, reverse x == y]
       longer (a,b) (c,d) = if length a > length c then (a,b) else (c,d)
    in foldl1 longer semords


