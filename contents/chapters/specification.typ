#import "../assets/requirement-card.typ": requirement-card

= Specyfikacja wymagań systemowych
== Sposoby ustalania wymagań
=== Konsultacje
Z perspektywy zespołu, głównym celem konsultacji było ustalenie wymagań systemowych w taki sposób, aby funkcjonalności aplikacji odzwierciedlały potrzeby rynkowe. W związku z powyższym, przeprowadzono kilka głównych serii konsultacyjnych z potencjalnymi użytkownikami końcowymi aplikacji oraz na bieżąco kontaktowano się z adwokatami i radcami prawnymi, weryfikując nowe pomysły i zasięgając ich opinii w kwestiach prawnych. Do stałych konsultantów projektu należeli:
- Adwokat Jakub Nowosielski -- prowadzący kancelarię adwokacką w Gdyni, adwokat Jakub Nowosielski nieodpłatnie udzielał odpowiedzi na zapytania zespołu związane z jego administracyjną częścią pracy w kancelarii. Pomagał także podczas oceny użyteczności oprogramowania w kontekście codziennych obowiązków i opiniował zastosowane rozwiązania UI/UX.
- Radca prawny Agnieszka Szczepańska -- świadcząca usługi prawne na terenie Trójmiasta, radca prawny Agnieszka Szczepańska pozostawała w stałym kontakcie z zespołem podczas planowania, jak i procesu tworzenia oraz testowania oprogramowania. W rezultacie współpracy, zespół szybko skonsolidował wymagania systemowe i zdiagnozował błędy podczas symulacji testów akceptacyjnych.
Na podstawie informacji zwrotnych przygotowano listę wymagań ogólnych, funkcjonalnych i systemowych oraz przygotowano ankietę wraz z jej analizą.
=== Ankieta
Badanie ankietowe stanowiło jedno z podstawowych narzędzi zastosowanych w procesie elicytacji wymagań. Głównym celem przeprowadzenia ankiety była jednak nie tylko strukturyzacja wymagań systemowych, ale również pozyskanie danych na temat oczekiwań i preferencji potencjalnych użytkowników.

Grupę docelową stanowili adwokaci i radcowie prawni prowadzący kancelarie w ramach jednoosobowej działalności gospodarczej lub w ramach spółki. Ankietę, składającą się z #text(stroke: 0.5pt + red)[X] pytań, przeprowadzono poprzez Google Forms.
== Przypadki użycia
=== Identyfikacja i analiza interesariuszy
=== Aktorzy i diagramy przypadków użycia
== Diagramy sekwencji
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
== Wymagania pozafunkcjonalne
== Wymagania na interfejs z otoczeniem
== Wymagania na środowisko docelowe
== Kryteria akceptacji systemu
 