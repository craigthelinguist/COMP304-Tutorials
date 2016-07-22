
minmax :: Ord a => [a] -> (a,a)
minmax [] = error "Cannot find minmax of empty list"
minmax [x] = (x,x)
minmax (x:xs) =
	let (smallest, largest) = minmax(xs)
	in (min smallest x, max largest x)
