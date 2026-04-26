#import "@preview/chronos:0.3.0"

#let diagram(name, code) = {
  figure(
    caption: name,
    chronos.diagram(code),
  ) 
}
