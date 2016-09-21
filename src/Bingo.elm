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
  h1 [ ] [ title "Bingo!" 3 ]
  -- list of attributes, child element (Html type)

pageFooter =
  footer [ ]
    [ a [ href "http://pragstudio.com" ] [ text "The Pragmatic Studio" ]
    ]

newEntry phrase points id =
  { phrase = phrase
  , points = points
  , id = id
  , wasSpoken = False
  }

entryItem entry =
  li [ ]
    [ span [ class "phrase" ] [ text entry.phrase ]
    , span [ class "points" ] [ text (toString entry.points) ]
    ]

entryList =
  ul [ ]
    [ entryItem (newEntry "Future-Proof" 100 1)
    , entryItem (newEntry "Doing Agile" 200 2)
    ]

view =
  div [ id "container" ]
    [ pageHeader
    , entryList
    , pageFooter
    ]


main =
  view
