module Main (main) where

import Data.Char

import GHCJS.DOM (currentDocument)
import GHCJS.DOM.Types (HTMLInputElement(..), FromJSString, JSString, fromJSString, toJSString, unsafeCastTo)
import GHCJS.DOM.Document (createElementUnsafe, getBody)
import GHCJS.DOM.HTMLInputElement (getValue, setType, setValue)
import GHCJS.DOM.Node (appendChild)

main = do
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
