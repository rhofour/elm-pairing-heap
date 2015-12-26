module PairingHeap (PairingHeap, empty, findMin, merge, insert, deleteMin, fromList, toSortedList) where

import Maybe exposing (Maybe(..))


type PairingHeap comparable
    = Empty
    | Heap comparable (List (PairingHeap comparable))


empty : PairingHeap comparable
empty =
    Empty


findMin : PairingHeap comparable -> Maybe comparable
findMin x =
    case x of
        Empty ->
            Nothing

        Heap x _ ->
            Just x


merge : PairingHeap comparable -> PairingHeap comparable -> PairingHeap comparable
merge heap1 heap2 =
    case ( heap1, heap2 ) of
        ( Empty, _ ) ->
            heap2

        ( _, Empty ) ->
            heap1

        ( Heap x xs, Heap y ys ) ->
            if x < y then
                Heap x (heap2 :: xs)
            else
                Heap y (heap1 :: ys)


insert : comparable -> PairingHeap comparable -> PairingHeap comparable
insert x heap =
    merge (Heap x []) heap


deleteMin : PairingHeap comparable -> PairingHeap comparable
deleteMin heap =
    case heap of
        Empty ->
            Empty

        Heap x heaps ->
            mergePairs heaps


mergePairs : List (PairingHeap comparable) -> PairingHeap comparable
mergePairs heaps =
    case heaps of
        [] ->
            Empty

        x :: [] ->
            x

        x :: (y :: xs) ->
            merge (merge x y) (mergePairs xs)



-- Extra convenience functions


fromList : List comparable -> PairingHeap comparable
fromList =
    List.foldl insert empty


toSortedList : PairingHeap comparable -> List comparable
toSortedList heap =
    case heap of
        Empty ->
            []

        Heap x _ ->
            x :: (toSortedList (deleteMin heap))
