module Raw (Raw, fill, with) where

import qualified Data.IORef
import qualified Data.Word
import qualified File
import qualified Foreign.Marshal
import qualified Foreign.Ptr
import qualified System.IO

data Raw
  = Raw (Foreign.Ptr.Ptr Data.Word.Word8) (Data.IORef.IORef Int)

bufferSize :: Int
bufferSize =
  10 * 1000 * 1000

fill :: File.File -> Raw -> IO ()
fill handle (Raw buffer sizeRef) =
  do
    size <- System.IO.hGetBuf (File.unwrap handle) buffer bufferSize
    Data.IORef.writeIORef sizeRef size

with :: (Raw -> IO a) -> IO a
with f =
  do
    buffer <- Foreign.Marshal.mallocBytes bufferSize
    size <- Data.IORef.newIORef 0
    result <- f (Raw buffer size)
    Foreign.Marshal.free buffer
    return result
