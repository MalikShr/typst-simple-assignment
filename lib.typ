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
      if border{ 1pt + luma(240) }
    },
    inset: 2pt,
    table(
      columns: {
        if line-numbers { (auto, 1fr) } else { 1fr }
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
  body
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

  align(center, [
    #text(18pt, strong(course)) \
    #text(16pt, strong(title)) \
    #text(13pt, author) \
    #text(13pt, date)
  ])

  v(1.6cm)

  show heading: it => {
    v(0.2cm)
    it
    v(0.2cm)
  } 

  body
}


