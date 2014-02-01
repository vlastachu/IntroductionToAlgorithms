
module Main where
  
data TreeColor = Red | Black deriving Show
data RBTree key = Leaf TreeColor key (RBTree key) (RBTree key) | Empty deriving Show

--TODO можно сделать короче если воспользоваться deriving Eq 

insert :: (Ord a) => a -> RBTree a -> RBTree a
insert k t = fixHead $ ins k t
    where fixHead (Leaf _ a l r) = Leaf Black a l r
          ins a Empty = Leaf Red a Empty Empty
          ins a (Leaf color key left right) = fix $ if key > a then Leaf color key (ins a left) right else Leaf color key left (ins a right)
          fix (Leaf _ gpkey (Leaf Red pkey pl@(Leaf Red _ _ _) pr) (Leaf Red ukey ul ur)) = Leaf Red gpkey (Leaf Black pkey pl pr) (Leaf Black ukey ul ur)
          fix (Leaf _ gpkey (Leaf Red pkey pl pr@(Leaf Red _ _ _)) (Leaf Red ukey ul ur)) = Leaf Red gpkey (Leaf Black pkey pl pr) (Leaf Black ukey ul ur)
          fix (Leaf _ gpkey (Leaf Red pkey pl pr) (Leaf Red ukey ul@(Leaf Red _ _ _) ur)) = Leaf Red gpkey (Leaf Black pkey pl pr) (Leaf Black ukey ul ur)
          fix (Leaf _ gpkey (Leaf Red pkey pl pr) (Leaf Red ukey ul ur@(Leaf Red _ _ _))) = Leaf Red gpkey (Leaf Black pkey pl pr) (Leaf Black ukey ul ur)
          fix (Leaf gpclr gpkey parent@(Leaf Red _ _ (Leaf Red _ _ _)) gpr) = fix $ Leaf gpclr gpkey (leftRotate parent) gpr
          fix grandpa@(Leaf _ _ (Leaf Red _ (Leaf Red _ _ _) _) _) = fixcolors $ rightRotate grandpa
          fix (Leaf gpclr gpkey gpl parent@(Leaf Red _ (Leaf Red _ _ _) _)) = fix $ Leaf gpclr gpkey gpl (rightRotate parent)
          fix grandpa@(Leaf _ _ _ (Leaf Red _ _ (Leaf Red _ _ _))) = fixcolors $ leftRotate grandpa
          fix other = other
          leftRotate (Leaf color key left (Leaf rcolor rkey rleft rright)) = Leaf rcolor rkey (Leaf color key left rleft) rright
          rightRotate (Leaf color key (Leaf lcolor lkey lleft lright) right) = Leaf lcolor lkey lleft (Leaf color key lright right)
          fixcolors (Leaf _ a (Leaf _ l ll lr) (Leaf _ r rl rr)) = Leaf Black a (Leaf Red l ll lr) (Leaf Red r rl rr)

--TODO remove, find
main :: IO ()
main = print $ foldr insert Empty ([13, 15, 1, 6, 8 , 11, 25, 22, 27, 17] :: [Integer])
