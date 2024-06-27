import Html
import Markup
import System.Directory (doesFileExist)
import System.Environment (getArgs)
import Convert (convert)


main :: IO ()
main = do
  args <- getArgs
  case args of 
    -- No arguments: reading from stdin and writing to stdout
    [] -> do
      content <- getContents
      putStrLn (process "Empty Title" content)

    -- Input and output files as program arguments
    [input, output] -> do
      content <-  readFile input 
      exists <- doesFileExist output 
      let writeResult = writeFile output (process output content)
      if exists 
        then whenIO confirm writeResult
        else writeResult

    -- Any other case
    _ -> 
      putStrLn "Usage: runghc Main.hs [-- <input-file> <output-file>]"




process :: Html.Title -> String -> String 
process title = Html.render . convert title . Markup.parse 
     
confirm :: IO Bool
confirm = do
  putStrLn "Are you sure? (y/n)" 
  answer <- getLine 
  case answer of
    "y" -> pure True
    "n" -> pure False
    _ -> putStrLn "Invalid response. use y or n" *>
      confirm

whenIO :: IO Bool -> IO () -> IO ()
whenIO cond action = do
  result <- cond 
  if result
    then action
    else pure ()










