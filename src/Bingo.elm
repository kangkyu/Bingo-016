module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (toUpper, repeat, trimRight)

-- MODEL

newEntry phrase points id =
  { phrase = phrase
  , points = points
  , id = id
  , wasSpoken = False
  }

initialModel =
  { entries =
    [ newEntry "Doing Agile" 200 2
    , newEntry "In the Cloud" 300 3
    , newEntry "Future-Proof" 100 1
    , newEntry "Rock-Star Ninja" 400 4
    ]
  }

-- UPDATE

type Action = NoOp | Sort -- union type (custom Action type)

update action model =
  case action of
    NoOp ->
      model

    Sort ->
      { model | entries = List.sortBy (\entry -> entry.points) model.entries }

-- VIEW

title message times =
  message ++ " "
    |> toUpper
    |> repeat times
    |> trimRight
    |> text

pageHeader =
  h1 [ ] [ title "Bingo!" 3 ]

pageFooter =
  footer [ ]
    [ a [ href "http://pragstudio.com" ] [ text "The Pragmatic Studio" ]
    ]

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


-- WIRE IT ALL TOGETHER

main =
  view (update Sort initialModel)
