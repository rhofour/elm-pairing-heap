module PairingHeapTests (..) where

import PairingHeap exposing (..)
import ElmTest exposing (..)
import Maybe exposing (..)


h1 =
  insert ( 5, () ) empty


h2 =
  insert ( 10, () ) h1


h3 =
  insert ( 1, () ) h2


h4 =
  insert ( 7, () ) empty


h5 =
  insert ( 2, () ) h4


all : Test
all =
  suite
    "PairingHeap Tests"
    [ suite
        "Empty Tests"
        [ test "Min is Nothing" (assertEqual (findMin empty) Nothing)
        , suite
            "Merge is identity"
            [ defaultTest (assertEqual (merge empty empty) empty)
            , defaultTest (assertEqual (merge empty h1) h1)
            , defaultTest (assertEqual (merge h2 empty) h2)
            , defaultTest (assertEqual (merge empty h3) h3)
            ]
        , defaultTest (assertEqual (findMin (insert ( 42, True ) empty)) (Just ( 42, True )))
        , defaultTest (assertEqual (deleteMin (insert ( 42, False ) empty)) empty)
        ]
    , suite
        "Non-empty Tests"
        [ suite
            "Heapsort"
            -- To test insert and deleteMin
            [ defaultTest (assertEqual (heapsort []) [])
            , defaultTest (assertEqual (heapsort [ 1, 2, 3 ]) [ 1, 2, 3 ])
            , defaultTest (assertEqual (heapsort [ 2, 3, 1 ]) [ 1, 2, 3 ])
            , defaultTest (assertEqual (heapsort [ 2, 3, 1 ]) [ 1, 2, 3 ])
            , defaultTest (assertEqual (heapsort [ 5, 2, 3, 1, 4 ]) [ 1, 2, 3, 4, 5 ])
            ]
        , test
            "Merge test"
            (assertEqual
              (toSortedList (merge h3 h5))
              [ ( 1, () ), ( 2, () ), ( 5, () ), ( 7, () ), ( 10, () ) ]
            )
        ]
    ]


heapsort : List comparable -> List comparable
heapsort =
  (List.map (\x -> ( x, () ))) >> fromList >> toSortedList >> (List.map (\( k, _ ) -> k))
