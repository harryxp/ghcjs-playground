module Main (main) where

import GHCJS.DOM (currentDocument)
import GHCJS.DOM.Types (MouseEvent, IsEventTarget, IsEvent, HTMLInputElement(..), FromJSString, JSString, fromJSString, toJSString, unsafeCastTo)
import GHCJS.DOM.Document (createElementUnsafe, getBody)
import GHCJS.DOM.EventM (EventM, on, mouseClientXY)
import GHCJS.DOM.HTMLInputElement (getValue, setType, setValue)
import GHCJS.DOM.Node (appendChild)
import qualified GHCJS.DOM.Element as E (click)

main :: IO ()
main =
  currentDocument                                                                              >>=
  \(Just doc)    -> getBody doc                                                                >>=
  \(Just body)   -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \loanInput     -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \interestInput -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \yearInput     -> (createElementUnsafe doc (Just "input") >>= unsafeCastTo HTMLInputElement) >>=
  \calcButton    -> setType calcButton (toJSString "button")                                   >>

  appendChild body (Just loanInput)                                                            >>
  appendChild body (Just interestInput)                                                        >>
  appendChild body (Just yearInput)                                                            >>
  appendChild body (Just calcButton)                                                           >>

  on calcButton E.click calcButtonEventHandler                                                 >>=
  id


calcButtonEventHandler :: EventM HTMLInputElement MouseEvent ()
calcButtonEventHandler = undefined


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
