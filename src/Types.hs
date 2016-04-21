module Types (
  Rule(Rule),
  Ruleset(Ruleset)

  ) where

data Rule = Rule String String
            deriving (Show)

data Ruleset = Ruleset String [Rule]
               deriving (Show)
