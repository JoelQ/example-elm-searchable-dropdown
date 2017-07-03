module Main exposing (main)

import Html exposing (..)


main =
    view initialModel


type State
    = Open
    | Closed


initialModel : { state : State, values : List String }
initialModel =
    { state = Open
    , values = fruits
    }


fruits : List String
fruits =
    [ "bananas"
    , "apples"
    , "oranges"
    , "peaches"
    , "strawberries"
    ]


view : { state : State, values : List String } -> Html a
view model =
    case model.state of
        Open ->
            viewOpen model

        Closed ->
            viewClosed model


viewOpen : { state : State, values : List String } -> Html a
viewOpen model =
    div []
        [ p [] [ text "Click to Open" ]
        , ul [] (List.map dropdownItem model.values)
        ]


viewClosed : Html a
viewClosed =
    div []
        [ p [] [ text "Click to Close" ]
        ]


dropdownItem : String -> Html a
dropdownItem value =
    li [] [ text value ]
