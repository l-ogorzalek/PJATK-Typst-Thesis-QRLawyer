#let sodis-border      = rgb(102, 51, 153)
#let sodis-label-fill  = rgb(240, 235, 248)
#let sodis-header-fill = rgb(102, 51, 153)

#let _col-prywatnosc   = "Prywatność i poufność"
#let _col-bezp         = "Bezpieczeństwo"
#let _col-jakosc       = "Jakość i precyzja"
#let _col-wlasnosc     = "Własność intelektualna"
#let _col-rownosc      = "Równość społeczna"

// Kolor tła i tekstu dla symbolu
#let _sym-fill(sym) = {
  if sym == "+"      { rgb(235, 248, 235) }
  else if sym == "-" { rgb(248, 235, 235) }
  else if sym == "?" { rgb(250, 243, 225) }
  else { white }
}
#let _sym-color(sym) = {
  if sym == "+"      { rgb(34, 139, 34)  }
  else if sym == "-" { rgb(180, 50, 50)  }
  else if sym == "?" { rgb(180, 120, 0)  }
  else { black }
}
#let _sym-label(sym) = {
  if sym == "+"      { "[+]" }
  else if sym == "-" { "[-]" }
  else if sym == "?" { "[?]" }
  else { "[ ]" }
}

// Komórka symbolu do macierzy przeglądowej
#let _mc(sym) = table.cell(
  fill:  _sym-fill(sym),
  inset: (x: 4pt, y: 6pt),
  align: center + horizon,
)[
  #set par(justify: false)
  #text(weight: "bold", fill: _sym-color(sym))[#_sym-label(sym)]
]

// Wiersz bloku opisowego: symbol + kategoria | opis
#let _bc(sym, category, description) = (
  table.cell(
    fill:  _sym-fill(sym),
    inset: (x: 8pt, y: 5pt),
    align: left + top,
  )[
    #set par(justify: false)
    #text(weight: "bold", fill: _sym-color(sym))[#_sym-label(sym)]
    #h(4pt)
    #text(style: "italic")[#category]
  ],
  table.cell(
    fill: white,
    inset: (x: 8pt, y: 5pt),
    align: left + top,
  )[
    #set par(justify: false)
    #description
  ],
)

// Nagłówek bloku opisowego
#let _bheader(title) = table.cell(
  colspan: 2,
  fill: sodis-header-fill,
  inset: (x: 8pt, y: 5pt),
  align: left,
)[
  #set par(justify: false)
  #text(weight: "bold", fill: white)[#title]
]

// Dane — (nazwa, pryw, bezp, jakosc, wlasn, rownosc)
#let _components = (
  (
    name: "Moduł logowania i uwierzytelniania",
    syms: ("+", "+", "+", "?", "?"),
    descs: (
      "Dostęp wyłącznie dla uprawnionych użytkowników",
      "Planowane 2FA jako dodatkowa warstwa ochrony",
      "Precyzyjne przypisanie działań do użytkownika",
      "Brak ochrony przed nieautoryzowanym dostępem do konta współdzielonego",
      "Bariera dla użytkowników o niskich kompetencjach cyfrowych",
    ),
  ),
  (
    name: "Zarządzanie sprawami i klientami",
    syms: ("-", "+", "+", "?", "+"),
    descs: (
      "Przetwarzanie wrażliwych danych prawnych i osobowych",
      "Dane zaszyfrowane w spoczynku i w tranzycie",
      "Centralizacja informacji redukuje ryzyko błędów",
      "Własność danych po stronie kancelarii (wymaga uregulowań umownych)",
      "Dostęp do narzędzi zarządzania dla małych kancelarii",
    ),
  ),
  (
    name: "Generowanie i skanowanie kodów QR",
    syms: ("+", "+", "+", "+", "+"),
    descs: (
      "Kod QR zeskanowany przez osobę nieuprawnioną nie ujawni żadnych informacji poufnych",
      "Kod prowadzi wyłącznie do danych w zabezpieczonym systemie",
      "Jednoznaczne powiązanie dokumentu fizycznego z cyfrowym",
      "Innowacyjne rozwiązanie własne zespołu",
      "Eliminacja bariery technicznej wyszukiwania akt",
    ),
  ),
  (
    name: "Moduł dokumentów (upload PDF)",
    syms: ("-", "+", "+", "-", "?"),
    descs: (
      "Przechowywanie dokumentów objętych tajemnicą zawodową",
      "Szyfrowanie plików po stronie serwera",
      "Zachowanie integralności dokumentów",
      "Ryzyko naruszenia praw autorskich do przesyłanych dokumentów przez użytkownika, w przypadku niewłaściwego posługiwania się modułem",
      "Ograniczenia rozmiaru plików mogą wykluczać część użytkowników",
    ),
  ),
  (
    name: "Automatyczne powiadomienia e-mail",
    syms: ("-", "?", "+", "+", "+"),
    descs: (
      "Wysyłka danych o sprawie do zewnętrznego odbiorcy",
      "Ryzyko wysłania powiadomienia na błędny adres",
      "Automatyzacja redukuje błędy ludzkie w komunikacji",
      "Treść powiadomień generowana przez system",
      "Poprawa komunikacji z klientami kancelarii",
    ),
  ),
  (
    name: "Terminarz i powiadomienia push",
    syms: ("+", "+", "+", "+", "+"),
    descs: (
      "Dane kalendarza przechowywane lokalnie na urządzeniu",
      "Brak przesyłania wrażliwych danych do zewnętrznych usług",
      "Redukcja ryzyka uchybienia terminom procesowym",
      "Integracja z systemowym kalendarzem urządzenia",
      "Wyrównanie szans małych kancelarii w zarządzaniu terminami",
    ),
  ),
  (
    name: "Rejestracja czasu pracy",
    syms: ("?", "+", "+", "+", "+"),
    descs: (
      "Dane o czasie pracy mogą ujawniać informacje o sprawach",
      "Dostęp wyłącznie dla uprawnionego użytkownika",
      "Precyzyjna dokumentacja czasu pracy",
      "Dane należą wyłącznie do użytkownika",
      "Ułatwienie rozliczeń dla jednoosobowych kancelarii",
    ),
  ),
  (
    name: "Panel administracyjny organizacji",
    syms: ("-", "+", "+", "?", "?"),
    descs: (
      "Administrator ma dostęp do danych wszystkich użytkowników w organizacji",
      "Hierarchiczny system ról i uprawnień",
      "Centralne zarządzanie dostępem redukuje ryzyko błędów",
      "Kwestia własności danych przy zmianie administratora",
      "Złożoność konfiguracji może stanowić barierę dla mniej zaawansowanych użytkowników",
    ),
  ),
  (
    name: "Drukowanie naklejek QR",
    syms: ("+", "+", "+", "?", "+"),
    descs: (
      "Brak przesyłania danych do zewnętrznego oprogramowania producenta drukarki",
      "Bezpośrednia komunikacja aplikacja–drukarka bez pośredników",
      "Kompatybilność z szeroką gamą urządzeń",
      "Potencjalne konflikty z oprogramowaniem producenta drukarki",
      "Brak wymogu zakupu konkretnego modelu drukarki",
    ),
  ),
  (
    name: "Strona internetowa i panel klienta (web)",
    syms: ("?", "?", "+", "+", "+"),
    descs: (
      "Dodatkowy punkt dostępu do danych wymaga osobnej analizy bezpieczeństwa",
      "Bezpieczeństwo panelu webowego wymaga odrębnego audytu",
      "Rozszerzenie dostępności systemu poza platformę mobilną",
      "Własna infrastruktura bez uzależnienia od platform trzecich",
      "Dostępność dla użytkowników preferujących środowisko desktopowe",
    ),
  ),
)

#let _categories = (
  _col-prywatnosc,
  _col-bezp,
  _col-jakosc,
  _col-wlasnosc,
  _col-rownosc,
)

// ══════════════════════════════════════════════
// TABELA 1 — Macierz przeglądowa
// ══════════════════════════════════════════════
#let sodis-matrix = {
  set par(first-line-indent: 0pt, justify: false)
  show table.cell: set par(justify: false)
  show figure.where(kind: table): set block(breakable: true)

  figure(
    kind: table,
    caption: [Macierz przeglądowa SoDIS -- QRLawyer],
    supplement: "Tabela",

    table(
      columns: (1fr, 60pt, 60pt, 60pt, 60pt, 60pt),
      stroke: 0.5pt + sodis-border,
      inset: 0pt,
      fill: white,

      // Nagłówek główny
      table.cell(
        colspan: 6,
        fill: sodis-header-fill,
        inset: (x: 8pt, y: 6pt),
        align: center,
      )[
        #text(weight: "bold", fill: white, tracking: 1pt)[MACIERZ PRZEGLĄDOWA SODIS]
      ],

      // Legenda
      table.cell(
        colspan: 6,
        fill: sodis-label-fill,
        inset: (x: 10pt, y: 5pt),
        align: center,
      )[
        #set text(size: 0.85em)
        #text(weight: "bold", fill: rgb(34, 139, 34))[[+]] wpływ pozytywny
        #h(16pt)
        #text(weight: "bold", fill: rgb(180, 50, 50))[[-]] ryzyko lub wpływ negatywny
        #h(16pt)
        #text(weight: "bold", fill: rgb(180, 120, 0))[[?]] wpływ niepewny
      ],

      // Nagłówki kolumn
      table.cell(fill: sodis-label-fill, inset: (x: 6pt, y: 6pt), align: left + horizon)[
        #text(weight: "bold")[Komponent / Funkcja]
      ],
      table.cell(fill: sodis-label-fill, inset: (x: 4pt, y: 6pt), align: center + horizon)[
        #set text(size: 0.8em)
        #text(weight: "bold")[Prywatność]
      ],
      table.cell(fill: sodis-label-fill, inset: (x: 4pt, y: 6pt), align: center + horizon)[
        #set text(size: 0.8em)
        #text(weight: "bold")[Bezpieczeń­stwo]
      ],
      table.cell(fill: sodis-label-fill, inset: (x: 4pt, y: 6pt), align: center + horizon)[
        #set text(size: 0.8em)
        #text(weight: "bold")[Jakość]
      ],
      table.cell(fill: sodis-label-fill, inset: (x: 4pt, y: 6pt), align: center + horizon)[
        #set text(size: 0.8em)
        #text(weight: "bold")[Własność intel.]
      ],
      table.cell(fill: sodis-label-fill, inset: (x: 4pt, y: 6pt), align: center + horizon)[
        #set text(size: 0.8em)
        #text(weight: "bold")[Równość]
      ],

      // Wiersze danych
      .._components.map(c => (
        table.cell(
          fill: sodis-label-fill,
          inset: (x: 6pt, y: 5pt),
          align: left + horizon,
        )[
          #set par(justify: false)
          #text(weight: "bold", size: 0.9em)[#c.name]
        ],
        ..(c.syms.map(s => _mc(s))),
      )).flatten(),
    )
  )
}

// ══════════════════════════════════════════════
// TABELA 2 — Bloki opisowe per komponent
// ══════════════════════════════════════════════

#let sodis-details = {
  set par(first-line-indent: 0pt, justify: false)
  show table.cell: set par(justify: false)
  show figure.where(kind: table): set block(breakable: true)

  figure(
    kind: table,
    caption: [Szczegółowy opis wpływów SoDIS -- QRLawyer],
    supplement: "Tabela",

    table(
      columns: (140pt, 1fr),
      stroke: 0.5pt + sodis-border,
      inset: 0pt,
      fill: white,

      // Nagłówek główny
      table.cell(
        colspan: 2,
        fill: sodis-header-fill,
        inset: (x: 8pt, y: 6pt),
        align: center,
      )[
        #text(weight: "bold", fill: white, tracking: 1pt)[SZCZEGÓŁOWY OPIS WPŁYWÓW SODIS]
      ],

      // Nagłówki kolumn
      table.cell(
        fill: sodis-label-fill,
        inset: (x: 8pt, y: 6pt),
        align: center + horizon,
      )[
        #text(weight: "bold")[Kategoria]
      ],
      table.cell(
        fill: sodis-label-fill,
        inset: (x: 8pt, y: 6pt),
        align: center + horizon,
      )[
        #text(weight: "bold")[Opis ]
      ],

      // Bloki per komponent
      .._components.map(c => (
        _bheader(c.name),
        ..c.syms.enumerate().map(pair => {
          let (i, s) = pair
          _bc(s, _categories.at(i), c.descs.at(i))
        }).flatten(),
      )).flatten(),
    )
  )
}
