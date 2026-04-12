#let acceptance-criteria-table = {
  show figure.where(kind: table): set block(breakable: true)

  figure(
    caption: [Zestawienie kryteriów akceptacji wymagań funkcjonalnych],
    kind: table,
    table(
      columns: (40pt, 1fr, 120pt, 80pt),
      align: (center, left, left, center),
      stroke: 0.5pt + rgb(102, 51, 153),
      fill: (col, row) => {
        if row == 0 { rgb(102, 51, 153) }
        else if col == 0 or col == 2 { rgb(240, 235, 248) }
        else { white }
      },
      inset: (x: 8pt, y: 6pt),

      table.cell(text(fill: white, weight: "bold")[*ID*]),
      table.cell(text(fill: white, weight: "bold")[*Nazwa wymagania*]),
      table.cell(text(fill: white, weight: "bold")[*Metoda weryfikacji*]),
      table.cell(text(fill: white, weight: "bold")[*Status*]),

      [WF1],  [Logowanie do systemu],                        [Test manualny / UAT],          [Do weryfikacji],
      [WF2],  [Wylogowanie z systemu],                       [Test manualny],                [Do weryfikacji],
      [WF3],  [Automatyczne wygasanie sesji],                [Test automatyczny],            [Do weryfikacji],
      [WF4],  [Resetowanie hasła],                           [#text(stroke: 0.5pt + red)[TBD]],              [Do weryfikacji],
      [WF6],  [Tryb przerwy technicznej],                    [Test manualny],                [Do weryfikacji],
      [WF7],  [Tworzenie konta użytkownika],                 [Test manualny / UAT],          [Do weryfikacji],
      [WF8],  [Edycja i dezaktywacja konta],                 [Test manualny],                [Do weryfikacji],
      [WF9],  [Role i uprawnienia użytkowników],             [Test manualny / UAT],          [Do weryfikacji],
      [WF10], [Lista użytkowników systemu],                  [Test manualny],                [Do weryfikacji],
      [WF11], [Profil i ustawienia konta],                   [Test manualny / UAT],          [Do weryfikacji],
      [WF12], [Tworzenie nowej sprawy],                      [Test manualny / UAT],          [Do weryfikacji],
      [WF13], [Edycja i aktualizacja sprawy],                [Test manualny],                [Do weryfikacji],
      [WF14], [Przeglądanie listy spraw],                    [Test manualny / UAT],          [Do weryfikacji],
      [WF15], [Zmiana statusu sprawy],                       [Test manualny],                [Do weryfikacji],
      [WF16], [Archiwizacja i zawieszenie sprawy],           [Test manualny],                [Do weryfikacji],
      [WF17], [Przypisywanie użytkowników do sprawy],        [Test manualny],                [Do weryfikacji],
      [WF20], [Tworzenie i edycja profilu klienta],          [Test manualny / UAT],          [Do weryfikacji],
      [WF21], [Przeglądanie listy klientów],                 [Test manualny / UAT],          [Do weryfikacji],
      [WF22], [Powiązanie klienta ze sprawą],                [Test manualny],                [Do weryfikacji],
      [WF24], [Usuwanie profilu klienta],                    [Test manualny],                [Do weryfikacji],
      [WF25], [Generowanie kodu QR dla sprawy],              [Test manualny / automatyczny], [Do weryfikacji],
      [WF26], [Skanowanie kodu QR],                          [Test manualny / UAT],          [Do weryfikacji],
      [WF27], [Deep linking],                                [Test manualny],                [Do weryfikacji],
      [WF28], [Udostępnianie i eksport kodu QR],             [Test manualny / UAT],          [Do weryfikacji],
      [WF30], [Dodawanie dokumentów do sprawy],              [Test manualny / UAT],          [Do weryfikacji],
      [WF31], [Przeglądanie listy dokumentów sprawy],        [Test manualny / UAT],          [Do weryfikacji],
      [WF32], [Podgląd dokumentu],                           [Test manualny / UAT],          [Do weryfikacji],
      [WF33], [Usuwanie dokumentu ze sprawy],                [Test manualny],                [Do weryfikacji],
      [WF35], [Tworzenie i edycja terminu],                  [Test manualny / UAT],          [Do weryfikacji],
      [WF36], [Przeglądanie terminarza],                     [Test manualny / UAT],          [Do weryfikacji],
      [WF37], [Usuwanie terminu],                            [Test manualny],                [Do weryfikacji],
      [WF38], [Powiadomienia o zbliżających się terminach],  [Test automatyczny],            [Do weryfikacji],
      [WF40], [Powiadomienia push dla użytkowników],         [Test automatyczny / UAT],      [Do weryfikacji],
      [WF41], [Powiadomienia dla klientów kancelarii],       [Test automatyczny],            [Do weryfikacji],
      [WF42], [Centrum powiadomień w aplikacji],             [Test manualny / UAT],          [Do weryfikacji],
      [WF46], [Wyszukiwanie globalne],                       [Test manualny / UAT],          [Do weryfikacji],
      [WF48], [Eksport akt sprawy do PDF],                   [Test manualny / UAT],          [Do weryfikacji],
      [WF50], [Usuwanie sprawy],                             [Test manualny],                [Do weryfikacji],
    )
  )
}
