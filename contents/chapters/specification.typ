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
  id: "W1",
  priority: "M - Must",
  name: "Lorem ipsum wymaganie",
  description: [
    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
  ],
  stakeholder: "Quis autem vel eum iure reprehenderit",
  related: "W2, W3, itd",
)
== Wymagania funkcjonalne
== Wymagania pozafunkcjonalne
== Wymagania na interfejs z otoczeniem
== Wymagania na środowisko docelowe
== Kryteria akceptacji systemu
 