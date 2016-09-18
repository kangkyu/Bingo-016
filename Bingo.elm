module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (toUpper, repeat, trimRight)

title message times =
  message ++ " "
    |> toUpper
    |> repeat times
    |> trimRight
    |> text

pageHeader =
  h1 [ id "logo", class "classy" ] [ title "Bingo!" 3 ] -- list of attributes, child element (Html type)

pageFooter =
  footer [ ]
    [ a [ href "http://pragstudio.com" ]
        [ text "The Pragmatic Studio" ]
    ]
view =
  div [ id "container" ] [ pageHeader, pageFooter ]


main =
  view
