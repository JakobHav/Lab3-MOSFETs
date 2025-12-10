#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(206pt)
#h(105pt)
Jakob Haverkamp
#h(155pt)
5932110

#h(105pt)
Milan Fark
#h(186pt)
5900383

#set page(background: [])

#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Electronics Laboratory",
  date: "12.12.2025",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 3 - MOSFETs",
  header_start: 2,
  name: "jh1444, mf643",
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

#set figure(numbering: "1")
#show ref: set text(fill: blue)


= 3.2 MOSFET Characteristics

== 3.2.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [])[
  // #image("assets/2.2.1.circuit.jpg", width: 39%)
] <fig1>

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

=== Conclusion:

== 3.2.2. Measurement

=== Introduction

=== Circuit Diagrams:

#figure(caption: [Schematic of the _MOSFET characteristics_ circuit])[
  #image("assets/3.2.2.circuit.jpg", width: 27%)
] <fig5>

=== Plots:

#include "1.2.plot_real.typ"

=== Text Questions:


=== Conclusion

= 3.3. MOS logic gates

== 3.3.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram for the common emitter amplifier])[
  // #image("assets/2.3.1.circuit.jpg", width: 62%)

]<fig9>

=== Plots:

#include "1.3.plot_sim.typ"

=== Text Questions:
=== Conclusion:
= 3.3.2. Measurement

=== Introduction
=== Circuit Diagrams:

#figure(caption: [Schematic of the _MOSFET characteristics_ circuit])[
  #image("assets/3.2.2.circuit.jpg", width: 27%)
] <fig11>
=== Plots:

#include "1.3.plot_real.typ"

=== Text Questions:

=== Conclusion

= 3.4. Current source

== 3.4.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram])[
  // #image("assets/2.4.1.circuit.jpg", width: 35%)
] <fig13>

=== Plots:
#include "1.4.plot_sim.typ"

=== Text Questions:


=== Conclusion:


= 3.4.2. Measurement

=== Introduction

Section 3.4.2. is about

=== Circuit Diagrams:


#figure(caption: [Schematic of the _step-up converter_ circuit])[
  #image("assets/3.4.2.circuit.jpg", width: 69%)
]

=== Text Questions:

=== Conclusion
