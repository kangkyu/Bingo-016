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

initialModel =
  { entries =
    [ newEntry "Doing Agile" 200 2
    , newEntry "In the Cloud" 300 3
    , newEntry "Future-Proof" 100 1
    , newEntry "Rock-Star Ninja" 400 4
    ]
  }

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

entryList entries =
  ul [ ]
    (List.map entryItem entries)

view model =
  div [ id "container" ]
    [ pageHeader
    , entryList model.entries
    , pageFooter
    ]


main =
  view initialModel
