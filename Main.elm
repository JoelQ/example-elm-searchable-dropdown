module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }


type State
    = Open
    | Closed


type alias Model =
    { state : State, values : List String }


initialModel : Model
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


view : Model -> Html Msg
view model =
    case model.state of
        Open ->
            viewOpen model

        Closed ->
            viewClosed


viewOpen : Model -> Html Msg
viewOpen model =
    div []
        [ p [ onClick CloseSelect ] [ text "Click to close" ]
        , ul [] (List.map dropdownItem model.values)
        ]


viewClosed : Html Msg
viewClosed =
    div []
        [ p [ onClick OpenSelect ] [ text "Click to open" ]
        ]


dropdownItem : String -> Html a
dropdownItem value =
    li [] [ text value ]


type Msg
    = OpenSelect
    | CloseSelect


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenSelect ->
            { model | state = Open }

        CloseSelect ->
            { model | state = Closed }
