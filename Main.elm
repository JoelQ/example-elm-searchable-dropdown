module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)


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
    { state : State
    , values : List String
    , selected : Maybe String
    , query : String
    }


initialModel : Model
initialModel =
    { state = Open
    , values = fruits
    , selected = Nothing
    , query = ""
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
            viewClosed model


viewOpen : Model -> Html Msg
viewOpen model =
    div []
        [ dropdownHead model.selected CloseSelect
        , input [ onInput SearchInput ] []
        , ul [] (List.map dropdownItem (filteredValues model))
        ]


viewClosed : Model -> Html Msg
viewClosed model =
    div []
        [ dropdownHead model.selected OpenSelect
        ]


dropdownItem : String -> Html Msg
dropdownItem value =
    li [ onClick (ItemSelected value) ] [ text value ]


dropdownHead : Maybe String -> Msg -> Html Msg
dropdownHead selected msg =
    case selected of
        Nothing ->
            p [ onClick msg ] [ text "Click to toggle" ]

        Just value ->
            p [ onClick msg ] [ text value ]


filteredValues : Model -> List String
filteredValues model =
    List.filter (\v -> matchQuery model.query v) model.values


matchQuery : String -> String -> Bool
matchQuery needle haystack =
    String.contains (String.toLower needle) (String.toLower haystack)


type Msg
    = OpenSelect
    | CloseSelect
    | ItemSelected String
    | SearchInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenSelect ->
            { model | state = Open }

        CloseSelect ->
            { model | state = Closed }

        ItemSelected value ->
            { model | selected = Just value, state = Closed }

        SearchInput query ->
            { model | query = query }
