#let swot-color-s = rgb(34, 139, 34)
#let swot-color-w = rgb(180, 50, 50)
#let swot-color-o = rgb(30, 100, 180)
#let swot-color-t = rgb(180, 120, 0)

#let swot-fill-s = rgb(235, 248, 235)
#let swot-fill-w = rgb(248, 235, 235)
#let swot-fill-o = rgb(235, 240, 250)
#let swot-fill-t = rgb(250, 243, 225)

#let swot-label-fill = rgb(240, 235, 248)
#let swot-border     = rgb(102, 51, 153)

#let _swot-header(color: black, short: "", long: "", translation: "") = block(
  width: 100%,
  fill: color,
  inset: (x: 8pt, y: 5pt),
  text(weight: "bold", fill: white)[
    #short -- #long #text(style: "italic")[(#translation)]
  ]
)

#let _swot-items(items) = block(inset: (x: 10pt, y: 6pt))[
  #for item in items [• #item \ ]
]

#let swot-analysis-table = {
  set par(first-line-indent: 0pt)

  figure(
    kind: table,
    caption: [Analiza SWOT QRLawyer],
    supplement: "Tabela",
    block(
      breakable: false,
      stroke: 1pt + swot-border,
      radius: 3pt,
      clip: true,
      width: 100%,
      {
        // ── Nagłówek główny ───────────────────────────
        block(
          width: 100%,
          fill: swot-border,
          inset: (x: 8pt, y: 6pt),
          align(center,
            text(weight: "bold", fill: white, tracking: 1pt)[ANALIZA SWOT]
          )
        )

        table(
          columns: (85pt, 1fr, 1fr),
          stroke: 0.5pt + swot-border,
          inset: 0pt,
          fill: white,

          // ── Wiersz nagłówkowy ─────────────────────
          table.cell(fill: swot-label-fill, inset: (x: 8pt, y: 6pt), align: center + horizon)[],
          table.cell(fill: swot-label-fill, inset: (x: 8pt, y: 6pt), align: center)[
            #text(weight: "bold")[Pozytywne]
          ],
          table.cell(fill: swot-label-fill, inset: (x: 8pt, y: 6pt), align: center)[
            #text(weight: "bold")[Negatywne]
          ],

          // ── Wiersz: Wewnętrzne ────────────────────
          table.cell(fill: swot-label-fill, inset: (x: 8pt, y: 6pt), align: center + horizon)[
            #text(weight: "bold")[Wewnętrzne]
          ],

          table.cell(fill: swot-fill-s, inset: 0pt, align: left)[
            #_swot-header(color: swot-color-s, short: "S", long: "Strengths", translation: "Silne strony")
            #_swot-items((
              "Innowacyjne połączenie fizycznego archiwum z cyfrowym systemem przez kody QR",
              "Ukierunkowanie na aplikację mobilną",
              "Niski próg wejścia",
              "Kompleksowość funkcjonalna",
              "Uczciwy i przejrzysty model cenowy",
              "Silna ochrona danych"
            ))
          ],

          table.cell(fill: swot-fill-w, inset: 0pt, align: left)[
            #_swot-header(color: swot-color-w, short: "W", long: "Weaknesses", translation: "Słabe strony")
            #_swot-items((
              "Brak doświadczenia biznesowego i komercyjnego w zespole",
              "Niepewność co do składu i ciągłości zespołu przy komercjalizacji",
              "Ograniczone zasoby finansowe na wejście na rynek",
              "brak bazy użytkowników"
            ))
          ],

          // ── Wiersz: Zewnętrzne ────────────────────
          table.cell(fill: swot-label-fill, inset: (x: 8pt, y: 6pt), align: center + horizon)[
            #text(weight: "bold")[Zewnętrzne]
          ],

          table.cell(fill: swot-fill-o, inset: 0pt, align: left)[
            #_swot-header(color: swot-color-o, short: "O", long: "Opportunities", translation: "Szanse")
            #_swot-items((
              "Rosnąca presja cyfryzacyjna na kancelarie",
              "Niedojrzały rynek rozwiązań technologicznych w branży prawniczej w Polsce",
              "Rosnące oczekiwania klientów kancelarii co do szybkiej i cyfrowej komunikacji",
              "Możliwość ekspansji na inne branże z formalnym obiegiem dokumentów",
              "Potencjał pozyskania inwestora lub grantu"
            ))
          ],

          table.cell(fill: swot-fill-t, inset: 0pt, align: left)[
            #_swot-header(color: swot-color-t, short: "T", long: "Threats", translation: "Zagrożenia")
            #_swot-items((
              "Wejście większych graczy z mobilnymi wersjami istniejących produktów",
              "Konserwatyzm środowiska prawniczego wobec nowych technologii",
              "Ryzyko zmian w środowisku regulacyjnym",
              "Trudność w budowaniu zaufania jako nowy, nieznany podmiot na rynku",
              "Uzależnienie od platform dystrybucji i ich polityk"
            ))
          ],
        )
      }
    )
  )
}
