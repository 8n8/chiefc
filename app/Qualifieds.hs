module Qualifieds (Qualifieds) where

import qualified Data.Word
import qualified Foreign.Ptr
import qualified Id

nextId :: Qualifieds -> Maybe Id.Id
nextId qualifieds =
  case maxId qualifieds of
    Nothing ->
      Just (Id.first Id.qualified)
    Just oldId ->
      Id.next oldId

data Qualifieds = Qualifieds
  { id :: Foreign.Ptr.Ptr Data.Word.Word32,
    member :: Foreign.Ptr.Ptr Data.Word.Word32,
    maxId :: Maybe Id.Id
  }
