#let risk-card(
  id: "R00",
  kontekst: "",
  czynnik: "",
  prawdopodobienstwo-label: "",
  prawdopodobienstwo-value: 0,
  wplyw-label: "",
  wplyw-value: 0,
  skutki: "",
  plan: "",
) = {

  let poziom-value = prawdopodobienstwo-value * wplyw-value
  let poziom-label = if poziom-value <= 4 {
    "Niskie"
  } else if poziom-value <= 9 {
    "Średnie"
  } else if poziom-value <= 16 {
    "Wysokie"
  } else {
    "Krytyczne"
  }

  let card-color = rgb(102, 51, 153)
  let fill-light = rgb(240, 235, 248)
  let section-header-fill = rgb(210, 195, 230)

  let poziom-color = if poziom-value <= 4 {
    rgb("#2e7d32")
  } else if poziom-value <= 9 {
    rgb("#f57f17")
  } else if poziom-value <= 16 {
    rgb("#c62828")
  } else {
    rgb("#4a0000")
  }

  figure(
    block(
      width: 100%,
      stroke: (paint: card-color, thickness: 1pt),
      radius: 2pt,
      clip: true,
      {
        // === HEADER ===
        block(
          width: 100%,
          fill: card-color,
          inset: (x: 10pt, y: 6pt),
          align(center,
            text(
              fill: white,
              weight: "bold",
              size: 10pt,
              tracking: 1pt,
              [KARTA RYZYKA]
            )
          )
        )

        // === SECTION 1: Identyfikacja ===
        table(
          columns: (35%, 65%),
          stroke: (paint: card-color, thickness: 0.5pt),
          fill: (col, row) => if row == 0 { section-header-fill }
                              else if col == 0 { fill-light }
                              else { white },
          inset: (x: 8pt, y: 6pt),

          table.cell(
            colspan: 2,
            text(weight: "bold", size: 8.5pt, fill: card-color,
              [Identyfikacja ryzyka]
            )
          ),

          text(weight: "bold", size: 9pt)[Identyfikator ryzyka:],
          text(size: 9pt, weight: "bold", fill: card-color)[#id],

          text(weight: "bold", size: 9pt)[Kontekst zagrożenia:],
          text(size: 9pt)[#kontekst],

          text(weight: "bold", size: 9pt)[Czynnik zagrożenia:],
          text(size: 9pt)[#czynnik],
        )

        // === SECTION 2: Analiza ===
        table(
          columns: (35%, 65%),
          stroke: (paint: card-color, thickness: 0.5pt),
          fill: (col, row) => if row == 0 { section-header-fill }
                              else if col == 0 { fill-light }
                              else { white },
          inset: (x: 8pt, y: 6pt),

          table.cell(
            colspan: 2,
            text(weight: "bold", size: 8.5pt, fill: card-color,
              [Analiza i zarządzanie ryzykiem]
            )
          ),

          text(weight: "bold", size: 9pt)[Prawdopodobieństwo:],
          text(size: 9pt)[#prawdopodobienstwo-label (#prawdopodobienstwo-value)],

          text(weight: "bold", size: 9pt)[Wpływ:],
          text(size: 9pt)[#wplyw-label (#wplyw-value)],

          text(weight: "bold", size: 9pt)[Poziom ryzyka (P×W):],
          text(size: 9pt, weight: "bold", fill: poziom-color)[#poziom-value — #poziom-label],

          text(weight: "bold", size: 9pt)[Skutki:],
          text(size: 9pt)[#skutki],

          text(weight: "bold", size: 9pt)[Plan zarządzania:],
          text(size: 9pt)[#plan],
        )
      }
    ),
    caption: [Karta ryzyka #id -- #czynnik],
  )
}
