module Main (main) where

import Data.Char

import GHCJS.DOM (currentDocument)
import GHCJS.DOM.Types (HTMLInputElement(..), FromJSString, JSString, fromJSString, toJSString, unsafeCastTo)
import GHCJS.DOM.Document (createElementUnsafe, getBody)
import GHCJS.DOM.HTMLInputElement (getValue, setType, setValue)
import GHCJS.DOM.Node (appendChild)

main :: IO ()
main =
  currentDocument >>=
  \(Just doc)    -> getBody doc >>=
  \(Just body)   -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \loanInput     -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \interestInput -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \yearInput     -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \calcButton    -> setType calcButton (toJSString "button")                                   >>
  appendChild body (Just loanInput)                                                            >>
  appendChild body (Just interestInput)                                                        >>
  appendChild body (Just yearInput)                                                            >>
  appendChild body (Just calcButton)                                                           >>
  getValue yearInput                                                                           >>=
  \(Just year)   -> putStrLn year


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
