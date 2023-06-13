module Parameters (Parameters) where

import qualified Data.Word
import qualified Foreign.Ptr
import qualified Id

data Parameters = Parameters
  { bufPtr :: Foreign.Ptr.Ptr Data.Word.Word8,
    ends :: Foreign.Ptr.Ptr Data.Word.Word32,
    maxId :: Id.Id
  }
