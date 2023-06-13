module Ast (Ast) where

import qualified Arguments
import qualified Floats
import qualified Ints
import qualified Names
import qualified Parameters
import qualified Qualifieds
import qualified Strings
import qualified Types

-- |
-- Hello world program:
--
--     module Main exposing (main)
--
--     import Stdio
--
--     io int main(int _, i8** _) {
--         Stdio.fputs("hello world!\n", Stdio.stdout);
--     }
--
-- And the corresponding output is:
--
--     #include <stdio.h>
--     #include <stdint.h>
--
--     int main(int argc, int8_t** argv) {
--        fputs("hello world!\n", stdout);
--     }
data Ast = Ast
  { strings :: Strings.Strings,
    parameters :: Parameters.Parameters,
    types :: Types.Types,
    names :: Names.Names,
    qualifieds :: Qualifieds.Qualifieds,
    arguments :: Arguments.Arguments
  }
