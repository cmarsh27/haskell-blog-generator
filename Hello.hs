main = 
    putStrLn myhtml

myhtml = 
    makeHtml "My page title" "My page content"

html_ content = 
    "<html>" <> content <> "</html>"
body_ content = 
    "<body>" <> content <> "</body>"
head_ content = 
    "<head>" <> content <> "</head>"
title_ content = 
    "<title>" <> content <> "</title>"

makeHtml str1 str2 = 
    html_ (head_ (title_ str1) <> body_ str2)
