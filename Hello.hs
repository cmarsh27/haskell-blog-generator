import Html

main :: IO ()
main = putStrLn (render myhtml)

myhtml :: Html
myhtml = 
    html_ 
     "Haskell Blog Generator" 
      (
       (h1_ "Welcome to Haskell & Blog") 
       <>
        (
         (p_ "This is my NEW blog") 
         <>
         (
         (p_ "And this is another paragraph")
         <>
         (ul_ [
          (p_ "List item 1"),
          (p_ "List item 2"),
          (p_ "List item 3")
          ])
         )
        )
      )








