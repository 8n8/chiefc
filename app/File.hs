module File (File, with, Error (..), Mode (..), unwrap) where

import qualified Control.Exception
import qualified System.IO
import qualified System.IO.Error

newtype File
  = File System.IO.Handle

data Mode
  = Read
  | Write

data Error
  = NotFound
  | NoPermission

unwrap :: File -> System.IO.Handle
unwrap (File handle) =
  handle

toMode :: Mode -> System.IO.IOMode
toMode mode =
  case mode of
    Read ->
      System.IO.ReadMode
    Write ->
      System.IO.WriteMode

with :: FilePath -> Mode -> (File -> IO a) -> IO (Either Error a)
with path mode f =
  do
    result <-
      Control.Exception.try $ System.IO.withFile path (toMode mode) (f . File)
    case result of
      Left err ->
        if System.IO.Error.isPermissionError err
          then return $ Left NoPermission
          else
            if System.IO.Error.isDoesNotExistError err
              then return $ Left NotFound
              else Control.Exception.ioError err
      Right ok ->
        return $ Right ok
