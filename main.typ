#let authors = (
  "Łukasz Ogorzałek --- s27447",
  "Stefan Karczewski --- s27459",
  "Kacper Pach --- s27112",
  "Dawid Frontczak --- s29608",
  "Nikodem Rabuliński --- s28840",
)
// TODO: Słowa kluczowe
#let keywords = (
  "Słowa", "kluczowe", "których", "powinno", "być",
  "co", "najmniej", "trzy"
)
// TODO: Streszczenie
#let abstract = [
Lorem ipsum dolor sit amet consectetur adipiscing elit. Ex sapien vitae pellentesque sem placerat in id. Pretium tellus duis convallis tempus leo eu aenean. Urna tempor pulvinar vivamus fringilla lacus nec metus. Iaculis massa nisl malesuada lacinia integer nunc posuere. Semper vel class aptent taciti sociosqu ad litora. Conubia nostra inceptos himenaeos orci varius natoque penatibus. Dis parturient montes nascetur ridiculus mus donec rhoncus. Nulla molestie mattis scelerisque maximus eget fermentum odio. Purus est efficitur laoreet mauris pharetra vestibulum fusce. 
]

#import "contents/assets/cards/project-card.typ": project-card
#import "pjatk-template.typ": apply-pjatk-template
#show: apply-pjatk-template.with(
  language: "pl",
  authors: authors,
  for-printing: false,

  title: "QRLawyer", // TODO(ŁO): dodać subtitle (krótki opis czym jest QRLawyer)
  faculty: "Wydział Informatyki",
  department: "Filia w Gdańsku",
  specialization: "Cyberbezpieczeństwo",

  supervisor: "dr hab. Marek Bednarczyk",
  reviewer: "Reviewer's Name", // TODO(ŁO): Recenzent

  keywords: keywords,
  abstract: abstract,

  //TODO(ŁO): uzupełnić kartę projektu
  project-card-content: project-card(
    title-pl: "QRLaywer: aplikacja mobilna do zarządzania obiegiem dokumentów w kancelariach prawnych",
    title-en: "QRLawyer: a mobile application for managing document workflow in legal offices",
    acronym: "QRL",
    date: "25.01.2025",
    supervisor: "dr hab. Marek Bednarczyk",
    reviewer: "TBD",
    completion-date: "28.06.2026",
    team: (
      (name: "Łukasz Ogorzałek",  album: "s27447", specialization: "Cyberbezpieczeństwo", mode: "Niestacjonarny"),
      (name: "Stefan Karczewski", album: "s27459", specialization: "Cyberbezpieczeństwo", mode: "Niestacjonarny"),
      (name: "Kacper Pach",       album: "s27112", specialization: "Cyberbezpieczeństwo", mode: "Niestacjonarny"),
      (name: "Dawid Frontczak",   album: "s29608", specialization: "Cyberbezpieczeństwo", mode: "Niestacjonarny"),
      (name: "Nikodem Rabuliński",album: "s28840", specialization: "Cyberbezpieczeństwo", mode: "Niestacjonarny"),  
    )
  )
)

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#codly(
  zebra-fill: none,
  breakable: true,
  number-align: left, 
  number-placement: "outside",
  number-format: (n) => text(luma(180))[#str(n)],
  stroke: none,
  inset: (top: 0.25em, bottom: 0.25em),
  display-icon: false,
  display-name: false,
)

#import "@preview/chronos:0.3.0"

//TODO(ŁO): Przejrzeć listę
// #let spojniki = (
//   "a", "abowiem", "aby", "acz", "aczkolwiek", "albo", "alboć", "albowiem",
//   "ale", "ani", "aniżeli", "aż", "aże", "ażeby", "bądź", "bo", "bowiem", "by",
//   "byle", "było", "byś", "choć", "choćby", "chociaż", "czy", "czyli", "dlatego",
//   "dopóki", "dopóty", "dotąd", "gdy", "gdyby", "gdyż", "i", "ilekroć", "im",
//   "iż", "jak", "jakby", "jakkolwiek", "jako", "jakoby", "jednak", "jednakowo",
//   "jednakowoż", "jednakże", "jeśli", "jeśliby", "jeżeli", "kiedy", "lecz",
//   "ledwie", "ledwo", "lub", "mianowicie", "minus", "nadto", "natomiast",
//   "niby", "niczym", "niemniej", "nim", "niż", "niżeli", "oraz", "plus",
//   "poczem", "póki", "ponieważ", "razy", "skoro", "taki", "tj.", "toż",
//   "tudzież", "tylko", "więc", "wiem", "wprawdzie", "wszelako", "zaledwie",
//   "zamiast", "zanim", "zarówno", "zaś", "zatem", "że", "żeby"
// );
// #show regex( " ((?i)" + spojniki.join("|") + ") " ): it => [ #it.text.trim()~]

#include "contents/chapters/introduction.typ"
#include "contents/chapters/analysis.typ"
#include "contents/chapters/planning.typ"
#include "contents/chapters/specification.typ"
#include "contents/chapters/system-project.typ"
#include "contents/chapters/production.typ"
#include "contents/chapters/tests.typ"
#include "contents/chapters/workload.typ"
#include "contents/chapters/summary.typ"

// #include "contents/introduction.typ"
// #include "contents/context.typ"
// #include "contents/functional-requirements.typ"
// #include "contents/non-functional-requirements.typ"
// #include "contents/use-cases.typ"
// #include "contents/content.typ"
