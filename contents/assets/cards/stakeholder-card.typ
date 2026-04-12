#let stakeholder-card-color = rgb(102, 51, 153)

#let stakeholder-card(
  id: "U?",
  name: "Nazwa interesariusza",
  description: [Opis interesariusza.],
  stakeholder-type: "—",
  perspective: "—",
  constraints: [—],
  requirements: "—",
  caption-prefix: "Karta interesariusza",
) = {
  let header-fill  = stakeholder-card-color
  let header-text  = white
  let border-color = stakeholder-card-color
  let label-fill   = rgb(240, 235, 248)

  figure(
    kind: table,
    caption: [#caption-prefix #id — #name],
    supplement: "Tabela",
    block(
      breakable: false,
      stroke: 1pt + border-color,
      radius: 3pt,
      clip: true,
      width: 100%,
      {
        block(
          width: 100%,
          fill: header-fill,
          inset: (x: 8pt, y: 6pt),
          align(center,
            text(weight: "bold", fill: header-text, tracking: 1pt)[
              KARTA INTERESARIUSZA
            ]
          )
        )

        table(
          columns: (120pt, 1fr),
          stroke: 0.5pt + border-color,
          fill: (col, row) => {
            if col == 0 { label-fill } else { white }
          },
          inset: (x: 8pt, y: 6pt),

          table.cell(colspan: 1)[*Identyfikator:*],
          table.cell(colspan: 1)[#id],

          table.cell(colspan: 1)[*Nazwa:*],
          table.cell(colspan: 1)[#name],

          table.cell(colspan: 1)[*Opis:*],
          table.cell(colspan: 1, align: left)[#description],

          table.cell(colspan: 1)[*Typ interesariusza:*],
          table.cell(colspan: 1)[#stakeholder-type],

          table.cell(colspan: 1)[*Punkt widzenia:*],
          table.cell(colspan: 1)[#perspective],

          table.cell(colspan: 1)[*Ograniczenia:*],
          table.cell(colspan: 1, align: left)[#constraints],

          table.cell(colspan: 1)[*Wymagania:*],
          table.cell(colspan: 1)[#requirements],
        )
      }
    )
  )
}
