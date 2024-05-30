import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_ 
     "Haskell Blog Generator" 
     (append_ 
       (h1_ "Welcome to Haskell & Blog") 
       (append_ 
         (p_ "This is my blog") 
         (append_ 
         (p_ "And this is another paragraph")
         (ul_ [
          (p_ "List item 1"),
          (p_ "List item 2"),
          (p_ "List item 3")
          ])
         )
        
        )
      )






