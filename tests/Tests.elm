module Tests (..) where

import ElmTest exposing (..)
import PairingHeapTests


all : Test
all =
  suite
    "A Test Suite"
    [ PairingHeapTests.all
    ]
