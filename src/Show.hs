module Show (
    cssToString
    ) where

import Types
import Parser
import Text.Parsec.String

cssToString :: [Ruleset] -> String
cssToString = concat . (map rulesetToString)
    where mapWithNewline f = map ((++ "\n") . f)


rulesetToString :: Ruleset -> String
rulesetToString (Ruleset selector rules) =
    selector ++ " {"
    ++ rulesToString rules
    ++ "\n}\n"
    where
        rulesToString = concat . (mapWithWhitespace ruleToString)
        mapWithWhitespace f = map (("\n\t" ++) . f)

ruleToString :: Rule -> String
ruleToString (Rule name val) = name ++ ": " ++ val ++ ";"
