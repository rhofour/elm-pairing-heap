module MainCli exposing (..)

import ElmTest exposing (..)
import PairingHeapTests


main : Program Never
main =
  runSuite PairingHeapTests.all
