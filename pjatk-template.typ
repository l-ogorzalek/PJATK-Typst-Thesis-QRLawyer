#import "@preview/icu-datetime:0.2.1" as icu

#let commonPhrases = (
  "keywords": "Słowa kluczowe",
)

#let placeholder-abstract = [
  The abstract should be between 400 and 1500 characters, including spaces.
  *Thesis written in English must also include abstract and keywords translation to Polish*.
  Abstract should usually be written *towards the end* of your thesis work, since that is the time when you best know what (and how) exactly has been accomplished.
  *Pay extra attention and spend some extra time when developing an abstract.*
  This is due to the fact that most people will be glancing over your abstract in order to determine whether it is worth it for them to delve deeper into your work.
  This is the place where you need to attractively explain what can be found in this thesis.
  Do not introduce additional paragraphs in the abstract.
  The rest of this document describes general rules for writing theses documentations in PJAIT.
]

#let placeholder-keywords = (
  "Keywords", "can", "be", "both", "single- or multiple-word phrases", "At", "least", "3", "keywords", "are", "necessary", "Threat", "them", "as", "tags", "Your", "thesis", "must", "be", "searchable", "using", "them",
)

#let titlepage(
  margin,
  faculty,
  department,
  specialization,
  authors,
  title,
  supervisor,
  reviewer,
) = {
   set page(margin: margin)
   
   image("PJATK_pl_poziom_1.pdf")

   align(center)[
     #v(2cm)

     #strong(faculty)

     #v(1cm)

     #strong(department)\
     #specialization

     #v(1cm)

     #eval(mode: "markup", authors.map(s => s + "\\").join("\n"))

     #v(1cm)

     #{
       set par(justify: false)
       strong(text(size: 2em, hyphenate: false, title))
     }

     #v(1fr)

     #align(right)[
       #set par(leading: 0.5em)
       #block(width: 6cm)[
         #align(left)[
           Praca inżynierska napisana pod kierunkiem:
           #v(1em)
           #strong(supervisor)\
           #reviewer
         ]
       ]
     ]

     #v(1fr)

     Gdańsk,
     #icu.fmt(datetime.today(), locale: text.lang, length: "long")
   ]
}

#let abstractAndKeywords(abstract, keywords) = {
    align(center, strong(text(size: 1.5em, [Streszczenie])))
    abstract

    v(1em)
    
    align(center, strong(text(size: 1.5em, [Słowa kluczowe])))
    keywords.join([ #sym.dot.op ])
}

#let apply-pjatk-template(
    body,
    language: "pl",
    for-printing: false,
    faculty: "Faculty of Computer Science",
    department: "Name of your Specialization's Department",
    specialization: "Name of your Specialization",
    authors: ("Your Name --- s#####",),
    title: "Your Carefully Selected and Expressive Thesis Title",
    supervisor: "Supervisor's Name",
    reviewer: "Reviewer's Name",
    abstract: placeholder-abstract,
    keywords: placeholder-keywords,
) = {
    set document(title: title)

    let chosenMargins = if for-printing {
      (top: 1in, bottom: 1.25in, inside: 2.25in, outside: 1.25in)
    } else {
      (top: 1in, bottom: 1.25in, left: 1.75in, right: 1.75in)
    }

    set page(
      paper: "a4",
      margin: chosenMargins,
      numbering: none
    )

    set text(
      size: 10pt,
      font: "EB Garamond",
      lang: language,
    )

    set par(justify: true)

    set heading(numbering: "1.1")

    show ref: it => {
      if it.element != none and it.element.func() == heading {
        return link(
          it.element.location(),
          context {
            show text: it => strong(it)
            numbering(
              it.element.numbering,
              ..counter(heading).at(it.element.location()),
            )
            [ ]
            it.element.body
          },
        )
      }
      it
    }

    show raw.where(block: false): it => {
      highlight(
        radius: 2pt,
        fill: rgb(210, 235, 235, 80),
        extent: 0.5pt,
        top-edge: 1em,
        bottom-edge: -0.25em
      )[#it]
    }

    show raw.where(block: true): set text(size: 0.8em)

    set enum(indent: 1em, numbering: "1Ii.")
    set list(indent: 1em, marker: ([•], [◦]))
    set quote(block: true)

    show heading: set text(hyphenate: false)
    show heading.where(level: 1): it => { pagebreak(weak: true, to: "odd"); it }

    show figure.where(kind: raw): set figure.caption(position: top)
    show figure.where(kind: raw): set block(breakable: true)
    show figure.where(kind: table): set figure.caption(position: top)
    show figure.where(kind: table): set block(breakable: true)
    show figure.caption: set block(sticky: true)

    set math.equation(numbering: "(1)")

    context {
      titlepage(
        chosenMargins,
        faculty,
        department,
        specialization,
        authors,
        title,
        supervisor,
        reviewer,
      )
    }

    set page(numbering: "1")

    context {
      pagebreak()
      abstractAndKeywords(abstract, keywords)
    }

    align(
      center,
      context {
        show outline.entry.where(level: 1): it => link(
          it.element.location(),
          it.indented(
            strong(it.prefix()),
            [#smallcaps(strong(it.body())) #show text: it => strong(it); #box(width: 1fr, repeat(it.fill, gap: 0.15em)) #it.page()]
          ),
        )

        show outline.entry.where(level: 3): it => emph(it)

        outline(title: "Spis treści", target: heading)
      }
    )

    body

    bibliography("references.bib")

    context {
      show outline: set heading(outlined: true)
      outline(title: "Spis listingów", target: figure.where(kind: raw))
      outline(title: "Spis tysunków", target: figure.where(kind: image))
      outline(title: "Spis tabel", target: figure.where(kind: table))
      // TODO: Spis załączników (jeśli jeszcze go nie ma)
    }
}

