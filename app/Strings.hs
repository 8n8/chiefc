module Strings (Strings) where

import qualified Data.Word
import qualified Foreign.Ptr
import Prelude (Int, (*))

bufSize :: Int
bufSize =
  100 * maxStrings

maxStrings :: Int
maxStrings =
  100 * 1000

data Strings = Strings
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    num :: Int
  }
