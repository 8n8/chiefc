module Names (Names) where

import qualified Data.Word
import qualified Foreign.Ptr
import Prelude (Int, (*))

bufSize :: Int
bufSize =
  6 * maxNames

maxNames :: Int
maxNames =
  500 * 1000

data Names = Names
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    num :: Int
  }
