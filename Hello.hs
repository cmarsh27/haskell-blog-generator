main = 
    putStrLn myhtml

myhtml = 
    makeHtml "Haskell Blog Generator" (h1_ "Welcome to Haskell" <> p_ "This is my blog")

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"
  
title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_  = el "p"

h1_ :: String -> String
h1_ = el "h1"


el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"


makeHtml :: String -> String -> String
makeHtml str1 str2 = 
    html_ (head_ (title_ str1) <> body_ str2)
