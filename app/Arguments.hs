module Arguments (Arguments) where

import qualified Data.Word
import qualified Foreign.Ptr
import qualified Id

data Arguments = Arguments
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    maxId :: Maybe Id.Id
  }
