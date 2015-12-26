module PairingHeap (PairingHeap, empty, findMin, merge, insert, deleteMin, fromList, toSortedList) where

import Maybe exposing (Maybe(..))


type PairingHeap comparable a
    = Empty
    | Heap comparable a (List (PairingHeap comparable a))


empty : PairingHeap comparable a
empty =
    Empty


findMin : PairingHeap comparable a -> Maybe (comparable, a)
findMin x =
    case x of
        Empty ->
            Nothing

        Heap k v _ ->
            Just (k, v)


merge : PairingHeap comparable a -> PairingHeap comparable a -> PairingHeap comparable a
merge heap1 heap2 =
    case ( heap1, heap2 ) of
        ( Empty, _ ) ->
            heap2

        ( _, Empty ) ->
            heap1

        ( Heap k1 v1 hs1, Heap k2 v2 hs2 ) ->
            if k1 < k2 then
                Heap k1 v1 (heap2 :: hs1)
            else
                Heap k2 v2 (heap1 :: hs2)


insert : (comparable, a) -> PairingHeap comparable a -> PairingHeap comparable a
insert (k, v) heap =
    merge (Heap k v []) heap


deleteMin : PairingHeap comparable a -> PairingHeap comparable a
deleteMin heap =
    case heap of
        Empty ->
            Empty

        Heap k v heaps ->
            mergePairs heaps


mergePairs : List (PairingHeap comparable a) -> PairingHeap comparable a
mergePairs heaps =
    case heaps of
        [] ->
            Empty

        x :: [] ->
            x

        x :: (y :: xs) ->
            merge (merge x y) (mergePairs xs)



-- Extra convenience functions


fromList : List (comparable, a) -> PairingHeap comparable a
fromList =
    List.foldl insert empty


toSortedList : PairingHeap comparable a -> List (comparable, a)
toSortedList heap =
    case heap of
        Empty ->
            []

        Heap k v _ ->
            (k, v) :: (toSortedList (deleteMin heap))
