module Floats (Floats) where

import qualified Data.Word
import qualified Foreign.Ptr

bufSize :: Int
bufSize =
  3 * maxFloats

maxFloats :: Int
maxFloats =
  100 * 1000

data Floats = Floats
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    num :: Int
  }
