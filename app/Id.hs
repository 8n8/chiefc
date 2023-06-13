module Id (Id, qualified, next, first) where

import qualified Data.Bits
import qualified Data.Word

newtype Id
  = Id Data.Word.Word32

newtype Type
  = Type Data.Word.Word8

qualified :: Type
qualified =
  Type 0

first :: Type -> Id
first (Type type_) =
  Id (encodeId type_ 0)

maxCounter :: Data.Word.Word32
maxCounter =
  1000 * 1000

next :: Id -> Maybe Id
next (Id oldId) =
  let type_ = getType oldId
      counter = getCounter oldId
   in if counter == maxCounter
        then Nothing
        else Just (Id (encodeId type_ (counter + 1)))

getType :: Data.Word.Word32 -> Data.Word.Word8
getType id_ =
  fromIntegral (id_ `Data.Bits.shiftR` 24)

getCounter :: Data.Word.Word32 -> Data.Word.Word32
getCounter id_ =
  id_ Data.Bits..&. 0xffffff

encodeId :: Data.Word.Word8 -> Data.Word.Word32 -> Data.Word.Word32
encodeId type_ counter =
  counter Data.Bits..&. ((fromIntegral type_) `Data.Bits.shiftL` 24)
