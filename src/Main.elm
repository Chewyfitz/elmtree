module Main exposing (..)

import Browser
import Browser.Navigation exposing (load)
import Html exposing (Html, button, div, text, b)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Url exposing (..)

import Model.Button exposing (..)
import Config.Buttons exposing (buttons)



-- MAIN


main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }

init : flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ _ _ = (buttons, Cmd.none)


-- MODEL

type alias Model = List Link


type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | FollowLink Link

-- UPDATE
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    FollowLink link -> (model, load (Url.toString link.target))
    LinkClicked _ -> (model, Cmd.none)
    UrlChanged _ -> (model, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

-- VIEW

makeLinkButton : Link -> Html Msg
makeLinkButton link =
    button [ onClick (FollowLink link) ] [ text link.label]

view : Model -> Browser.Document Msg
view model =
  { title = "elmtree"
  , body =
      [ div [] (List.map makeLinkButton model) ]
  }


  