module Minify (
    minifyCss
    ) where

import Types

minifyCss :: [Ruleset] -> String
minifyCss = concat . (map minifyRuleset)

minifyRuleset :: Ruleset -> String
minifyRuleset (Ruleset selector rules) =
    selector ++ "{"
    ++ minifyRules rules
    ++ "}"

minifyRules :: [Rule] -> String
minifyRules = init . concat . (map minifyRule)

minifyRule :: Rule -> String
minifyRule (Rule name val) = name ++ ":" ++ val ++ ";"
