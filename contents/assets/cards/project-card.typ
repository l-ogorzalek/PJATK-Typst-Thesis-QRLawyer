#let project-card-color = rgb(102, 51, 153)

#let project-card(
  title-pl: "Tytuł projektu",
  title-en: "Project title",
  acronym: "??",
  date: "DD.MM.RRRR",
  supervisor: "—",
  consultants: (),
  goals: [—],
  results: [—],
  success-criteria: (),
  constraints: [—],
  team: (),
  completion-date: "DD.MM.RRRR",
  reviewer: "—",
) = {
  let header-fill  = project-card-color
  let header-text  = white
  let border-color = project-card-color
  let label-fill   = rgb(240, 235, 248)

  set par(first-line-indent: 0pt)

  block(
    block(
      breakable: false,
      stroke: 1pt + border-color,
      radius: 3pt,
      clip: true,
      width: 100%,
      {
        // ── Nagłówek ──────────────────────────────────
        block(
          width: 100%,
          fill: header-fill,
          inset: (x: 8pt, y: 6pt),
          align(center,
            text(weight: "bold", fill: header-text, tracking: 1pt)[
              KARTA PROJEKTU
            ]
          )
        )

        // ── Wiersz 1: Temat + Akronim / Data ──────────
        table(
          columns: (1fr, 140pt),
          stroke: 0.5pt + border-color,
          fill: (col, row) => white,
          inset: (x: 8pt, y: 6pt),

          // Lewa: tytuły
          table.cell(align: left)[
            #text(weight: "bold")[Temat projektu:] \
            #title-pl \
            #v(4pt)
            #text(weight: "bold")[Temat projektu po angielsku:] \
            #title-en
          ],

          // Prawa: akronim + data
          table.cell(fill: label-fill, align: left)[
            #text(weight: "bold")[Akronim:] \
            #text(fill: project-card-color, weight: "bold")[#acronym] \
            #v(15pt)
            #text(weight: "bold")[Data ustalenia tematu:] \
            #date
          ],
        )

        // ── Wiersz 2: Promotor + Konsultanci ──────────
        table(
          columns: (1fr, 1fr),
          stroke: 0.5pt + border-color,
          fill: (col, row) => white,
          inset: (x: 8pt, y: 6pt),

          table.cell(align: left)[
            #text(weight: "bold")[Promotor:] \
            #v(4pt)
            #supervisor
          ],

          table.cell(fill: label-fill, align: left)[
            #text(weight: "bold")[Konsultanci:] \
            #v(4pt)
            #if consultants.len() == 0 [—] else {
              for (i, c) in consultants.enumerate() [
                #(i + 1). #c \
              ]
            }
          ],
        )

        // ── Sekcje opisowe ────────────────────────────
        table(
          columns: (1fr,),
          stroke: 0.5pt + border-color,
          fill: (col, row) => white,
          inset: (x: 8pt, y: 6pt),

          table.cell(fill: label-fill)[
            #text(weight: "bold")[Cele projektu:]
          ],
          table.cell[#goals],

          table.cell(fill: label-fill)[
            #text(weight: "bold")[Rezultaty projektu:]
          ],
          table.cell[#results],

          table.cell(fill: label-fill)[
            #text(weight: "bold")[Miary sukcesu:]
          ],
          table.cell[
            #if success-criteria.len() == 0 [—] else {
              for (i, s) in success-criteria.enumerate() [
                #(i + 1). #s \
                #v(2pt)
              ]
            }
          ],

          table.cell(fill: label-fill)[
            #text(weight: "bold")[Ograniczenia:]
          ],
          table.cell[#constraints],
        )

        // ── Tabela zespołu ────────────────────────────
        table(
          columns: (1fr, 80pt, 1fr, 90pt),
          stroke: 0.5pt + border-color,
          fill: (col, row) => {
            if row == 0 { label-fill } else { white }
          },
          inset: (x: 8pt, y: 6pt),

          table.cell[*Wykonawca*],
          table.cell[*Nr albumu*],
          table.cell[*Specjalizacja*],
          table.cell[*Tryb studiów*],

          ..team.map(m => (
            m.at("name"),
            m.at("album"),
            m.at("specialization"),
            m.at("mode"),
          )).flatten().map(cell => table.cell[#cell]),
        )

        // ── Wiersz końcowy: Data + Recenzent ──────────
        table(
          columns: (1fr, 1fr),
          stroke: 0.5pt + border-color,
          fill: (col, row) => white,
          inset: (x: 8pt, y: 6pt),

          table.cell(fill: label-fill)[
            #text(weight: "bold")[Data ukończenia projektu:] \
            #v(4pt)
            #completion-date
          ],

          table.cell[
            #text(weight: "bold")[Recenzent:] \
            #v(4pt)
            #reviewer
          ],
        )
      }
    )
  )
}
