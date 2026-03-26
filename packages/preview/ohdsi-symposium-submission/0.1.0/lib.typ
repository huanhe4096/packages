#let references-section(body) = [
  #align(center)[
    #block(above: 12pt, below: 6pt)[
      #text(weight: "bold", size: 11pt)[References]
    ]
  ]

  #body
]

#let submission(
  title: "",
  authors: (),
  affiliations: (),
  keywords: (),
  abstract: [],
  body,
) = {
  let show-affiliation-markers = affiliations.len() > 1

  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
  )

  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  set par(
    justify: true,
    leading: 3pt,
    spacing: 6pt,
  )

  show heading.where(level: 1): it => {
    set align(left)
    set text(weight: "bold", size: 11pt)
    block(above: 12pt, below: 6pt)[#it.body]
  }

  show heading.where(level: 2): it => {
    set align(left)
    set text(weight: "semibold", size: 11pt)
    block(above: 12pt, below: 6pt)[#it.body]
  }

  [
    #align(center)[
      #text(size: 16pt, weight: "bold")[#title]

      #v(0.5em)

      #for (index, author) in authors.enumerate() [
        #author.name#if show-affiliation-markers and "affiliations" in author [#super[#author.affiliations.join(",")]]
        #if index < authors.len() - 1 [, ]
      ]

      #if affiliations.len() > 0 [
        #v(0.5em)
        #set text(size: 10pt)
        #for affiliation in affiliations [
          #if show-affiliation-markers [#super[#affiliation.id] ]
          #affiliation.name
          #if "email" in affiliation [ (#affiliation.email) ]
          #linebreak()
        ]
      ]
    ]

    #v(1em)

    #body
  ]
}
