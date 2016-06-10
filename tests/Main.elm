module Main (..) where

import ElmTest exposing (..)
import Graphics.Element exposing (Element)
import Tests


main : Element
main =
  elementRunner Tests.all
