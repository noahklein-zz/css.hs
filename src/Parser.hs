module Parser (
    csv
    ) where

import Text.Parsec
import Text.Parsec.String
import Control.Applicative hiding ((<|>), many, optional)

import Types

csv :: Parser [Ruleset]
csv = ruleset `endBy` spaces

ruleset :: Parser Ruleset
ruleset = do
    s <- (selector) <* spaces
    char '{' <* spaces
    rules <- rule `sepBy` spaces
    spaces *> char '}'
    return $ Ruleset s rules

rule :: Parser Rule
rule = do
    ruleName <- (many1 $ letter <|> char '-') <* spaces
    char ':' <* spaces
    value <- many1 (noneOf ";{}") <* spaces
    optional $ char ';'
    spaces
    return $ Rule ruleName value

(<:>) :: Parser a -> Parser [a] -> Parser [a]
a <:> b = (:) <$> a <*> b

selector :: Parser String
selector = (oneOf ".#" <|> letter) <:> many (alphaNum <|> char '-')
