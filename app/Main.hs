module Main (main) where

import Control.Monad.IO.Class (MonadIO(..))
import GHCJS.DOM (currentDocument)
import GHCJS.DOM.Document (createElementUnsafe, createTextNodeUnsafe, getBody)
import GHCJS.DOM.EventM (on)
import GHCJS.DOM.HTMLInputElement (getValueUnsafe, setType)
import GHCJS.DOM.Node (appendChild)
import GHCJS.DOM.Types (HTMLInputElement(..), IsDocument, Text, unsafeCastTo)

import qualified GHCJS.DOM.Element as E (click)

main :: IO ()
main = do
  Just doc  <- currentDocument
  Just body <- getBody doc
  input     <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  button    <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  setType button "button"

  appendChild body (Just input)
  appendChild body (Just button)

  on button E.click $ do
    text     <- getValueUnsafe input
    textNode <- createTextNodeUnsafe' doc text
    appendChild body (Just textNode)
    return ()

  return ()

createTextNodeUnsafe' :: (MonadIO m, IsDocument self) => self -> String -> m Text
createTextNodeUnsafe' = createTextNodeUnsafe

