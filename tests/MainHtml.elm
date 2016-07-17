module MainHtml exposing (..)

import ElmTest exposing (..)
import PairingHeapTests


main : Program Never
main =
  runSuiteHtml PairingHeapTests.all
