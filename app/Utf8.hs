module Utf8 (Utf8, parse) where


import qualified Raw


newtype Utf8
    = Utf8 Raw.Raw


parse :: Raw.Raw -> IO (Either String Utf8)
parse raw =
    
