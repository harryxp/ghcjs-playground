module Main (main) where

import GHCJS.DOM (currentDocument)
import GHCJS.DOM.Types (MouseEvent, IsEventTarget, IsEvent, HTMLInputElement(..), FromJSString, JSString, fromJSString, toJSString, unsafeCastTo, ToJSString, Text, IsDocument)
import GHCJS.DOM.Document (createElementUnsafe, createTextNode, getBody)
import GHCJS.DOM.EventM (EventM, on, mouseClientXY)
import GHCJS.DOM.HTMLInputElement (getValue, setType, setValue)
import GHCJS.DOM.Node (appendChild)
import qualified GHCJS.DOM.Element as E (click)
import Control.Monad.IO.Class (MonadIO(..))

main :: IO ()
main = do
  Just doc      <- currentDocument
  Just body     <- getBody doc
  loanInput     <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  interestInput <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  yearInput     <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  calcButton    <- (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement)
  setType calcButton "button"

  appendChild body (Just loanInput)
  appendChild body (Just interestInput)
  appendChild body (Just yearInput)
  appendChild body (Just calcButton)

  on calcButton E.click $ do
    text <- getValue yearInput >>= \(Just year) -> createTextNode' doc year
    appendChild body text
    return ()

  return ()

createTextNode' :: (MonadIO m, IsDocument self) => self -> JSString -> m (Maybe Text)
createTextNode' = createTextNode

{--
  Just doc <- currentDocument
  Just body <- getBody doc

  loanInput <- createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement
  interestInput <- createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement
  yearInput <- createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement
  calcBtn <- createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement
  setType calcBtn (toJSString "button")

  appendChild body (Just loanInput)
  appendChild body (Just interestInput)
  appendChild body (Just yearInput)
  appendChild body (Just calcBtn)

  setValue yearInput (Just (toJSString "year"))

  Just v <- getValue yearInput
  v :: JSString

  putStrLn (fromJSString v)

  return ()
--}
