
data Seq a = Nil | Cons a (Seq a)

count :: Eq a => a -> Seq a -> Int
count _ Nil = 0
count x (Cons y ys)
	| x == y	= 1 + count x ys
	| otherwise	= count x ys

