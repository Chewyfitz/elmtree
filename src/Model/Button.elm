module Model.Button exposing (..)

import Url exposing (..)

type alias Link =
  { label: String
  , target: Url
  }

parseOrDefault : String -> Url
parseOrDefault str = 
  case Url.fromString str of
    Just a -> a
    _ ->  { protocol = Https
          , host = "google.com"
          , port_ = Just 443
          , path = "/"
          , query = Nothing
          , fragment = Nothing
          }