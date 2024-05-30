import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_ 
     "Haskell Blog Generator" 
     (append_ 
       (h1_ "Welcome to Haskell") 
       (append_ 
         (p_ "This is my blog") 
         (p_ "And this is another paragraph")
        )
      )






