#import "@preview/cetz:0.2.2"

#let today_date(location) = {
  if(location == "de") {
    datetime.today().display("[day].[month].[year]")
  } else if(location == "us") {
    datetime.today().display("[month]/[day]/[year]")
  } else {
    "Location not found"
  }
}

#let code(
  code, 
  border: false, 
  line-numbers: false, 
  first-line: 0, 
  lang: "", 
) = {
  let lineNumber = first-line
  
  block(
    stroke: {
      if border{
        1pt + luma(240)
      }
    },
    inset: 2pt,
    table(
      columns: {
        if line-numbers { 
          (auto, 1fr)
        } else {
          1fr
        }
      },
      stroke: none,

      ..for line in code.text.split("\n") {
        if line-numbers {
          (
            text(luma(120))[#str(lineNumber)],
            raw(lang: lang, line) 
          )
          lineNumber = lineNumber + 1
        } else {
          (
            raw(lang: lang, line),
          )
        }
      },
    )
  )
}

#let assignment(
  course: none,
  title: none, 
  author: "",
  date: none,
  doc
) = {

  set page(
    header: context [
      #if here().page() != 1 [
        #set text(10pt)
        #course: #title
        #h(1fr) #author
        #line(length: 100%)
      ]
    ],

    footer: context [
      #set align(center)
      #set text(9pt)
      #counter(page).display(
        "1/1",
        both: true,
      )
    ] 
  )

  align(center, text(13pt)[ 
    #set text(size: 18pt)
    *#course*\
    #set text(size: 16pt)
    *#title*\
    #set text(size: 13pt)
    #author\
    #date
  ])

  linebreak()
  
  set text(size: 11pt)

  show heading: it => {
    set block(below: 12pt)
    it
  } 

  doc
}


