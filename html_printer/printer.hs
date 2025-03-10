module HtmlEDSL where


el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

makeHtml:: String -> String
makeHtml = el "html"

makeHead:: String -> String
makeHead = el "head"

makeBody:: String -> String
makeBody = el "body"

makeTitle:: String -> String
makeTitle = el "title"

makeParagraph:: String -> String
makeParagraph = el "p"

makeHeading:: String -> String
makeHeading = el "h1"

makeBold:: String -> String
makeBold = el "b"


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
    concatMap escapeChar