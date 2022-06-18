module Config.Buttons exposing (buttons)

import Model.Button exposing (Link, parseOrDefault)

-- This is simply a tuple list of:
--  (label, target)
buttonConfig =
    [ ("Google", "http://google.com")
    , ("Facebook", "http://facebook.com")
    , ("linkedin", "http://linkedin.com")
    , ("Send me an email", "mailto:email@example.com") -- <---- Not working
    ]

buttonTupleToLinkObject (label, target) = { label=label, target= (parseOrDefault target) }

buttons = List.map buttonTupleToLinkObject buttonConfig