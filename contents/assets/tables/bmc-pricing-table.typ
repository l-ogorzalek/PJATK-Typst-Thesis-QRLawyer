#let bmc-pricing-table-color = rgb(102, 51, 153)

#let bmc-pricing-table = {
  show figure.where(kind: table): set block(breakable: true)

  figure(
    caption: [Model cenowy -- Business Model Canvas],
    kind: table,
    table(
      columns: (70pt, 120pt, 120pt, 1fr),
      stroke: 0.5pt + bmc-pricing-table-color,
      fill: (col, row) => {
        if row == 0 { bmc-pricing-table-color }
        else if col == 0 { rgb(240, 235, 248) }
        else { white }
      },
      inset: (x: 8pt, y: 6pt),
      align: (left, left, left, left),

      table.cell(text(fill: white, weight: "bold")[*Tier*]),
      table.cell(text(fill: white, weight: "bold")[*Profil organizacji*]),
      table.cell(text(fill: white, weight: "bold")[*Przybliżona cena*]),
      table.cell(text(fill: white, weight: "bold")[*Kluczowe funkcje*]),

      [Solo],
      [Jednoosobowa działalność],
      [29 zł netto/mies.],
      [Pełny dostęp do głównych funkcji, 1 użytkownik],

      [Zespół],
      [Mała kancelaria],
      [140 -- 160 zł netto/mies.],
      [Do 5 kont w organizacji, rozszerzone wsparcie i funkcjonalności],

      [Kancelaria],
      [Średnia kancelaria],
      [od 199 zł netto/mies.],
      [Powyżej 5 kont w organizacji, wsparcie priorytetowe, indywidualne wdrożenie],
    )
  )
}
