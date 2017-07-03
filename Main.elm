module Main exposing (main)

import Html exposing (..)


main =
    ul [] (List.map dropdownItem fruits)


fruits : List String
fruits =
    [ "bananas"
    , "apples"
    , "oranges"
    , "peaches"
    , "strawberries"
    ]


dropdownItem : String -> Html a
dropdownItem value =
    li [] [ text value ]
