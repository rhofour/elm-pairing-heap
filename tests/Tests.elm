module Tests exposing (..)

import Test exposing (..)
import Expect
import PairingHeap exposing (..)
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
    describe
        "PairingHeap Tests"
        [ describe
            "Empty Tests"
            [ test "Min is Nothing" <| \() -> (Expect.equal (findMin empty) Nothing)
            , describe
                "Merge is identity"
                [ test "merge empty empty = empty" <| \() -> (Expect.equal (merge empty empty) empty)
                , test "merge empty h1 = h1" <| \() -> (Expect.equal (merge empty h1) h1)
                , test "merge h2 empty = h2" <| \() -> (Expect.equal (merge h2 empty) h2)
                , test "merge h3 empty = h3" <| \() -> (Expect.equal (merge empty h3) h3)
                ]
            , test "it finds the minimal value" <| \() -> (Expect.equal (findMin (insert ( 42, True ) empty)) (Just ( 42, True )))
            , test "it deletes the minimal value" <| \() -> (Expect.equal (deleteMin (insert ( 42, False ) empty)) empty)
            ]
        , describe
            "Non-empty Tests"
            [ describe
                "Heapsort"
                -- To test insert and deleteMin
                [ test "it heapsorts empty lists" <| \() -> (Expect.equal (heapsort []) [])
                , test "it heapsorts sorted lists" <| \() -> (Expect.equal (heapsort [ 1, 2, 3 ]) [ 1, 2, 3 ])
                , test "it heapsorts sorted and descending lists" <| \() -> (Expect.equal (heapsort [ 2, 3, 1 ]) [ 1, 2, 3 ])
                , test "it heapsorts unsorted lists 1" <| \() -> (Expect.equal (heapsort [ 2, 3, 1 ]) [ 1, 2, 3 ])
                , test "it heapsorts unsorted lists 2" <| \() -> (Expect.equal (heapsort [ 5, 2, 3, 1, 4 ]) [ 1, 2, 3, 4, 5 ])
                ]
            , test
                "Merge test"
              <|
                \() ->
                    (Expect.equal
                        (toSortedList (merge h3 h5))
                        [ ( 1, () ), ( 2, () ), ( 5, () ), ( 7, () ), ( 10, () ) ]
                    )
            ]
        ]


heapsort : List comparable -> List comparable
heapsort =
    (List.map (\x -> ( x, () ))) >> fromList >> toSortedList >> (List.map (\( k, _ ) -> k))
