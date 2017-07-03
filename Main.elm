module Main exposing (main)

import Html exposing (..)


main =
    view fruits


fruits : List String
fruits =
    [ "bananas"
    , "apples"
    , "oranges"
    , "peaches"
    , "strawberries"
    ]


view : List String -> Html a
view values =
    ul [] (List.map dropdownItem values)


dropdownItem : String -> Html a
dropdownItem value =
    li [] [ text value ]
