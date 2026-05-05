#let bmc-channels-table-color = rgb(102, 51, 153)

#let bmc-channels-table = {
  show figure.where(kind: table): set block(breakable: true)

  figure(
    caption: [Kanały dystrybucji -- Business Model Canvas],
    kind: table,
    table(
      columns: (120pt, 1fr),
      stroke: 0.5pt + bmc-channels-table-color,
      fill: (col, row) => {
        if row == 0 { bmc-channels-table-color }
        else if col == 0 { rgb(240, 235, 248) }
        else { white }
      },
      inset: (x: 8pt, y: 6pt),
      align: (left, left),

      table.cell(
        text(fill: white, weight: "bold")[*Typ kanału*]
      ),
      table.cell(
        text(fill: white, weight: "bold")[*Rodzaj*]
      ),

      [Własny bezpośredni],
      [Aplikacja mobilna (iOS/Android), wsparcie e-mail, panel klienta (web)],

      [Własny pośredni],
      [Strona internetowa produktu, media społecznościowe],

      [Partnerski],
      [Izby adwokackie i radcowskie, konferencje legal tech, branżowe media prawnicze],
    )
  )
}
