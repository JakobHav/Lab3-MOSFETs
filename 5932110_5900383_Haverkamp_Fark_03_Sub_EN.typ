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

#figure(caption: [LTSpice circuit diagram of MOSFET Characteristics])[
  #image("assets/3.2.1.jpg", width: 39%)
] <fig1>

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

The maximum current is with $V_(G S) = 2.4$ V at the end and has a value of $I_D approx 24.87$ mA

#table(
  columns: 5,
  inset: 5pt,
  align: horizon,
  table.header(
    [*$I_D$* \[mA\]],
    [*$V_(o u t)$* \[V\]],
    [*$V_(i n)$* \[V\]],
    [*$m$* #footnote[the slope of the linear fitted curves as shown in @fig3] [$"mA"/"V"$]],
    [*$R_D$* [$Omega$]],
  ),
  [3.3], [4.34], [2.19], [4.7178], [211.96],
  [6.6], [3.67], [2.23], [4.8166], [207.62],
  [10.0], [2.99], [2.26], [4.8964], [204.23],
)

We calculated a value of $V_(o u t) =$ 3.68 V for $I_D = 6.6$ mA and simulated $V_(o u t) =$ 3.67 V, so pretty close!

The Power MOSFET operates way under its normal current, ($I_D < 10$ mA here and $I_D > 5$ A normally), which is why it shows different behaviour.




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

= 3.4. Step up converter

== 3.4.1 Simulation

=== Introduction

We added a series resistance of 10 $Omega$ for the inductor.

=== Circuit Diagrams:

#figure(caption: [LTSpice circuit diagram])[
  #image("assets/3.4.1.jpg", width: 55%)
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
