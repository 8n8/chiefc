module Main (main) where

import qualified HelloWorld
import qualified Test.Tasty
import qualified Test.Tasty.HUnit

main :: IO ()
main =
  Test.Tasty.defaultMain tests

tests :: Test.Tasty.TestTree
tests =
  Test.Tasty.testGroup
    "Tests"
    [ Test.Tasty.HUnit.testCase "hello world" $
        HelloWorld.hello "world" Test.Tasty.HUnit.@?= "hello world"
    ]
