#let bibfile = "quellen.bib"
#let studysubject = "fach"
#let documenttitle = "titel"
#let author = "autor"
#let email = "email"
#let location = "ort"
#let abstract = "beschreibung"
#let today = datetime.today()
#set document(title: documenttitle, author: author)
#set par(justify: true)
#set page(numbering: none, margin: (left: 2in))
#set quote(block: true)

#line(start: (0%, 5%), end: (8.5in, 5%), stroke: (thickness: 2pt))
#align(horizon + left)[
#text(size: 24pt, [#studysubject \ #documenttitle]) \ \
  #author \ \
  #email \ \
  #location, #today.display("[month repr:long] [day], [year]") \ \
  #abstract
]

#set heading(numbering: "1.")
#set page(fill: white, margin: (auto))

#pagebreak(weak: true)
#outline(title: "Inhaltsverzeichnis", indent: auto)
#pagebreak(weak: true)

#set page(
numbering: "1",
header: context {
  if counter(page).get().first() > 1 [
    #documenttitle
    #h(1fr)
    #author
  ]
}, 
footer: context {
  align(center, ("Seite " + str(counter(page).get().first())))
})

#counter(page).update(1)

// Content Starts here
= First title
#lorem(100) @WebsiteReference

== Subtitle

=== Sub subject

==== Sub sub subject

= Simple equation
$ x = (2pi*d) / 10 $

== Footnotes
Check the docs for more details.
#footnote[https://typst.app/docs]

== Quotes
#quote(attribution: [Plato], "... ἔοικα γοῦν τούτου γε σμικρῷ τινι αὐτῷ τούτῳ σοφώτερος εἶναι, ὅτιἃ μὴ οἶδα οὐδὲ οἴομαι εἰδέναι.")

== SVG Drawings with Captions
#lorem(100) @Meier2020

#figure(
  supplement: "Abbildung",
  image("image.svg", width: 20%),
  caption: "imageCaptionHere",
)

= Glossar
Begriff: asasasas
\ Begriff2: asasasasasa

#pagebreak(weak: true)
#bibliography(bibfile, title: "Quellenverzeichnis", full: true)

#outline(target: figure.where(kind: image), title: "Abbildungsverzeichnis", indent: auto)
