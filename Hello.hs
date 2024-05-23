main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_ "Haskell Blog Generator" (append_ (h1_ "Welcome to Haskell")  (append_ (p_ "This is my blog") (p_ "And this is another paragraph")))

newtype Html = Html String

newtype Structure = Structure String

type Title = String


html_ :: Title -> Structure -> Html
html_ title body = 
    Html (el "html" (getStructureString body))

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"


append_ :: Structure -> Structure -> Structure 
append_ (Structure s) (Structure s2) = Structure (s <> s2)

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str


render :: Html -> String
render html =
  case html of
    Html str -> str



