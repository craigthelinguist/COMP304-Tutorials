
mymax :: Ord a => a -> a -> a
mymax x y
	| y > x = y
	| otherwise = x

mymax :: Ord a => (a,a) -> a
mymax (x,y) = mymax x y

