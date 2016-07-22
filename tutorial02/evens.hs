isEven n = rem n 2 == 0

listEven [] = True
listEven (x:xs)
	| isEven x = listEven xs
	| otherwise = False
