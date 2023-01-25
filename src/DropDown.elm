module DropDown exposing (dropDown, DropDownMsg(..), Model, handleClick)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

type DropDownMsg = Click | Select 

type alias Model = { open : Bool, options : List String, selected : String}

dropDown w state = case state.open of 
  True -> div [onClick (w Click)] [text "open"]
  False -> div [onClick (w Click)] [text "closed"]

handleClick msg model = case model.open of
  True -> {model | open = False }
  False -> {model | open = True }
