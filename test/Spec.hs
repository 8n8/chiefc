import qualified Compiler
import Data.Map (Map)
import Data.Text (Text)
import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main =
  defaultMain $ testGroup "Unit tests" $ tests

tests :: [TestTree]
tests =
  map oneTest cases

oneTest :: TestCase -> TestTree
oneTest test =
  testCase (description test) $
    do
      let compiled = Compiler.compile (modules test)
      compiled @?= Right (expected test)

data TestCase = TestCase
  { description :: String,
    modules :: Map Text Text,
    expected :: Text
  }

cases :: [TestCase]
cases =
  []
