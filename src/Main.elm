module Main exposing (main)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import DropDown as D exposing (dropDown, DropDownMsg(..), Model, handleClick)


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model = { text : String, dropDown : D.Model, dropDown2 : D.Model }


init : Model
init = { 
  text = "a", 
  dropDown = {open = False, options = ["test1", "2", "3"], selected = ""},
  dropDown2 = {open = False, options = ["test1", "2", "3"], selected = ""}
  }

-- UPDATE

type Msg
  = Increment
  | Decrement
  | DropDown1Event D.DropDownMsg
  | DropDown2Event D.DropDownMsg


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | text = model.text ++ "a" }

    Decrement ->
      { model | text = model.text ++ "b" }

    DropDown1Event e -> { model | dropDown = (D.handleClick e model.dropDown) }
    DropDown2Event e -> { model | dropDown2 = (D.handleClick e model.dropDown2) }
      
-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (model.text) ]
    , button [ onClick Increment ] [ text "+" ]
    , D.dropDown DropDown1Event model.dropDown
    , D.dropDown DropDown2Event model.dropDown2
    ]