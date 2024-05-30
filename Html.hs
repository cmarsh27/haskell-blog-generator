module Html
  ( Html
  , Title
  , Structure
  , html_
  , p_
  , h1_
  , append_
  , render
  )
  where



newtype Html = Html String

newtype Structure = Structure String

type Title = String


html_ :: Title -> Structure -> Html
html_ title body = 
    Html
     ( el "html"
      ( el "head" (el "title" (escape title))
        <> el "body" (getStructureString body)
      )
    )

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

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

escape :: String -> String
escape =
  let
    escapeChar c =
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
    concat . map escapeChar