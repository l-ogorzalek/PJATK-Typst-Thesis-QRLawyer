= Planowanie

== Metodologia pracy

Model przyrostowy (ang. _incremental build model_) jest jednym z uznanych modeli cyklu życia oprogramowania, w którym system jest projektowany, implementowany i testowany stopniowo -- w kolejnych przyrostach, z których każdy stanowi samodzielny, działający podzbiór docelowego systemu. W odróżnieniu od modelu kaskadowego, który zakłada sekwencyjne i jednokrotne przejście przez wszystkie fazy wytwarzania, model przyrostowy umożliwia wcześniejsze dostarczenie działającego oprogramowania oraz elastyczne reagowanie na zmieniające się wymagania w trakcie realizacji projektu. Każdy przyrost przechodzi przez pełny cykl: analizę wymagań, projektowanie, implementację oraz testowanie, co pozwala na bieżącą weryfikację poprawności i kompletności dostarczanych funkcjonalności. Podejście to jest szczególnie uzasadnione w projektach, w których pełna specyfikacja wymagań nie jest możliwa do ustalenia z góry, a zakres systemu może ewoluować wraz z postępem prac i pogłębianiem wiedzy dziedzinowej przez zespół. 

Podczas wytwarzania systemu QRLawyer zespół projektowy przyjął przyrostowy model wytwarzania oprogramowania, dostosowując go do charakteru projektu oraz realiów pracy grupy studentów łączących realizację projektu inżynierskiego z innymi zobowiązaniami akademickimi i zawodowymi. Model przyrostowy zakłada podział prac na kolejne przyrosty, z których każdy dostarcza działający, rozszerzony względem poprzedniego podzbiór funkcjonalności systemu. Takie podejście pozwala na elastyczne reagowanie na zmieniające się wymagania oraz stopniowe budowanie i weryfikowanie produktu, bez konieczności sztywnego trzymania się harmonogramu ustalonego na początku projektu.

Prace nad projektem rozpoczęły się w piątym semestrze studiów, w ramach przedmiotu "Budowa i integracja systemów informatycznych". Okres ten można uznać za pierwszy przyrost -- powstały wówczas wstępne wersje dokumentacji projektowej, pierwsze koncepcje interfejsu użytkownika oraz szkielet aplikacji mobilnej. Był to etap eksploracyjny, w którym zespół definiował zakres projektu, identyfikował kluczowe funkcjonalności i wypracowywał wspólne rozumienie dziedziny problemu.

Od szóstego semestru prace nabrały bardziej regularnego charakteru. Zespół odbywał spotkania projektowe -- zarówno stacjonarne, jak i zdalne za pośrednictwem platformy Discord -- średnio co jeden lub dwa tygodnie, dostosowując ich częstotliwość do bieżącego obciążenia akademickiego i zawodowego członków grupy. Spotkania służyły omówieniu postępów, weryfikacji wykonanych zadań oraz planowaniu kolejnych kroków. Równolegle (od siódmego semestru) odbywały się spotkania w ramach przygotowania do obrony pracy dyplomowej, średnio co dwa tygodnie, podczas których zespół prezentował postępy promotorowi. Spotkania projektowe i proseminaryjne były od siebie niezależne i odbywały się w różnych terminach.

Role w zespole ukształtowały się organicznie, wynikając z indywidualnych kompetencji i predyspozycji poszczególnych członków. Każdy z nich posiadał obszar specjalizacji, jednocześnie w razie potrzeby wspierając pozostałych. Takie podejście, zbliżone do modelu zespołu samoorganizującego się, pozwoliło na efektywne wykorzystanie zróżnicowanych umiejętności grupy.

Do zarządzania zadaniami i śledzenia postępów prac zespół wykorzystał system Issues oraz tablice Kanban dostępne w ramach platformy Forgejo, na której hostowane było repozytorium kodu źródłowego projektu. Tablicę Kanban dostosowano do potrzeb zespołu, modyfikując domyślny układ kolumn. Komunikacja bieżąca oraz wymiana materiałów odbywała się za pośrednictwem dedykowanych kanałów na platformie Discord. Kod źródłowy projektu był zarządzany przy użyciu systemu kontroli wersji Git -- początkowo w publicznym repozytorium na platformie GitHub, a następnie przeniesiony na prywatnie hostowaną instancję platformy Forgejo.

== Podsumowanie planowanego zakresu prac

Planowany zakres prac obejmuje zaprojektowanie i implementację systemu QRLawyer składającego się z aplikacji mobilnej przeznaczonej na platformy iOS i Android oraz obsługującego ją serwera backendowego. System adresuje potrzeby kancelarii prawnych w zakresie cyfryzacji obiegu dokumentów, zarządzania sprawami i komunikacji z klientami, a jego zakres funkcjonalny został podzielony na kilka wzajemnie powiązanych obszarów.

Punktem wejścia do systemu jest moduł uwierzytelniania i zarządzania kontem, obejmujący rejestrację, logowanie oraz odzyskiwanie hasła. Po zalogowaniu użytkownik trafia na pulpit główny aplikacji, stanowiący centralny punkt nawigacyjny systemu -- prezentujący skrócony przegląd aktywnych spraw, nadchodzących terminów oraz ostatnich powiadomień. Pulpit umożliwia szybki dostęp do najważniejszych funkcjonalności bez konieczności przechodzenia przez kolejne poziomy nawigacji.

Centralnym elementem systemu jest moduł zarządzania sprawami, umożliwiający tworzenie, edytowanie i usuwanie spraw, przypisywanie ich do konkretnych pracowników kancelarii oraz śledzenie ich statusu w czasie rzeczywistym. Każda sprawa posiada własną historię zmian, co pozwala na pełną audytowalność działań podejmowanych przez użytkowników systemu. Sprawy mogą być filtrowane i wyszukiwane według różnych kryteriów, takich jak status, przypisany pracownik czy data ostatniej modyfikacji. Z modułem spraw ściśle powiązana jest baza dokumentów, umożliwiająca przesyłanie, przechowywanie i przeglądanie plików PDF przypisanych do poszczególnych spraw, co eliminuje konieczność korzystania z zewnętrznych systemów archiwizacji.

Kluczową i wyróżniającą funkcjonalnością aplikacji jest integracja z kodami QR, stanowiąca pomost między fizycznym archiwum dokumentów a ich cyfrową reprezentacją w systemie. W ramach tego modułu przewidziano generowanie unikalnych kodów QR przypisanych do poszczególnych spraw oraz ich skanowanie za pomocą aparatu urządzenia mobilnego, umożliwiające natychmiastowy dostęp do powiązanych danych. Kody QR mogą być drukowane i umieszczane na fizycznych teczkach dokumentów, co eliminuje konieczność ręcznego wyszukiwania spraw w systemie i skraca czas potrzebny na identyfikację akt.

Istotnym obszarem funkcjonalnym jest moduł powiadomień, realizujący dwutorową komunikację: powiadomienia push kierowane do pracowników kancelarii informują o zmianach w przypisanych sprawach i zbliżających się terminach, natomiast automatyczne powiadomienia e-mail wysyłane są do klientów kancelarii po każdej zmianie statusu ich sprawy. System przewiduje krótkie okno czasowe umożliwiające anulowanie wysłania wiadomości e-mail przed jej dostarczeniem do adresata, co stanowi zabezpieczenie przed skutkami omyłkowych zmian statusu.

Zarządzanie terminami realizowane jest przez dedykowany moduł terminarza, umożliwiający tworzenie i edytowanie wpisów kalendarzowych powiązanych z konkretnymi sprawami. Terminarz przewiduje integrację z natywnymi kalendarzami platformy iOS i Android, dzięki czemu terminy procesowe i spotkania z klientami są widoczne w systemowym kalendarzu urządzenia bez konieczności ręcznego przepisywania. Moduł ten uzupełniają przypomnienia push wysyłane z wyprzedzeniem przed zbliżającymi się terminami.

Zakres prac obejmuje również implementację modułu zarządzania użytkownikami i kontroli dostępu, opartego na modelu ról. System przewiduje dwa poziomy uprawnień -- zwykłego użytkownika oraz superużytkownika -- z których każdy dysponuje odmiennym zakresem dostępu do funkcjonalności i danych. Superużytkownik zarządza kontami użytkowników i konfiguracją systemu, a także posiada wgląd w sprawy wszystkich pracowników, natomiast pracownik operuje wyłącznie na sprawach mu przypisanych. Planowane jest również wdrożenie uwierzytelniania dwuskładnikowego jako dodatkowej warstwy zabezpieczeń.

Uzupełnieniem powyższych modułów jest funkcjonalność zarządzania klientami, pozwalająca na prowadzenie bazy danych klientów kancelarii wraz z historią powiązanych z nimi spraw, oraz moduł rejestracji czasu pracy, umożliwiający śledzenie czasu poświęconego na poszczególne sprawy -- funkcjonalność szczególnie istotna dla kancelarii rozliczających się z klientami w modelu godzinowym. System prowadzi również logi aktywności użytkowników, rejestrując kluczowe operacje wykonywane w systemie, co wspiera audytowalność działań i umożliwia identyfikację osoby odpowiedzialnej za konkretną zmianę w razie potrzeby. Całość systemu zostanie zrealizowana z uwzględnieniem wymogów bezpieczeństwa danych osobowych wynikających z przepisów RODO, w tym szyfrowania danych zarówno w tranzycie, jak i w spoczynku.

== Harmonogram pracy

#text(stroke: 0.5pt + red)[TBD]

== Zasoby i ograniczenia projektu

=== Zasoby projektu

#text(stroke: 0.5pt + red)[TBD]

Podczas realizacji projektu zespół wykorzystał następujące zasoby:
1. Zasoby ludzkie // Łukasz
2. Zasoby komputerowe // Stefan i Niko
3. Zasoby programowe i narzędziowe // Stefan i Niko
4. Zasoby infrastrukturalne // Stefan, Niko, Dawid

=== Ograniczenia techniczne i projektowe

Realizacja projektu QRLawyer wymagała uwzględnienia szeregu ograniczeń, które wpłynęły na przebieg prac oraz ostateczny kształt produktu.

- Ograniczenia czasowe -- projekt realizowano w trakcie ostatnich semestrów zajęć akademickich, równolegle z innymi obowiązkami akademickimi i zawodowymi członków zespołu. Ramy czasowe narzucone harmonogramem studiów wymagały priorytetyzacji funkcjonalności i skupienia się na dostarczeniu kompletnego zestawu funkcji oznaczonych jako _Must_ w klasyfikacji MoSCoW #text(stroke: 0.5pt + red)[(dodać skrót do wykazu skrótów)], przy jednoczesnym odsunięciu w czasie funkcjonalności o niższym priorytecie.
- Ograniczenia techniczne -- Tworzenie aplikacji mobilnej przeznaczonej jednocześnie na platformy iOS i Android wiązało się z koniecznością zapewnienia zgodności z wymaganiami i wytycznymi obu platform, które w niektórych obszarach różnią się od siebie w sposób wymagający odrębnej implementacji lub dodatkowej warstwy abstrakcji. Testowanie aplikacji na urządzeniach fizycznych z systemem iOS wymagało posiadania konta deweloperskiego Apple oraz dostępu do urządzeń z tym systemem operacyjnym. Moduł drukowania naklejek QR wymagał zapewnienia kompatybilności z szeroką gamą drukarek termicznych różnych producentów, co stanowiło dodatkowe wyzwanie implementacyjne ze względu na zróżnicowanie protokołów komunikacyjnych stosowanych przez poszczególne urządzenia.
- Ograniczenia organizacyjne -- członkowie zespołu łączyli prace projektowe z obowiązkami akademickimi oraz pracą zawodową, co wymagało elastycznej organizacji zadań i efektywnej komunikacji zdalnej. Zróżnicowana dostępność czasowa poszczególnych członków zespołu w różnych okresach semestru wpływała na nierównomierność tempa prac, co zostało uwzględnione w przyjętym modelu przyrostowym jako naturalny element jego elastyczności.
- Ograniczenia funkcjonalne -- część zaplanowanych funkcjonalności została oznaczona priorytetami _Should_ oraz _Could_ w klasyfikacji MoSCoW i przewidziana do wdrożenia w kolejnych iteracjach produktu, po wydaniu wersji zawierającej kompletny zestaw funkcji _Must_. W obecnym etapie prac skupiono się na funkcjonalnościach stanowiących rdzeń wartości produktu -- zarządzaniu sprawami, integracji z kodami QR, module powiadomień oraz systemie kontroli dostępu opartym na rolach.
- Ograniczenia budżetowe -- projekt realizowano bez zewnętrznego finansowania, opierając się na bezpłatnych i open-sourcowych narzędziach deweloperskich oraz infrastrukturze serwerowej finansowanej przez członków zespołu we własnym zakresie. Ograniczenia budżetowe wpłynęły na wybór stosu technologicznego oraz podejście do infrastruktury, skłaniając zespół ku rozwiązaniom o niskim koszcie wejścia i możliwości stopniowego skalowania.
- Ograniczenia dotyczące danych i ochrony prywatności -- przetwarzanie danych osobowych klientów kancelarii prawnych wymaga pełnej zgodności z przepisami RODO, w tym zapewnienia legalnych podstaw przetwarzania, realizacji praw użytkowników w zakresie wglądu, edycji i usunięcia danych oraz wdrożenia odpowiednich środków technicznych -- szyfrowania danych w spoczynku i w tranzycie, kontroli dostępu opartej na rolach oraz prowadzenia logów aktywności.

== Infrastruktura
=== Organizacja zespołu
=== Technologie i narzędzia
=== Infrastruktura komunikacji
=== Infrastruktura dokumentacji