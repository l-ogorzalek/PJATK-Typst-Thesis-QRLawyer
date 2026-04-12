#import "../assets/cards/requirement-card.typ": requirement-card
#import "../assets/cards/requirement-card-functional.typ": requirement-card-functional
#import "../assets/cards/stakeholder-card.typ": stakeholder-card
#import "../assets/tables/acceptance-criteria-table.typ": acceptance-criteria-table

= Specyfikacja wymagań systemowych
== Sposoby ustalania wymagań
=== Konsultacje
Z perspektywy zespołu, głównym celem konsultacji było ustalenie wymagań systemowych w taki sposób, aby funkcjonalności aplikacji odzwierciedlały potrzeby rynkowe. W związku z powyższym, przeprowadzono kilka głównych serii konsultacyjnych z potencjalnymi użytkownikami końcowymi aplikacji oraz na bieżąco kontaktowano się z adwokatami i radcami prawnymi, weryfikując nowe pomysły i zasięgając ich opinii w kwestiach prawnych. Do stałych konsultantów projektu należeli:
- Adwokat Jakub Nowosielski -- prowadzący kancelarię adwokacką w Gdyni, adwokat Jakub Nowosielski nieodpłatnie udzielał odpowiedzi na zapytania zespołu związane z jego administracyjną częścią pracy w kancelarii. Pomagał także podczas oceny użyteczności oprogramowania w kontekście codziennych obowiązków i opiniował zastosowane rozwiązania UI/UX.
- Radca prawny Agnieszka Szczepańska -- świadcząca usługi prawne na terenie Trójmiasta, radca prawny Agnieszka Szczepańska pozostawała w stałym kontakcie z zespołem podczas planowania, jak i procesu tworzenia oraz testowania oprogramowania. W rezultacie współpracy, zespół szybko skonsolidował wymagania systemowe i zdiagnozował błędy podczas symulacji testów akceptacyjnych.
Na podstawie informacji zwrotnych przygotowano wstępną listę wymagań ogólnych, funkcjonalnych i systemowych oraz przygotowano ankietę wraz z jej analizą.
=== Ankieta
Badanie ankietowe stanowiło jedno z podstawowych narzędzi zastosowanych w procesie elicytacji wymagań. Głównym celem przeprowadzenia ankiety była jednak nie tylko strukturyzacja wymagań systemowych, ale również pozyskanie danych na temat oczekiwań i preferencji potencjalnych użytkowników.

Grupę docelową stanowili adwokaci i radcowie prawni prowadzący kancelarie w ramach jednoosobowej działalności gospodarczej lub w ramach spółki. Ankietę, składającą się z 10 pytań, przeprowadzono poprzez Google Forms. Pytania dotyczyły między innymi wielkości kancelarii, wygody korzystania z obecnie używanych systemów informatycznych, funkcjonalności w obecnie stosowanych rozwiązaniach technologicznych czy też metod uwierzytelniania.
== Przypadki użycia
=== Identyfikacja interesariuszy

#stakeholder-card(
  id: "U1",
  name: "Zespół projektowy",
  description: [
    Pięcioosobowy zespół studentów PJATK odpowiedzialny za zaprojektowanie, implementację i dokumentację aplikacji QRLawyer w ramach pracy inżynierskiej.
  ],
  stakeholder-type: "Ożywiony, wewnętrzny, bezpośredni",
  perspective: "Techniczny, akademicki",
  constraints: [
    Ograniczenia czasowe wynikające z harmonogramu akademickiego oraz limitowany budżet projektowy. Zespół działa w ramach z góry określonych terminów oddania pracy inżynierskiej.
  ],
  requirements: "WF1, WF2, WF3, WF6, WF7, WF9, WPF1, WPF2, WPF3",
)

#stakeholder-card(
  id: "U2",
  name: "Opiekun projektu",
  description: [
    Pracownik naukowy PJATK sprawujący nadzór merytoryczny nad projektem inżynierskim, pełniący funkcję promotora zespołu projektowego. Weryfikuje zgodność projektu z wymaganiami akademickimi oraz ocenia postępy zespołu.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, bezpośredni",
  perspective: "Akademicki, merytoryczny",
  constraints: [
    Ograniczona dostępność czasowa wynikająca z obowiązków dydaktycznych. Ocena projektu odbywa się zgodnie
    z regulaminem PJATK.
  ],
  requirements: "WF1, WF6, WPF1, WPF4",
)

#stakeholder-card(
  id: "U3",
  name: "PJATK — Polsko-Japońska Akademia Technik Komputerowych",
  description: [
    Uczelnia wyższa, w ramach której realizowany jest projekt inżynierski. Określa wymagania formalne dotyczące pracy dyplomowej oraz stanowi instytucjonalne zaplecze projektu.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, pośredni",
  perspective: "Akademicki, instytucjonalny",
  constraints: [
    Wymagania regulaminowe dotyczące formy i zakresu pracy inżynierskiej. Projekt musi spełniać standardy jakości określone przez uczelnię.
  ],
  requirements: "WPF1, WPF3, WPF5",
)

#stakeholder-card(
  id: "U4",
  name: "Kancelaria prawna",
  description: [
    Organizacja będąca docelowym klientem systemu QRLawyer. Nabywa i wdraża aplikację w celu usprawnienia zarządzania sprawami, dokumentami oraz komunikacji z klientami. Reprezentuje interesy biznesowe odmienne od interesów poszczególnych użytkowników systemu.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, bezpośredni",
  perspective: "Biznesowy, prawny, ekonomiczny",
  constraints: [
    Wymogi tajemnicy zawodowej oraz przepisy RODO nakładają ograniczenia na sposób przetwarzania danych. Kancelaria ponosi odpowiedzialność prawną za dane swoich klientów.
  ],
  requirements: "WF9, WF12, WF17, WF25, WPF1, WPF4, D1, D2",
)

#stakeholder-card(
  id: "U5",
  name: "Pracownik kancelarii",
  description: [
    Główny użytkownik końcowy systemu. Korzysta z aplikacji w codziennej pracy przy obsłudze spraw, zarządzaniu dokumentami, terminarzem oraz komunikacji wewnętrznej. Posiada ograniczone uprawnienia zgodne z rolą zwykłego użytkownika.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, bezpośredni",
  perspective: "Operacyjny, funkcjonalny",
  constraints: [
    Dostęp ograniczony wyłącznie do spraw, do których użytkownik jest przypisany. Brak dostępu do funkcji
    administracyjnych i logów systemowych.
  ],
  requirements: "WF1, WF12, WF14, WF20, WF25, WF26, WF30, WF35, WF40, WPF5",
)

#stakeholder-card(
  id: "U6",
  name: "Superużytkownik kancelarii",
  description: [
    Użytkownik z pełnymi uprawnieniami administracyjnymi w ramach organizacji. Zarządza kontami użytkowników, przypisuje pracowników do spraw oraz nadzoruje działanie systemu z poziomu panelu administracyjnego.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, bezpośredni",
  perspective: "Administracyjny, operacyjny",
  constraints: [
    Odpowiedzialność za poprawność danych w systemie oraz zgodność działań z polityką kancelarii i wymogami prawnymi.
  ],
  requirements: "WF7, WF8, WF9, WF10, WF17, WF44, WF45, WF46, WF50",
)

#stakeholder-card(
  id: "U7",
  name: "Klient kancelarii",
  description: [
    Osoba fizyczna lub prawna korzystająca z usług kancelarii. Nie posiada dostępu do aplikacji, jednak jest podmiotem danych przetwarzanych przez system oraz odbiorcą powiadomień o terminach.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, pośredni",
  perspective: "Prawny, ochrony danych osobowych",
  constraints: [
    Dane klienta podlegają ochronie zgodnie z RODO. Klient ma prawo do dostępu, sprostowania i usunięcia
    swoich danych przetwarzanych przez system.
  ],
  requirements: "WF20, WF38, WF41, WF48, D1, D2",
)

#stakeholder-card(
  id: "U8",
  name: "Administrator systemu IT",
  description: [
    Osoba lub zespół odpowiedzialny za utrzymanie, monitoring i serwisowanie infrastruktury technicznej aplikacji po jej potencjalnym wdrożeniu. Rola planowana poza zakresem bieżącego projektu inżynierskiego.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, pośredni",
  perspective: "Techniczny, operacyjny",
  constraints: [
    Wdrożenie produkcyjne nie jest planowane w ramach pracy inżynierskiej. Rola istotna z perspektywy
    przyszłego cyklu życia systemu.
  ],
  requirements: "WF6, WF44, WF45, WF46, WPF1, WPF4, WPF8",
)

#stakeholder-card(
  id: "U9",
  name: "Infrastruktura IT",
  description: [
    Środowisko techniczne obejmujące serwery, bazy danych, sieci oraz usługi chmurowe, na których działa aplikacja. Stanowi ograniczenie techniczne i środowiskowe dla projektu.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, pośredni",
  perspective: "Techniczny, infrastrukturalny",
  constraints: [
    Dostępność i wydajność infrastruktury bezpośrednio wpływa na spełnienie wymagań pozafunkcjonalnych
    dotyczących dostępności i wydajności systemu.
  ],
  requirements: "WPF1, WPF2, WPF4, WPF8, WSD3",
)

#stakeholder-card(
  id: "U10",
  name: "Organy regulacyjne",
  description: [
    Instytucje państwowe sprawujące nadzór nad zgodnością systemu z obowiązującymi przepisami prawa, w szczególności Urząd Ochrony Danych Osobowych (UODO) w zakresie przetwarzania danych osobowych.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, pośredni",
  perspective: "Prawny, regulacyjny",
  constraints: [
    System musi spełniać wymogi RODO pod rygorem sankcji administracyjnych. UODO posiada uprawnienia kontrolne wobec podmiotów przetwarzających dane osobowe.
  ],
  requirements: "D1, WPF1, WF50",
)

#stakeholder-card(
  id: "U11",
  name: "Regulacje prawne",
  description: [
    Zbiór aktów prawnych i norm regulujących działanie systemu.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, pośredni",
  perspective: "Prawny, compliance",
  constraints: [
    Przepisy prawa stanowią twarde ograniczenia projektowe, których naruszenie skutkuje odpowiedzialnością prawną kancelarii i twórców systemu.
  ],
  requirements: "D1, D2, WPF1, WF45",
)

#stakeholder-card(
  id: "U12",
  name: "Zespół utrzymania i rozwoju systemu",
  description: [
    Przyszły zespół techniczny odpowiedzialny za rozwój, utrzymanie i serwisowanie aplikacji po zakończeniu
    projektu inżynierskiego. Przejmie odpowiedzialność za kod źródłowy i dokumentację techniczną.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, pośredni",
  perspective: "Techniczny, długoterminowy",
  constraints: [
    Brak bezpośredniego udziału w bieżącym projekcie. Jakość dokumentacji technicznej i czytelność kodu
    bezpośrednio wpływają na możliwości przyszłego rozwoju.
  ],
  requirements: "WPF8, WPF9, WPF10",
)

#stakeholder-card(
  id: "U13",
  name: "Konkurencyjne systemy zarządzania kancelarią",
  description: [
    Istniejące na rynku rozwiązania informatyczne dla kancelarii prawnych, których pozycja rynkowa może zostać osłabiona przez wdrożenie QRLawyer.
  ],
  stakeholder-type: "Nieożywiony, zewnętrzny, negatywny",
  perspective: "Konkurencyjny, rynkowy",
  constraints: [
    Obecność dojrzałych rozwiązań konkurencyjnych wymusza wysoką jakość i unikalność funkcjonalności QRLawyer, szczególnie w zakresie obsługi kodów QR.
  ],
  requirements: "WF25, WF26, WF27, WF29",
)

#stakeholder-card(
  id: "U14",
  name: "Osoby nieuprawnione do danych sprawy",
  description: [
    Podmioty zewnętrzne lub wewnętrzne próbujące uzyskać nieautoryzowany dostęp do poufnych danych spraw
    i klientów kancelarii, motywowane interesem procesowym, finansowym lub wywiadowczym.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, negatywny",
  perspective: "Bezpieczeństwo, zagrożenie",
  constraints: [
    Stanowią bezpośrednie zagrożenie dla poufności danych objętych tajemnicą zawodową i RODO. Ich działania
    wymuszają wysokie standardy bezpieczeństwa systemu.
  ],
  requirements: "WPF1, WF9, WF45, D1, D2",
)

#stakeholder-card(
  id: "U15",
  name: "Podmioty naruszające przepisy o ochronie danych",
  description: [
    Organizacje lub osoby zainteresowane przechwyceniem, ujawnieniem lub nielegalnym przetwarzaniem danych
    osobowych klientów kancelarii przechowywanych w systemie QRLawyer.
  ],
  stakeholder-type: "Ożywiony, zewnętrzny, negatywny",
  perspective: "Bezpieczeństwo, zagrożenie prawne",
  constraints: [
    Ich działania wymuszają zgodność systemu z RODO oraz implementację mechanizmów wykrywania i rejestrowania nieautoryzowanych operacji na danych osobowych.
  ],
  requirements: "WPF1, WF45, WF50, D1",
)

=== Aktorzy i diagramy przypadków użycia

#text(stroke: 0.5pt + red)[Do uzupełnienia]

== Diagramy sekwencji

#text(stroke: 0.5pt + red)[Do uzupełnienia]

== Wymagania ogólne i dziedzinowe

#requirement-card(
  id: "WO1",
  priority: "M - Must",
  name: "Narzędzie do zarządzania dokumentami",
  description: [
    Aplikacja musi umożliwiać generowanie i skanowanie kodów QR dla dokumentacji
    kancelaryjnej i pozwalać na przechowywanie oraz wyszukiwanie zbiorów dokumentów w bazie danych. Przypominanie o terminach związanych z prowadzonymi sprawami. Umożliwienie łatwego wyszukiwania dokumentów oraz współpracy między pracownikami kancelarii poprzez udostępnianie kodów QR.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card(
  id: "WO2",
  priority: "S - Should",
  name: "Zarządzanie współpracą i komunikacją wewnętrzną",
  description: [
    Aplikacja powinna ułatwiać współpracę między pracownikami kancelarii poprzez funkcjonalności związane z udostępnianiem kodów QR, przypisywaniem użytkowników do spraw oraz komunikację wewnątrz systemu (poprzez komentarze i powiadomienia).
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card(
  id: "WO3",
  priority: "S - Should",
  name: "Zarządzanie terminami i powiadomieniami klientów",
  description: [
    System powinien umożliwiać pracownikom kancelarii tworzenie, edytowanie oraz usuwanie terminów powiązanych ze sprawami i klientami. Aplikacja powinna udostępniać funkcjonalności terminarza powiązanego z prowadzonymi sprawami. Klienci kancelarii powinni otrzymywać automatyczne powiadomienia o zmianach w statusie sprawy za pośrednictwem wybranego kanału komunikacji.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card(
  id: "WD1",
  priority: "M - Must",
  name: "Ochrona danych osobowych",
  description: [
    System musi przetwarzać dane osobowe klientów kancelarii zgodnie z prawem lokalnym i unijnym oraz rejestrować operacje przetwarzania danych w sposób umożliwiający wykazanie zgodności z przepisami w ramach ewentualnej kontroli organu nadzorczego.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card(
  id: "WD2",
  priority: "M - Must",
  name: "Zachowanie tajemnicy zawodowej",
  description: [
    System musi zapewniać ochronę informacji objętych tajemnicą adwokacką i radcowską. Dostęp do akt spraw, dokumentów procesowych oraz danych klientów musi być ograniczony wyłącznie do upoważnionych pracowników kancelarii. System nie może umożliwiać nieuprawnionego ujawnienia, udostępnienia ani wyeksportowania informacji objętych tajemnicą zawodową.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

== Wymagania funkcjonalne
=== Autentykacja i sesja

#requirement-card-functional(
  id: "WF1",
  priority: "M - Must",
  name: "Logowanie do systemu",
  description: [
    Użytkownik musi mieć możliwość zalogowania się do systemu przy użyciu adresu e-mail i hasła. Po poprawnym uwierzytelnieniu system generuje token sesji i przekierowuje użytkownika
    do pulpitu głównego.
  ],
  acceptance-criteria: [
    Użytkownik podaje poprawne dane logowania i uzyskuje dostęp do aplikacji. Przy błędnych danych system wyświetla komunikat o nieprawidłowym loginie lub haśle bez wskazywania, które pole
    jest błędne.
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF2, WF3, WPF1",
)

#requirement-card-functional(
  id: "WF2",
  priority: "M - Must",
  name: "Wylogowanie z systemu",
  description: [
    Użytkownik musi mieć możliwość wylogowania się z systemu w dowolnym momencie. Po wylogowaniu token sesji zostaje unieważniony, a użytkownik jest przekierowywany do ekranu logowania.
  ],
  acceptance-criteria: [
    Po wylogowaniu próba użycia unieważnionego tokenu sesji skutkuje odmową dostępu.
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF1, WPF1",
)

#requirement-card-functional(
  id: "WF3",
  priority: "M - Must",
  name: "Automatyczne wygasanie sesji",
  description: [
    System musi automatycznie kończyć sesję użytkownika po określonym czasie bezczynności. Użytkownik jest informowany o wygaśnięciu sesji i przekierowywany do ekranu logowania.
  ],
  acceptance-criteria: [
    Sesja wygasa po #text(stroke: 0.5pt + red)[X] minutach bezczynności użytkownika. Przed wygaśnięciem system wyświetla ostrzeżenie z możliwością przedłużenia sesji. Dane niezapisane w momencie wygaśnięcia sesji nie są tracone -- system przechowuje je tymczasowo do ponownego zalogowania.
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF1, WF2, WPF1",
)

#requirement-card-functional(
  id: "WF4",
  priority: "M - Must",
  name: "Reset hasła",
  description: [#text(stroke: 0.5pt + red)[Do uzupełnienia]
  ],
  acceptance-criteria: [#text(stroke: 0.5pt + red)[Do uzupełnienia]
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF1, WPF1",
)

#requirement-card-functional(
  id: "WF5",
  priority: "C - Could",
  name: "Interaktywny przewodnik powitalny",
  description: [
    Przy pierwszym logowaniu użytkownik jest przeprowadzany przez interaktywny przewodnik prezentujący kluczowe funkcje aplikacji. Użytkownik może pominąć przewodnik lub powrócić do niego w dowolnym momencie z poziomu ustawień konta.
  ],
  acceptance-criteria: [
    Przewodnik uruchamia się automatycznie wyłącznie przy pierwszym logowaniu na dane konto. Użytkownik może
    przerwać przewodnik w dowolnym kroku i wznowić go później. Ukończenie lub pominięcie przewodnika jest rejestrowane w profilu użytkownika.
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF1, WPF5",
)

#requirement-card-functional(
  id: "WF6",
  priority: "M - Must",
  name: "Tryb przerwy technicznej",
  description: [
    Administrator systemu musi mieć możliwość aktywowania trybu przerwy technicznej, w którym użytkownicy mogą wyłącznie odczytywać swoje dane bez możliwości ich edytowania lub dodawania nowych. Aplikacja wyświetla w tym czasie wyraźny komunikat o trwającej przerwie technicznej.
  ],
  acceptance-criteria: [
    Po aktywowaniu trybu przerwy technicznej wszystkie operacje zapisu, edycji i usuwania danych są blokowane dla zwykłych użytkowników. Aplikacja wyświetla baner informujący o przerwie oraz przewidywanym czasie jej zakończenia. Superużytkownik zachowuje pełny dostęp do systemu w trakcie przerwy.
  ],
  stakeholder: "Administrator systemu",
  related: "WPF4, WPF1",
)

=== Zarządzanie użytkownikami i rolami

#requirement-card-functional(
  id: "WF7",
  priority: "M - Must",
  name: "Dodawanie użytkownika przez superużytkownika",
  description: [
    Superużytkownik musi mieć możliwość dodawania nowych użytkowników do organizacji. Podczas tworzenia konta określana jest rola użytkownika oraz jego dane podstawowe. System wysyła nowemu użytkownikowi dane dostępowe na podany adres e-mail.
  ],
  acceptance-criteria: [
    Superużytkownik wypełnia formularz tworzenia konta i zatwierdza operację. Nowy użytkownik otrzymuje e-mail z danymi logowania i linkiem do pierwszego logowania. Konto jest aktywne i widoczne na liście użytkowników natychmiast po utworzeniu.
  ],
  stakeholder: "Administrator systemu",
  related: "WF1, WF5, WPF1",
)

#requirement-card-functional(
  id: "WF8",
  priority: "M - Must",
  name: "Edycja i dezaktywacja konta użytkownika",
  description: [
    Superużytkownik musi mieć możliwość edytowania danych istniejących kont użytkowników oraz ich dezaktywacji. Dezaktywacja konta uniemożliwia użytkownikowi logowanie bez usuwania jego danych z systemu.
  ],
  acceptance-criteria: [
    Po dezaktywacji konta użytkownik nie może się zalogować, a jego aktywne sesje zostają natychmiast unieważnione. Dane i historia aktywności dezaktywowanego użytkownika pozostają dostępne dla superużytkownika.
  ],
  stakeholder: "Administrator systemu",
  related: "WF1, WF2, WPF1",
)

#requirement-card-functional(
  id: "WF9",
  priority: "M - Must",
  name: "Role i uprawnienia użytkowników",
  description: [
    System musi obsługiwać dwie role użytkowników: superużytkownika oraz zwykłego użytkownika. Superużytkownik posiada pełny dostęp do wszystkich funkcji systemu. Zwykły użytkownik ma dostęp
    wyłącznie do spraw, do których został przypisany, oraz nie może korzystać z funkcji administracyjnych ani przeglądać logów systemowych.
  ],
  acceptance-criteria: [
    Zwykły użytkownik nie widzi spraw, do których nie jest przypisany. Próba dostępu do panelu administracyjnego przez zwykłego użytkownika skutkuje odmową dostępu. Superużytkownik ma dostęp do wszystkich spraw i funkcji bez ograniczeń.
  ],
  stakeholder: "Administrator systemu, Pracownicy kancelarii",
  related: "WF7, WF8, WPF1, D2",
)

#requirement-card-functional(
  id: "WF10",
  priority: "M - Must",
  name: "Lista użytkowników systemu",
  description: [
    Superużytkownik musi mieć dostęp do listy wszystkich użytkowników systemu wraz z ich statusem, rolą oraz
    podstawowymi danymi. Lista powinna umożliwiać filtrowanie i wyszukiwanie użytkowników.
  ],
  acceptance-criteria: [
    Lista użytkowników wyświetla co najmniej: imię i nazwisko, adres e-mail, rolę oraz status konta (aktywne/nieaktywne).
  ],
  stakeholder: "Administrator systemu",
  related: "WF7, WF8, WF9",
)

#requirement-card-functional(
  id: "WF11",
  priority: "M - Must",
  name: "Profil i ustawienia konta użytkownika",
  description: [
    Każdy użytkownik musi mieć możliwość przeglądania i edytowania własnych danych profilowych, w tym imienia, nazwiska, zdjęcia profilowego oraz hasła. Zmiana hasła wymaga podania aktualnego
    hasła.
  ],
  acceptance-criteria: [
    Użytkownik może zaktualizować swoje dane profilowe bez udziału superużytkownika. Zmiana hasła jest możliwa wyłącznie po poprawnej weryfikacji aktualnego hasła. Zaktualizowane dane
    są widoczne natychmiast po zapisaniu.
  ],
  stakeholder: "Klienci kancelarii, Pracownicy kancelarii",
  related: "WF1, WPF1",
)

=== Zarządzanie sprawami

#requirement-card-functional(
  id: "WF12",
  priority: "M - Must",
  name: "Tworzenie nowej sprawy",
  description: [
    Użytkownik z odpowiednimi uprawnieniami musi mieć możliwość utworzenia nowej sprawy w systemie. Podczas tworzenia sprawy określane są jej podstawowe dane.
  ],
  acceptance-criteria: [
    Użytkownik wypełnia formularz tworzenia sprawy i zatwierdza operację. Nowa sprawa pojawia się natychmiast na liście spraw z domyślnym statusem.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF9, WF13, WF14, WF22",
)

#requirement-card-functional(
  id: "WF13",
  priority: "M - Must",
  name: "Edycja i aktualizacja sprawy",
  description: [
    Użytkownik przypisany do sprawy musi mieć możliwość edytowania jej danych, w tym nazwy, statusu oraz przypisanych użytkowników. Superużytkownik może edytować dowolną sprawę niezależnie od przypisania.
  ],
  acceptance-criteria: [
    Zmiany w sprawie są zapisywane natychmiast po zatwierdzeniu i widoczne dla wszystkich przypisanych użytkowników. Zwykły użytkownik nieprzypisany do sprawy nie może jej edytować. Historia zmian sprawy jest rejestrowana w logach.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF9, WF12, WF14",
)

#requirement-card-functional(
  id: "WF14",
  priority: "M - Must",
  name: "Przeglądanie listy spraw",
  description: [
    Użytkownik musi mieć dostęp do listy spraw, do których jest przypisany. Superużytkownik widzi wszystkie sprawy w systemie. Lista powinna umożliwiać filtrowanie, sortowanie oraz wyszukiwanie spraw.
  ],
  acceptance-criteria: [
    Lista spraw wyświetla co najmniej: nazwę sprawy, status, tagi oraz #text(stroke: 0.5pt + red)[przypisanego klienta (do uzupełnienia na prototypie)]. Użytkownik może filtrować sprawy według statusu i klienta oraz wyszukiwać po nazwie.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF9, WF12, WF13",
)

#requirement-card-functional(
  id: "WF15",
  priority: "M - Must",
  name: "Zmiana statusu sprawy",
  description: [
    Użytkownik przypisany do sprawy musi mieć możliwość zmiany jej statusu zgodnie z aktualnym etapem prowadzenia sprawy. Dostępne statusy obejmują co najmniej: aktywna, w toku, zawieszona i 
    zakończona.
  ],
  acceptance-criteria: [
    Zmiana statusu jest rejestrowana wraz z datą, godziną i identyfikatorem użytkownika dokonującego zmiany.
    Sprawa o statusie zarchiwizowana jest dostępna wyłącznie w trybie odczytu dla zwykłych użytkowników.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF13, WF16",
)

#requirement-card-functional(
  id: "WF16",
  priority: "M - Must",
  name: "Archiwizacja i zawieszenie sprawy",
  description: [
    Użytkownik musi mieć możliwość archiwizacji zakończonej sprawy oraz tymczasowego zawieszenia sprawy w toku. Zarchiwizowane sprawy są przechowywane w systemie, ale nie figurują na głównej liście aktywnych spraw.
  ],
  acceptance-criteria: [
    Zarchiwizowana sprawa jest dostępna z poziomu osobnego podwidoku. Zawieszona sprawa jest przenoszona tymczasowo do archiwum, a w momencie zbliżania się terminu do podjęcia, automatycznie wraca do widoku listy aktywnych spraw. Operacja archiwizacji wymaga potwierdzenia przez użytkownika.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF15, WF12",
)

#requirement-card-functional(
  id: "WF17",
  priority: "M - Must",
  name: "Przypisywanie użytkowników do sprawy",
  description: [
    Superużytkownik musi mieć możliwość przypisywania i odpinania użytkowników od konkretnych spraw. Zwykły użytkownik może przypisać innego użytkownika do danej sprawy, jeżeli sam został wcześniej do niej przypisany. Przypisany użytkownik uzyskuje dostęp do wszystkich danych i dokumentów danej sprawy.
  ],
  acceptance-criteria: [
    Po przypisaniu użytkownik widzi sprawę na swojej liście spraw natychmiast. Po odpięciu użytkownik traci dostęp do sprawy i nie widzi jej na liście.
  ],
  stakeholder: "Administrator systemu",
  related: "WF9, WF12, WF14",
)

#requirement-card-functional(
  id: "WF18",
  priority: "S - Should",
  name: "Komentarze w sprawie",
  description: [
    Użytkownicy przypisani do sprawy powinni mieć możliwość dodawania komentarzy tekstowych w obrębie danej sprawy. Komentarze służą wewnętrznej komunikacji zespołu dotyczącej konkretnej sprawy.
  ],
  acceptance-criteria: [
    Komentarz jest widoczny dla wszystkich użytkowników przypisanych do sprawy natychmiast po dodaniu. Każdy komentarz wyświetla autora, datę i godzinę dodania. Komentarze są nieusuwalne i nie można ich edytować.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF17, WF9",
)

#requirement-card-functional(
  id: "WF19",
  priority: "S - Should",
  name: "Rejestracja czasu pracy w sprawie",
  description: [
    Użytkownik przypisany do sprawy powinien mieć możliwość rejestrowania czasu pracy poświęconego na daną sprawę. Wpisy czasu pracy są powiązane z konkretną sprawą i widoczne z poziomu widoku szczegółów sprawy.
  ],
  acceptance-criteria: [
    Użytkownik może dodać wpis czasu pracy podając datę, czas trwania oraz opis wykonanych czynności. Superużytkownik widzi zestawienie czasu pracy wszystkich użytkowników w ramach danej sprawy.
  ],
  stakeholder: "Pracownicy kancelarii, Administrator systemu",
  related: "WF12, WF17",
)

=== Baza klientów

#requirement-card-functional(
  id: "WF20",
  priority: "M - Must",
  name: "Tworzenie i edycja profilu klienta",
  description: [
    Użytkownik musi mieć możliwość tworzenia nowych klientów kancelarii oraz edytowania ich danych. Profil klienta zawiera co najmniej imię i nazwisko oraz dane kontaktowe.
  ],
  acceptance-criteria: [
    Nowy profil klienta jest widoczny na liście klientów natychmiast po utworzeniu. Edycja danych klienta jest dostępna dla każdego użytkownika.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF22, WF9",
)

#requirement-card-functional(
  id: "WF21",
  priority: "M - Must",
  name: "Przeglądanie listy klientów",
  description: [
    Użytkownik musi mieć dostęp do listy klientów kancelarii wraz z możliwością wyszukiwania i filtrowania. Z poziomu listy użytkownik może przejść do profilu klienta oraz powiązanych z nim spraw.
  ],
  acceptance-criteria: [
    Lista klientów wyświetla co najmniej imię i nazwisko, dane kontaktowe oraz liczbę powiązanych spraw. Użytkownik może wyszukiwać klientów po danych identyfikujących.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF20, WF14",
)

#requirement-card-functional(
  id: "WF22",
  priority: "M - Must",
  name: "Powiązanie klienta ze sprawą",
  description: [
    Użytkownik musi mieć możliwość przypisania istniejącego klienta do sprawy podczas jej tworzenia lub edycji. Jeden klient może być powiązany z wieloma sprawami.
  ],
  acceptance-criteria: [
    Po przypisaniu klienta do sprawy profil klienta wyświetla listę wszystkich powiązanych z nim spraw. Usunięcie powiązania klienta ze sprawą nie usuwa profilu klienta ani danych sprawy.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF20",
)

#requirement-card-functional(
  id: "WF23",
  priority: "C - Could",
  name: "Import klientów z kontaktów urządzenia",
  description: [
    Użytkownik powinien mieć możliwość importowania kontaktów z książki adresowej urządzenia mobilnego jako nowych klientów kancelarii. Import może obejmować wszystkie kontakty lub wybrane pozycje.
  ],
  acceptance-criteria: [
    Aplikacja wyświetla listę kontaktów z urządzenia z możliwością zaznaczenia pojedynczych pozycji lub
    wszystkich naraz. Zaimportowane kontakty trafiają do bazy klientów jako nowe profile z danymi pobranymi
    z książki adresowej. Duplikaty są wykrywane i sygnalizowane użytkownikowi przed finalizacją importu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF20, WF21",
)

#requirement-card-functional(
  id: "WF24",
  priority: "M - Must",
  name: "Usuwanie profilu klienta",
  description: [
    Superużytkownik musi mieć możliwość usunięcia profilu klienta z systemu. Usunięcie klienta wymaga potwierdzenia przez użytkownika.
  ],
  acceptance-criteria: [
    Próba usunięcia klienta skutkuje wyświetleniem ostrzeżenia z wymaganym potwierdzeniem.
  ],
  stakeholder: "Administrator systemu",
  related: "WF20, WF22, WF9",
)

=== Kody QR

#requirement-card-functional(
  id: "WF25",
  priority: "M - Must",
  name: "Generowanie kodu QR dla sprawy",
  description: [
    System musi umożliwiać generowanie unikalnego kodu QR powiązanego z konkretną sprawą. Kod QR po zeskanowaniu przekierowuje użytkownika bezpośrednio do widoku danej sprawy w aplikacji.
  ],
  acceptance-criteria: [
    Każda sprawa posiada dokładnie jeden unikalny kod QR. Zeskanowanie kodu QR przez użytkownika z dostępem do sprawy otwiera jej widok w aplikacji. Zeskanowanie kodu przez użytkownika bez dostępu skutkuje odmową dostępu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF26, WF27, WPF1",
)

#requirement-card-functional(
  id: "WF26",
  priority: "M - Must",
  name: "Skanowanie kodu QR",
  description: [
    Aplikacja musi umożliwiać skanowanie kodów QR za pomocą aparatu urządzenia mobilnego. Po poprawnym odczytaniu kodu system identyfikuje powiązaną sprawę i przekierowuje użytkownika do odpowiedniego widoku.
  ],
  acceptance-criteria: [
    Skanowanie kodu QR uruchamia się bezpośrednio z poziomu aplikacji bez konieczności korzystania z zewnętrznego skanera. Czas od zeskanowania do wyświetlenia widoku sprawy nie przekracza 2 sekund przy aktywnym połączeniu sieciowym.
  ],
  stakeholder: "Pracownicy kancelarii, Klienci kancelarii",
  related: "WF25, WF27",
)

#requirement-card-functional(
  id: "WF27",
  priority: "M - Must",
  name: "Deep linking — otwieranie sprawy przez kod QR",
  description: [
    System musi obsługiwać mechanizm deep linkingu umożliwiający otwarcie konkretnej sprawy w aplikacji bezpośrednio po zeskanowaniu przypisanego kodu QR. Mechanizm musi działać zarówno na systemie iOS, jak i Android.
  ],
  acceptance-criteria: [
    Zeskanowanie kodu QR na urządzeniu z zainstalowaną aplikacją otwiera ją bezpośrednio w widoku danej sprawy. Na urządzeniu bez zainstalowanej aplikacji użytkownik jest przekierowywany do odpowiedniego sklepu z aplikacjami.
  ],
  stakeholder: "Pracownicy kancelarii, Klienci kancelarii",
  related: "WF25, WF26, WPF6",
)

#requirement-card-functional(
  id: "WF28",
  priority: "M - Must",
  name: "Udostępnianie i eksport kodu QR",
  description: [
    Użytkownik musi mieć możliwość eksportu wygenerowanego kodu QR w celu jego dalszego wykorzystania. Kod QR może być zapisany jako plik graficzny lub udostępniony przez systemowe opcje udostępniania urządzenia mobilnego.
  ],
  acceptance-criteria: [
    Użytkownik może pobrać kod QR jako plik PNG lub PDF. Opcja udostępnienia kodu QR jest dostępna z poziomu widoku sprawy. Wyeksportowany kod QR jest czytelny i skanowalny po wydrukowaniu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF25, WF29",
)

#requirement-card-functional(
  id: "WF29",
  priority: "S - Should",
  name: "Drukowanie naklejki z kodem QR",
  description: [
    Aplikacja powinna umożliwiać drukowanie naklejki z kodem QR bezpośrednio z poziomu aplikacji za pośrednictwem połączenia Bluetooth z dedykowaną drukarką. Drukowanie odbywa się bez konieczności korzystania z zewnętrznej aplikacji producenta drukarki.
  ],
  acceptance-criteria: [
    Aplikacja wykrywa i paruje się z obsługiwaną drukarką przez Bluetooth. Użytkownik może wydrukować naklejkę z kodem QR bezpośrednio z widoku sprawy. Wydrukowana naklejka zawiera kod QR oraz opcjonalnie nazwę lub identyfikator sprawy.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF25, WF28, WPF6",
)

=== Dokumenty

#requirement-card-functional(
  id: "WF30",
  priority: "M - Must",
  name: "Dodawanie dokumentów do sprawy",
  description: [
    Użytkownik przypisany do sprawy musi mieć możliwość dodawania dokumentów do akt sprawy. Dokumenty mogą być dodawane poprzez wybór pliku z urządzenia lub bezpośrednie skanowanie aparatem urządzenia mobilnego.
  ],
  acceptance-criteria: [
    Użytkownik może dodać dokument z poziomu widoku sprawy wybierając plik z pamięci urządzenia lub skanując dokument aparatem. Dodany dokument jest widoczny na liście dokumentów sprawy natychmiast po przesłaniu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF31, WF9",
)

#requirement-card-functional(
  id: "WF31",
  priority: "M - Must",
  name: "Przeglądanie listy dokumentów sprawy",
  description: [
    Użytkownik musi mieć dostęp do listy wszystkich dokumentów. Lista powinna umożliwiać filtrowanie i wyszukiwanie dokumentów.
  ],
  acceptance-criteria: [
    Lista dokumentów wyświetla co najmniej nazwę pliku, datę dodania oraz autora wpisu. Użytkownik może wyszukiwać dokumenty po nazwie pliku oraz filtrować według daty dodania.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF30, WF32, WF12",
)

#requirement-card-functional(
  id: "WF32",
  priority: "M - Must",
  name: "Podgląd dokumentu",
  description: [
    Użytkownik musi mieć możliwość podglądu dokumentów bezpośrednio w aplikacji bez konieczności pobierania pliku na urządzenie. Obsługiwane formaty obejmują co najmniej PDF.
  ],
  acceptance-criteria: [
    Dokument w formacie PDF otwiera się w podglądzie wbudowanym w aplikację. Użytkownik może powiększać i przewijać podgląd dokumentu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF31, WF30",
)

#requirement-card-functional(
  id: "WF33",
  priority: "M - Must",
  name: "Usuwanie dokumentu ze sprawy",
  description: [
    Użytkownik musi mieć możliwość usunięcia dokumentu. Operacja usunięcia wymaga potwierdzenia i jest
    rejestrowana w logach systemowych.
  ],
  acceptance-criteria: [
    Usunięcie dokumentu wymaga potwierdzenia przez użytkownika. Po usunięciu dokument znika z listy dokumentów i nie jest możliwy do odzyskania przez zwykłego użytkownika. Operacja jest rejestrowana w logach z datą, godziną i identyfikatorem użytkownika.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF31, WF30, WF9",
)

#requirement-card-functional(
  id: "WF34",
  priority: "C - Could",
  name: "Archiwizacja dokumentów sprawy",
  description: [
    System powinien umożliwiać archiwizację dokumentów powiązanych ze sprawą wraz z jej archiwizacją. Zarchiwizowane dokumenty są dostępne w trybie tylko do odczytu.
  ],
  acceptance-criteria: [
    Archiwizacja sprawy powoduje automatyczne przeniesienie wszystkich jej dokumentów do archiwum. Zarchiwizowane dokumenty mogą być przeglądane, ale nie mogą być edytowane ani usuwane przez zwykłego użytkownika.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF16, WF31, WF30",
)

=== Terminarz i kalendarze

#requirement-card-functional(
  id: "WF35",
  priority: "M - Must",
  name: "Tworzenie i edycja terminu",
  description: [
    Użytkownik musi mieć możliwość tworzenia nowych terminów powiązanych ze sprawą oraz ich edytowania. Termin zawiera co najmniej typ (nazwę/opis) datę i #text(stroke: 0.5pt + red)[godzinę (do uzupełnienia na prototypie)].
  ],
  acceptance-criteria: [
    Nowy termin jest widoczny w terminarzu natychmiast po utworzeniu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF36, WF37, WF40",
)

#requirement-card-functional(
  id: "WF36",
  priority: "M - Must",
  name: "Przeglądanie terminarza",
  description: [
    Użytkownik musi mieć dostęp do widoku terminarza prezentującego zaplanowane terminy. Terminarz wyświetla wyłącznie terminy powiązane ze sprawami, do których użytkownik jest przypisany.
  ],
  acceptance-criteria: [
    Kliknięcie terminu w kalendarzu otwiera jego szczegóły.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF35, WF12",
)

#requirement-card-functional(
  id: "WF37",
  priority: "M - Must",
  name: "Usuwanie terminu",
  description: [
    Użytkownik przypisany do sprawy musi mieć możliwość usunięcia terminu powiązanego z tą sprawą. Operacja
    usunięcia wymaga potwierdzenia przez użytkownika.
  ],
  acceptance-criteria: [
    Po usunięciu termin znika z terminarza natychmiast. Usunięcie terminu nie wpływa na dane powiązanej sprawy. Operacja jest rejestrowana w logach systemowych.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF35, WF36",
)

#requirement-card-functional(
  id: "WF38",
  priority: "M - Must",
  name: "Powiadomienia o zbliżających się terminach",
  description: [
    System musi automatycznie wysyłać powiadomienia do użytkowników przypisanych do sprawy. Powiadomienia
    są wysyłane z odpowiednim wyprzedzeniem przed datą terminu.
  ],
  acceptance-criteria: [
    Powiadomienie jest wysyłane co najmniej 24 godziny przed terminem. Użytkownik może skonfigurować czas wyprzedzenia powiadomień.
  ],
  stakeholder: "Pracownicy kancelarii, Klienci kancelarii",
  related: "WF35, WF39, WF40",
)

#requirement-card-functional(
  id: "WF39",
  priority: "S - Should",
  name: "Integracja z zewnętrznymi kalendarzami",
  description: [
    System powinien umożliwiać dwukierunkową synchronizację terminów z zewnętrznymi kalendarzami, takimi jak Google Calendar oraz Apple Calendar. Użytkownik może importować terminy do systemu oraz eksportować je do zewnętrznego kalendarza.
  ],
  acceptance-criteria: [
    Użytkownik może połączyć swoje konto z zewnętrznym kalendarzem z poziomu ustawień aplikacji. Terminy
    dodane w systemie są automatycznie synchronizowane z podłączonym kalendarzem zewnętrznym i odwrotnie.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF35, WF36",
)

=== Powiadomienia

#requirement-card-functional(
  id: "WF40",
  priority: "M - Must",
  name: "Powiadomienia push dla użytkowników systemu",
  description: [
    System musi wysyłać powiadomienia push do pracowników kancelarii o zdarzeniach wymagających ich uwagi, takich jak zbliżające się terminy, nowe komentarze w sprawie oraz zmiany statusu spraw.
  ],
  acceptance-criteria: [
    Powiadomienie push dociera do użytkownika w czasie nieprzekraczającym 30 sekund od wystąpienia zdarzenia. Użytkownik może zarządzać kategoriami otrzymywanych powiadomień z poziomu ustawień aplikacji.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF35, WF38, WF18, WF15",
)

#requirement-card-functional(
  id: "WF41",
  priority: "S - Must",
  name: "Powiadomienia dla klientów kancelarii",
  description: [
    System musi automatycznie informować klientów kancelarii o zmianach w statusie spraw, do których są przypisani. Powiadomienia są wysyłane na adres e-mail podany w profilu klienta.
  ],
  acceptance-criteria: [
    Treść powiadomienia zawiera nazwę sprawy, datę i godzinę zmiany statusu sprawy oraz dane kontaktowe kancelarii. Wysłanie powiadomienia jest rejestrowane w systemie.
  ],
  stakeholder: "Klienci kancelarii",
  related: "WF38, WF35, WF20",
)

#requirement-card-functional(
  id: "WF42",
  priority: "M - Must",
  name: "Centrum powiadomień w aplikacji",
  description: [
    Aplikacja musi udostępniać widok centrum powiadomień, w którym użytkownik może przeglądać historię otrzymanych powiadomień. Nieprzeczytane powiadomienia są wyraźnie oznaczone i dostępne po ponownym otwarciu aplikacji.
  ],
  acceptance-criteria: [
    Centrum powiadomień wyświetla listę powiadomień posortowaną od najnowszego. Każde powiadomienie zawiera datę, godzinę oraz skrót treści zdarzenia. Kliknięcie powiadomienia przekierowuje użytkownika bezpośrednio do powiązanego obiektu w systemie.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF40, WF41",
)

#requirement-card-functional(
  id: "WF43",
  priority: "S - Should",
  name: "Zarządzanie preferencjami powiadomień",
  description: [
    Użytkownik powinien mieć możliwość konfigurowania preferencji dotyczących otrzymywanych powiadomień,
    w tym wyboru kategorii zdarzeń oraz kanałów dostarczania powiadomień.
  ],
  acceptance-criteria: [
    Użytkownik może włączyć lub wyłączyć poszczególne kategorie powiadomień z poziomu ustawień konta. Zmiany preferencji są stosowane natychmiast i nie wymagają ponownego uruchomienia aplikacji.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF40, WF42, WF11",
)

=== Panel administracyjny i logi

#requirement-card-functional(
  id: "WF44",
  priority: "S - Should",
  name: "Panel superużytkownika",
  description: [
    Superużytkownik powinien mieć dostęp do dedykowanego panelu umożliwiającego zarządzanie użytkownikami, monitorowanie stanu systemu oraz konfigurację ustawień aplikacji. Panel jest niedostępny dla zwykłych użytkowników.
  ],
  acceptance-criteria: [
    Próba dostępu do panelu superużytkownika przez zwykłego użytkownika skutkuje odmową dostępu. Panel wyświetla co najmniej: listę użytkowników, stan systemu oraz skrót ostatnich zdarzeń w logach.
  ],
  stakeholder: "Administrator systemu",
  related: "WF9, WF7, WF8, WF10",
)

#requirement-card-functional(
  id: "WF45",
  priority: "S - Should",
  name: "Przeglądanie logów systemowych",
  description: [
    Superużytkownik powinien mieć dostęp do logów systemowych rejestrujących kluczowe zdarzenia w aplikacji, takie jak logowania do aplikacji oraz błędy systemowe. Logi są dostępne wyłącznie w trybie odczytu.
  ],
  acceptance-criteria: [
    Logi systemowe wyświetlają co najmniej: datę i godzinę zdarzenia, identyfikator, typ zdarzenia oraz
    jego wynik. Superużytkownik może filtrować logi. Zwykły użytkownik nie ma dostępu do logów.
  ],
  stakeholder: "Administrator systemu",
  related: "WF44, WF9, WPF1",
)

=== Wyszukiwanie globalne

#requirement-card-functional(
  id: "WF46",
  priority: "M - Must",
  name: "Wyszukiwanie globalne",
  description: [
    System musi udostępniać mechanizm wyszukiwania globalnego umożliwiający jednoczesne przeszukiwanie spraw, klientów oraz dokumentów z jednego miejsca w aplikacji. Wyniki wyszukiwania są ograniczone do zasobów dostępnych dla danego użytkownika zgodnie z jego uprawnieniami.
  ],
  acceptance-criteria: [
    Wyszukiwarka zwraca wyniki z co najmniej trzech kategorii: sprawy, klienci i dokumenty. Wyniki są pogrupowane według kategorii i wyświetlane w czasie rzeczywistym podczas wpisywania frazy. Kliknięcie wyniku przekierowuje użytkownika bezpośrednio do powiązanego obiektu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF14, WF21, WF31, WF9",
)

#requirement-card-functional(
  id: "WF47",
  priority: "S - Should",
  name: "Filtrowanie i sortowanie wyników wyszukiwania",
  description: [
    Użytkownik powinien mieć możliwość zawężania wyników wyszukiwania za pomocą filtrów oraz zmiany kolejności wyświetlanych wyników.
  ],
  acceptance-criteria: [
    Użytkownik może filtrować wyniki, a zastosowanie filtrów aktualizuje wyniki natychmiast bez przeładowania widoku. Aktywne filtry są wyraźnie oznaczone i można je usunąć jednym kliknięciem.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF46",
)

=== Pozostałe

#requirement-card-functional(
  id: "WF48",
  priority: "M - Must",
  name: "Eksport akt sprawy do PDF",
  description: [
    Użytkownik przypisany do sprawy musi mieć możliwość wyeksportowania akt sprawy do pliku PDF. Eksport obejmuje dane sprawy, listę powiązanych dokumentów oraz historię zmian statusów.
  ],
  acceptance-criteria: [
    Wygenerowany plik PDF zawiera kompletne dane sprawy oraz listę dokumentów z datami dodania. Plik jest
    czytelny i możliwy do otwarcia bez dostępu do aplikacji Operacja eksportu jest dostępna z poziomu widoku sprawy.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF12, WF31, WPF10",
)

#requirement-card-functional(
  id: "WF49",
  priority: "C - Could",
  name: "Tryb offline",
  description: [
    Aplikacja powinna umożliwiać przeglądanie wcześniej załadowanych danych w przypadku braku połączenia
    z internetem. Użytkownik jest informowany o braku połączenia i ograniczonej funkcjonalności aplikacji.
  ],
  acceptance-criteria: [
    W trybie offline użytkownik może przeglądać dane spraw i klientów załadowane podczas ostatniej
    aktywnej sesji. Wszelkie operacje zapisu są blokowane i sygnalizowane odpowiednim komunikatem. Po przywróceniu połączenia aplikacja automatycznie synchronizuje dane.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF14, WF31, WPF4",
)

#requirement-card-functional(
  id: "WF50",
  priority: "M - Must",
  name: "Usuwanie sprawy",
  description: [
    Superużytkownik musi mieć możliwość trwałego usunięcia sprawy z systemu, w związku z wymaganiami RODO. Usunięcie sprawy powoduje trwałe usunięcie wszystkich powiązanych z nią danych, w tym dokumentów, terminów oraz
    historii zmian. Operacja jest nieodwracalna i wymaga dwuetapowego potwierdzenia.
  ],
  acceptance-criteria: [
    Usunięcie sprawy jest dostępne wyłącznie dla superużytkownika. System wyświetla ostrzeżenie z listą powiązanych danych
    które zostaną usunięte oraz wymaga wpisania nazwy sprawy
    w celu potwierdzenia operacji. Usunięcie jest rejestrowane
    w logach systemowych wraz z datą, godziną i identyfikatorem
    superużytkownika.
  ],
  stakeholder: "Administrator systemu",
  related: "WF12, WF16, WF31, WF37, WF9, D1",
)


== Wymagania pozafunkcjonalne

#requirement-card-functional(
  id: "WPF1",
  priority: "M - Must",
  name: "Bezpieczeństwo danych",
  description: [
    System musi zapewniać ochronę danych osobowych klientów oraz poufnych informacji kancelarii przed nieuprawnionym dostępem, ujawnieniem, modyfikacją lub utratą. Hasła użytkowników muszą być przechowywane w postaci zahashowanej z wykorzystaniem odpowiedniego algorytmu. Komunikacja między klientem a serwerem musi odbywać się wyłącznie za pośrednictwem szyfrowanego protokołu HTTPS (TLS 1.2 lub wyższy). System musi rejestrować zdarzenia związane z dostępem do danych wrażliwych w postaci
    niemodyfikowalnych logów audytowych.
  ],
  acceptance-criteria: [
    Całość ruchu sieciowego odbywa się przez HTTPS — próba połączenia przez HTTP jest automatycznie przekierowywana. Logi audytowe są zapisywane dla każdej operacji odczytu i modyfikacji danych klientów oraz akt spraw.
  ],
  stakeholder: "Zespół projektowy",
  related: "D1, D2",
)

#requirement-card-functional(
  id: "WPF2",
  priority: "M - Must",
  name: "Wydajność",
  description: [
    System musi zapewniać płynne działanie aplikacji przy typowym obciążeniu użytkowników. Czas odpowiedzi na żądania użytkownika nie powinien powodować zauważalnych opóźnień w codziennej pracy z aplikacją.
  ],
  acceptance-criteria: [
    Czas odpowiedzi serwera na żądania API nie przekracza 2 sekund przy obciążeniu do 50 jednoczesnych użytkowników. Interfejs użytkownika pozostaje responsywny podczas wykonywania operacji w tle.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card-functional(
  id: "WPF3",
  priority: "S - Should",
  name: "Zgodność",
  description: [
    Aplikacja powinna spełniać wytyczne techniczne i polityki prywatności wymagane przez sklepy Apple App Store oraz Google Play Store, umożliwiające jej publikację i dystrybucję.
  ],
  acceptance-criteria: [
    Aplikacja przechodzi proces weryfikacji i zostaje zatwierdzona do publikacji przez oba sklepy bez odrzucenia z powodów technicznych lub naruszenia polityk prywatności.
  ],
  stakeholder: "Zespół projektowy",
  related: "D1, WPF1",
)

#requirement-card-functional(
  id: "WPF4",
  priority: "C - Could",
  name: "Dostępność usługi",
  description: [
    System powinien być dostępny dla użytkowników przez możliwie długi czas bez nieplanowanych przerw. Planowane prace serwisowe powinny być komunikowane użytkownikom z wyprzedzeniem.
  ],
  acceptance-criteria: [
    Aplikacja osiąga dostępność na poziomie co najmniej 99% w skali miesiąca. Użytkownicy są informowani o planowanych przerwach technicznych z co najmniej 24-godzinnym wyprzedzeniem.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "TBD",
)

#requirement-card-functional(
  id: "WPF5",
  priority: "S - Should",
  name: "Intuicyjność interfejsu użytkownika",
  description: [
    Interfejs aplikacji powinien być zaprojektowany w sposób umożliwiający efektywne korzystanie z systemu bez konieczności przeprowadzania dedykowanych szkoleń. Nawigacja i rozmieszczenie funkcji powinny być spójne i przewidywalne.
  ],
  acceptance-criteria: [
    Nowy użytkownik jest w stanie samodzielnie wykonać podstawowe operacje w systemie po zapoznaniu się wyłącznie z dokumentacją użytkownika. Kluczowe funkcje są dostępne w nie więcej niż trzech krokach nawigacji.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "TBD",
)

#requirement-card-functional(
  id: "WPF6",
  priority: "M - Must",
  name: "Kompatybilność z systemami iOS i Android",
  description: [
    Aplikacja musi działać poprawnie na urządzeniach mobilnych z systemem iOS oraz Android w wersjach aktywnie wspieranych przez ich producentów.
  ],
  acceptance-criteria: [
    Aplikacja działa bez błędów krytycznych na iOS 16+ oraz Android 12+. Interfejs użytkownika wyświetla się poprawnie na ekranach o przekątnej od 4,7 do 6,7 cala.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "WPF3",
)

#requirement-card-functional(
  id: "WPF7",
  priority: "W - Won't",
  name: "Obsługa wielu języków",
  description: [
    System powinien umożliwiać korzystanie z interfejsu aplikacji w więcej niż jednym języku. W obecnej wersji aplikacja jest przeznaczona wyłącznie na rynek polski i dostępna jedynie w języku polskim.
  ],
  acceptance-criteria: [
    Interfejs aplikacji jest w pełni przetłumaczony na język polski. Wdrożenie dodatkowych wersji językowych nie jest planowane w bieżącym zakresie projektu.
  ],
  stakeholder: "Zespół projektowy",
  related: "TBD",
)

#requirement-card-functional(
  id: "WPF8",
  priority: "C - Could",
  name: "Skalowalność systemu",
  description: [
    Architektura systemu powinna umożliwiać rozbudowę aplikacji o nowe funkcjonalności oraz obsługę rosnącej liczby użytkowników bez konieczności przeprojektowania istniejących komponentów.
  ],
  acceptance-criteria: [
    Dodanie nowego modułu funkcjonalnego nie wymaga modyfikacji istniejących komponentów systemu. Wzrost liczby użytkowników o 100% nie wymaga zmian w architekturze aplikacji.
  ],
  stakeholder: "Zespół projektowy",
  related: "WPF2",
)

#requirement-card-functional(
  id: "WPF9",
  priority: "S - Should",
  name: "Niezawodność i obsługa błędów",
  description: [
    System powinien w sposób kontrolowany reagować na błędy i wyjątki, informując użytkownika o problemie bez utraty wprowadzonych danych.
  ],
  acceptance-criteria: [
    Każdy nieobsłużony wyjątek jest rejestrowany w logach systemowych. Użytkownik otrzymuje czytelny komunikat o błędzie bez technicznego opisu wewnętrznego stanu aplikacji.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "WPF2, WPF4",
)

#requirement-card-functional(
  id: "WPF10",
  priority: "M - Must",
  name: "Przenośność danych",
  description: [
    System musi umożliwiać eksport danych kancelarii w formacie umożliwiającym ich przeniesienie lub archiwizację poza systemem.
  ],
  acceptance-criteria: [
    Użytkownik z uprawnieniami administratora może wyeksportować dane spraw i klientów do pliku w formacie PDF lub CSV. Wyeksportowany plik jest kompletny i czytelny bez dostępu do aplikacji.
  ],
  stakeholder: "Zespół projektowy, Pracownicy kancelarii",
  related: "D1, WPF1",
)

== Wymagania na interfejs z otoczeniem

#requirement-card-functional(
  id: "WIO1",
  priority: "M - Must",
  name: "Interfejs z bazą danych",
  description: [
    System musi komunikować się z relacyjną bazą danych w celu trwałego przechowywania i odczytu danych aplikacji. Połączenie z bazą danych musi być szyfrowane i realizowane wyłącznie przez warstwę backendową, bez bezpośredniego dostępu z poziomu aplikacji mobilnej.
  ],
  acceptance-criteria: [
    Aplikacja mobilna nie komunikuje się bezpośrednio z bazą danych -- wszystkie operacje na danych odbywają się przez API backendowe. Utrata połączenia z bazą danych skutkuje zwróceniem czytelnego komunikatu błędu do użytkownika bez ujawniania szczegółów technicznych.
  ],
  stakeholder: "Zespół projektowy, Administrator systemu IT",
  related: "WPF1, WPF2, WPF4, WSD3",
)

#requirement-card-functional(
  id: "WIO2",
  priority: "M - Must",
  name: "Interfejs komunikacji sieciowej HTTPS",
  description: [
    Cała komunikacja między aplikacją mobilną a serwerem backendowym musi odbywać się wyłącznie za pośrednictwem protokołu HTTPS z aktywnym certyfikatem TLS. Komunikacja nieszyfrowana musi być blokowana przez aplikację.
  ],
  acceptance-criteria: [
    Aplikacja odrzuca połączenia realizowane przez protokół HTTP bez szyfrowania. Certyfikat TLS serwera jest weryfikowany przy każdym połączeniu. Wygaśnięcie certyfikatu skutkuje blokadą połączenia i wyświetleniem stosownego komunikatu.
  ],
  stakeholder: "Zespół projektowy, Administrator systemu IT",
  related: "WPF1, WSD3, WIO1",
)

#requirement-card-functional(
  id: "WIO3",
  priority: "M - Must",
  name: "Interfejs usługi powiadomień push",
  description: [
    System musi integrować się z platformowymi usługami powiadomień push. Integracja umożliwia
    dostarczanie powiadomień do użytkowników w czasie rzeczywistym.
  ],
  acceptance-criteria: [
    Powiadomienia push są dostarczane na urządzenia z systemem Android i iOS. Niedostępność usługi powiadomień nie powoduje błędu krytycznego w działaniu aplikacji.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF40, WF42, WPF6, WSD1, WSD2",
)

#requirement-card-functional(
  id: "WIO4",
  priority: "M - Must",
  name: "Interfejs aparatu urządzenia mobilnego",
  description: [
    Aplikacja musi korzystać z aparatu urządzenia mobilnego w celu skanowania kodów QR oraz skanowania dokumentów papierowych. Dostęp do aparatu wymaga udzielenia odpowiednich uprawnień przez użytkownika.
  ],
  acceptance-criteria: [
    Aplikacja wyświetla systemowy monit o udzielenie dostępu do aparatu przy pierwszym uruchomieniu
    funkcji skanowania. Odmowa udzielenia uprawnień skutkuje wyświetleniem komunikatu z instrukcją
    ręcznego włączenia uprawnień w ustawieniach systemu.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF26, WF30, WSD1, WSD2",
)

#requirement-card-functional(
  id: "WIO5",
  priority: "C - Could",
  name: "Interfejs API — Konto Google",
  description: [
    System powinien umożliwiać uwierzytelnianie użytkowników za pośrednictwem Google Identity Services. Integracja pozwala na logowanie się do aplikacji przy użyciu istniejącego konta Google bez konieczności tworzenia osobnego hasła.
  ],
  acceptance-criteria: [
    Użytkownik może zalogować się do aplikacji wybierając opcję logowania przez konto Google. Po pomyślnym
    uwierzytelnieniu przez Google system tworzy lub odwzorowuje konto użytkownika w systemie QRLawyer.
    Logowanie przez Google jest dostępne na obu platformach mobilnych.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF1, WIO2, WSD1, WSD2",
)

#requirement-card-functional(
  id: "WIO6",
  priority: "C - Could",
  name: "Interfejs API — Konto Microsoft",
  description: [
    System powinien umożliwiać uwierzytelnianie użytkowników za pośrednictwem Microsoft Identity Platform (Azure AD). Integracja pozwala na logowanie się do aplikacji przy użyciu istniejącego konta Microsoft lub konta służbowego Microsoft 365.
  ],
  acceptance-criteria: [
    Użytkownik może zalogować się do aplikacji wybierając opcję logowania przez konto Microsoft. Po pomyślnym uwierzytelnieniu przez Microsoft system tworzy lub odwzorowuje konto użytkownika w systemie QRLawyer. Logowanie przez Microsoft jest dostępne na obu platformach mobilnych.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF1, WIO2, WSD1, WSD2",
)

#requirement-card-functional(
  id: "WIO7",
  priority: "S - Should",
  name: "Interfejs z zewnętrznymi kalendarzami",
  description: [
    System powinien integrować się z zewnętrznymi usługami kalendarzy, w szczególności Google Calendar oraz
    Apple Calendar, w celu dwukierunkowej synchronizacji terminów. Integracja realizowana jest przez dedykowane API każdej z usług.
  ],
  acceptance-criteria: [
    Użytkownik może autoryzować dostęp aplikacji do swojego kalendarza zewnętrznego z poziomu ustawień konta. Terminy dodane w systemie QRLawyer są automatycznie synchronizowane z podłączonym kalendarzem zewnętrznym i odwrotnie. Odwołanie autoryzacji jest możliwe w dowolnym momencie.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF39, WF35, WIO2",
)

#requirement-card-functional(
  id: "WIO8",
  priority: "S - Should",
  name: "Interfejs Bluetooth — drukarka naklejek",
  description: [
    Aplikacja powinna komunikować się z dedykowaną drukarką naklejek za pośrednictwem protokołu Bluetooth przy użyciu własnego kodu komunikacyjnego. Drukowanie odbywa się bezpośrednio z poziomu aplikacji bez udziału zewnętrznych aplikacji producenta drukarki.
  ],
  acceptance-criteria: [
    Aplikacja wykrywa dostępne drukarki Bluetooth w zasięgu urządzenia i umożliwia ich parowanie. Po sparowaniu użytkownik może wysłać zadanie drukowania naklejki z kodem QR bezpośrednio z widoku sprawy. Utrata połączenia Bluetooth skutkuje wyświetleniem komunikatu o błędzie bez zamknięcia aplikacji.
  ],
  stakeholder: "Pracownicy kancelarii",
  related: "WF29, WSD1, WSD2",
)

== Wymagania na środowisko docelowe

#requirement-card-functional(
  id: "WSD1",
  priority: "M - Must",
  name: "Urządzenia mobilne z systemem iOS",
  description: [
    Aplikacja musi działać poprawnie na urządzeniach mobilnych iPhone z systemem iOS 16 lub nowszym.
  ],
  acceptance-criteria: [
    Aplikacja instaluje się i działa bez błędów krytycznych na urządzeniach z iOS 16+. Interfejs wyświetla się poprawnie na ekranach iPhone.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "WPF3, WPF6",
)

#requirement-card-functional(
  id: "WSD2",
  priority: "M - Must",
  name: "Urządzenia mobilne z systemem Android",
  description: [
    Aplikacja musi działać poprawnie na urządzeniach mobilnych z systemem Android 12 lub nowszym.
  ],
  acceptance-criteria: [
    Aplikacja instaluje się i działa bez błędów krytycznych na urządzeniach z Android 12+. Interfejs wyświetla się poprawnie na ekranach o różnych rozdzielczościach i gęstościach
    pikseli.
  ],
  stakeholder: "Zespół projektowy, Klienci kancelarii, Pracownicy kancelarii",
  related: "WPF3, WPF6",
)

#requirement-card-functional(
  id: "WSD3",
  priority: "M - Must",
  name: "Środowisko serwerowe",
  description: [
    Backend aplikacji musi działać w środowisku serwerowym zapewniającym ciągłość usługi oraz możliwość skalowania. Serwer musi być dostępny przez sieć Internet za pośrednictwem protokołu HTTPS.
  ],
  acceptance-criteria: [
    Serwer backendowy jest dostępny z sieci Internet pod stałym adresem domenowym z aktywnym certyfikatem TLS. Środowisko serwerowe umożliwia wdrożenie nowej wersji aplikacji bez przerwy w działaniu usługi.
  ],
  stakeholder: "Zespół projektowy, Administrator systemu",
  related: "WPF1, WPF2, WPF4",
)

#requirement-card-functional(
  id: "WSD4",
  priority: "C - Could",
  name: "Przeglądarka internetowa — panel administracyjny",
  description: [
    Panel administracyjny systemu powinien być dostępny z poziomu przeglądarki internetowej na urządzeniach
    stacjonarnych. Obsługiwane są aktualne wersje przeglądarek Chrome, Firefox oraz Safari.
  ],
  acceptance-criteria: [
    Panel administracyjny działa poprawnie w najnowszych wersjach przeglądarek Chrome, Firefox i Safari bez
    konieczności instalowania dodatkowych wtyczek.
  ],
  stakeholder: "Zespół projektowy, Administrator systemu, Pracownicy kancelarii",
  related: "WPF5, WPF6",
)

== Kryteria akceptacji systemu

Kryteria akceptacji systemu zostały ustalone przez zespół projektowy jako zbiór mierzalnych i weryfikowalnych warunków, których spełnienie jest niezbędne do uznania systemu QRLawyer za gotowy do wdrożenia. Kryteria te wynikają bezpośrednio ze zdefiniowanych wymagań funkcjonalnych, pozafunkcjonalnych oraz dziedzinowych i stanowią podstawę do przeprowadzenia testów akceptacyjnych.

=== Warunki odbioru systemu

System QRLawyer zostanie uznany za gotowy do odbioru po łącznym spełnieniu następujących warunków:

+ Wszystkie wymagania o priorytecie M~--~Must zostały zaimplementowane i zweryfikowane pozytywnie.
+ Żadne z wymagań o priorytecie M~--~Must nie posiada otwartego błędu krytycznego uniemożliwiającego korzystanie z funkcjonalności.
+ System spełnia wymagania dziedzinowe D1 i D2 w zakresie ochrony danych osobowych i tajemnicy zawodowej.

=== Metody weryfikacji wymagań

Weryfikacja spełnienia kryteriów akceptacji będzie przeprowadzana z wykorzystaniem następujących metod:

- Testy manualne -- weryfikacja wymagań funkcjonalnych poprzez ręczne wykonanie scenariuszy testowych przez członków zespołu projektowego.
- Testy automatyczne -- weryfikacja wymagań pozafunkcjonalnych, w szczególności wydajności i bezpieczeństwa, z wykorzystaniem narzędzi do testowania automatycznego.
- Przegląd dokumentacji -- weryfikacja zgodności implementacji z wymaganiami dziedzinowymi i pozafunkcjonalnymi poprzez analizę dokumentacji technicznej.
- User Acceptance Testing (UAT) -- weryfikacja wymagań funkcjonalnych z perspektywy użytkownika końcowego.

=== Zestawienie kryteriów akceptacji wymagań funkcjonalnych

Poniższa tabela przedstawia zbiorcze zestawienie wymagań funkcjonalnych o priorytecie M~--~Must wraz z przypisanymi metodami weryfikacji. Szczegółowe kryteria akceptacji dla każdego wymagania zostały
zdefiniowane w odpowiednich kartach wymagań.

#pagebreak(weak: true)

#acceptance-criteria-table
