#let bmc-costs-table-color = rgb(102, 51, 153)

#let bmc-costs-table = {
  show figure.where(kind: table): set block(breakable: false)

  figure(
    caption: [Struktura kosztów -- Business Model Canvas],
    kind: table,
    table(
      columns: (140pt, 100pt, 1fr),
      stroke: 0.5pt + bmc-costs-table-color,
      fill: (col, row) => {
        if row == 0 { bmc-costs-table-color }
        else if col == 0 { rgb(240, 235, 248) }
        else { white }
      },
      inset: (x: 8pt, y: 6pt),
      align: (left, left, left),

      table.cell(text(fill: white, weight: "bold")[*Kategoria*]),
      table.cell(text(fill: white, weight: "bold")[*Typ*]),
      table.cell(text(fill: white, weight: "bold")[*Przykłady*]),

      [Zespół i wynagrodzenia],
      [Stały],
      [Programiści, obsługa klienta],

      [Infrastruktura bazowa],
      [Stały],
      [VPS, domeny, certyfikaty SSL],

      [Platformy i licencje],
      [Stały],
      [App Store, Google Play, narzędzia deweloperskie],

      [Usługi zewnętrzne],
      [Stały/zmienny],
      [Operator płatności, usługa e-mail],

      [Infrastruktura chmurowa],
      [Zmienny],
      [Skalowanie zasobów wraz z liczbą użytkowników],

      [Marketing],
      [Stały/zmienny],
      [SEO, kampanie reklamowe, konferencje],

      [Compliance i prawne],
      [Stały],
      [RODO, ochrona IP, obsługa prawna],
    )
  )
}
