--not worked
data DblLinkedList a = Empty | LNode a (DblLinkedList a) (DblLinkedList a) deriving Show
insertBack :: (DblLinkedList a) -> a -> (DblLinkedList a)
insertBack cur@(LNode li prev Empty) i  = LNode li prev (LNode i cur Empty)
insertBack (LNode li prev next) i   = LNode li prev (insertBack next i)

mkDList xs = let (first, last) = go last xs first
             in  (first, last)

  where go :: DblLinkedList a -> [a] -> DblLinkedList a -> (DblLinkedList a, DblLinkedList a)
        go prev []     next = (next, prev)
        go prev (x:xs) next = let this        = DblLinkedList x prev rest
                                  (rest, last) = go this xs next
                              in  (this, last)
ins1 = insertBack (LNode 1 Empty Empty)
--main = do
--       print (ins1 2)
