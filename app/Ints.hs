module Ints (Ints) where

import qualified Data.Word
import qualified Foreign.Ptr
import Prelude (Int, (*))

bufSize :: Int
bufSize =
  2 * maxInts

maxInts :: Int
maxInts =
  100 * 1000

data Ints = Ints
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    num :: Int
  }
