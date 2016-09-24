module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)
import Signal exposing (..)
import StartApp.Simple as StartApp


-- MODEL

type alias Entry =
  { phrase    : String
  , points    : Int
  , id        : Int
  , wasSpoken : Bool
  }


type alias Model =
  { entries : List Entry
  }


newEntry : String -> Int -> Int -> Entry
newEntry phrase points id =
  { phrase = phrase
  , points = points
  , id = id
  , wasSpoken = False
  }


initialModel : Model
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


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Sort ->
      { model | entries = List.sortBy (\entry -> entry.points) model.entries }


-- VIEW

title : String -> Int -> Html
title message times =
  message ++ " "
    |> toUpper
    |> repeat times
    |> trimRight
    |> text


pageHeader : Html
pageHeader =
  h1 [ ] [ title "Bingo!" 3 ]


pageFooter : Html
pageFooter =
  footer [ ]
    [ a [ href "http://pragstudio.com" ] [ text "The Pragmatic Studio" ]
    ]


entryItem : Entry -> Html
entryItem entry =
  li [ ]
    [ span [ class "phrase" ] [ text entry.phrase ]
    , span [ class "points" ] [ text (toString entry.points) ]
    ]


entryList : List Entry -> Html
entryList entries =
  ul [ ] (List.map entryItem entries)


view : Address Action -> Model -> Html
view address model =
  div [ id "container" ]
    [ pageHeader
    , entryList model.entries
    , button [ class "sort", onClick address Sort ] [ text "Sort" ]
    , pageFooter
    ]


-- WIRE IT ALL TOGETHER

main : Signal Html
main =
  StartApp.start
    { model = initialModel
    , view = view
    , update = update
    }
