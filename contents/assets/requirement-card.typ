#let requirement-card-color = rgb(102, 51, 153)

#let requirement-card(
  id: "W?",
  priority: "M - Must",
  name: "Nazwa wymagania",
  description: [Opis wymagania.],
  stakeholder: "—",
  related: "—",
  caption-prefix: "Karta wymagania",
) = {
  let header-fill   = requirement-card-color
  let header-text   = white
  let border-color  = requirement-card-color
  let label-fill    = rgb(240, 235, 248)

  figure(
    kind: table,
    caption: [#caption-prefix #id — #name],
    supplement: "Tabela",
    block(
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
              KARTA WYMAGANIA
            ]
          )
        )

        table(
          columns: (120pt, 1fr, 80pt, 1fr),
          stroke: 0.5pt + border-color,
          fill: (col, row) => {
            if col == 0 or col == 2 { label-fill } else { white }
          },
          inset: (x: 8pt, y: 6pt),

          table.cell(colspan: 1)[*Identyfikator:*],
          table.cell(colspan: 1)[#id],
          table.cell(colspan: 1)[*Priorytet:*],
          table.cell(colspan: 1)[#priority],

          table.cell(colspan: 1)[*Nazwa:*],
          table.cell(colspan: 3)[#name],

          table.cell(colspan: 1)[*Opis:*],
          table.cell(colspan: 3, align: left)[#description],

          table.cell(colspan: 1)[*Udziałowiec:*],
          table.cell(colspan: 3)[#stakeholder],

          table.cell(colspan: 1)[*Wymagania powiązane:*],
          table.cell(colspan: 3)[#related],
        )
      }
    )
  )
}
