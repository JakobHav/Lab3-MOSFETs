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

#figure(caption: [LTSpice _MOSFET Characteristics_ circuit diagram])[
  #image("assets/3.2.1.jpg", width: 39%)
] <fig1>

=== Plots:
#include "1.2.plot_sim.typ"

=== Text Questions:

The maximum current is at the end at $V_(G S) = 2.4$ V  and has a value of $I_D approx 24.87$ mA

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

5 V through WaveForms is less than 5v on the board

#figure(caption: [Different $V_(i n)$ values for given $I_D$])[
  #table(
    columns: 4,
    inset: 5pt,
    // align: horizon,
    align: (left, left, center, center),
    table.header([*$I_D$* \[mA\]], [*$V_(i n)$* \[V\]], [*actual $V_(i n)$* \[V\]], [*final $V_(i n)$* [V]]),
    [3.3], [2.11], [2.310], [2.320],
    [6.6], [2.17], [2.391], [2.377],
    [10.0], [2.21], [2.435], [2.418],
  )]


=== Conclusion

= 3.3. MOS logic gates

== 3.3.1 Simulation

=== Introduction

In this chapter, we used a MOSFET to create a logic gate, more specifically an inverter. The inverter circuit is shown in @mosgate. The input signal is connected to the gate of the MOSFET, the output signal is connected to the drain, as well as to _VDD_ $= 5$ V through a resistor $R_D = 200 Omega$. The source of the tranisitor is connected to _GND_, so when the MOSFET opens, _GND_ is connected to $V_(o u t)$ and the output signal is _LOW_, when it is closed the output signal is _HIGH_.

=== Circuit Diagrams:

#figure(caption: [LTSpice _MOS logic gate_ circuit diagram])[
  #image("assets/3.3.1.jpg", width: 35%)

]<mosgate>

=== Plots:

#include "1.3.plot_sim.typ"

=== Text Questions:

The rising edge can be seen in @rise. $V_(i n)$ has a very linear rising edge, where as $V_(o u t)$ rised quite unevenly, and rises roughly 80 times slower than $V_(i n)$, as seen in @risetimes.

The falling edge of $V_(i n)$ is also very linear, $V_(o u t)$ is also linear, but a little round at the beginning. The fall time of $V_(o u t)$ is much faster than that of $V_(i n)$, by a factor of $m approx 10000$, as seen in @risetimes.

#figure(caption: [Rise and fall times for $V_(i n)$ and $V_(o u t)$])[
  #table(
    columns: 3,
    inset: 5pt,
    align: horizon,
    table.header([*signal*], [*rise time*], [*fall time*]),
    [$V_(i n)$], [1 $mu$s], [1 ms],
    [$V_(o u t)$], [80 $mu$s], [0.12 $mu$s],
    [$t_(p d)$], [42.11 $mu$s], [-27.32 ns],
  )] <risetimes>

To determine the propagation delays is difficult becase of the massive differences in fall time (1 ms and 0.12 $mu$s). This leads possibly negative times when we look at $V_(i n) = 1/2$_VDD_ vs $V_(o u t) = 1/2$_VDD_, as we can see for $t_(p d\(f a l l\))$ in @risetimes. The value is caluclated by:

$ V_(o u t)(t_1) = 1/2 V D D \ V_(i n)(t_i) = 1/2 V D D \ t_(p d) = t_i - t_o $




=== Conclusion:

We successfully simulated the inverter. The falling and rising edges of $V_(i n)$ were very linear, the ones of $V_(o u t)$ had round curves to them. $V_(i n)$ has a fast rise, but very slow fall time, the inverted signal has a very very fast fall and a relatively slow rise time at $t = 80 space mu$s.

= 3.3.2. Measurement

=== Introduction
=== Circuit Diagrams:

#figure(caption: [Schematic of the _MOSFET characteristics_ circuit])[
  #image("assets/3.2.2.circuit.jpg", width: 27%)
] <fig11>
=== Plots:

#include "1.3.plot_real.typ"

=== Text Questions:

#figure(caption: [Minimum and maximum voltages of $V_(i n)$ and $V_(o u t)$ in their steady states])[
  #table(
    columns: 3,
    inset: 5pt,
    align: horizon,
    table.header([*signal*], [*minimum*], [*maximum*]),
    [$V_(i n)$], [-0.09], [4.52],
    [$V_(o u t)$], [-0.11], [5.03],
  )] <minmax>

=== Conclusion

We successfully measured the inverter signal we simulated earlier. \
The rise and fall edges are similar to the simulation, although the fall time of $V_in$ is faster by orders of magnitude.

= 3.4. Step up converter

== 3.4.1 Simulation

=== Introduction

We added a series resistance of 10 $Omega$ for the inductor.

=== Circuit Diagrams:

#figure(caption: [LTSpice _step-up converter_ circuit diagram])[
  #image("assets/3.4.1.jpg", width: 55%)
] <fig13>


=== Text Questions:



=== Conclusion:


= 3.4.2. Measurement

=== Introduction

Section 3.4.2. is about

=== Circuit Diagrams:


#figure(caption: [Schematic of the _step-up converter_ circuit])[
  #image("assets/3.4.2.circuit.jpg", width: 69%)
]

=== Plots:
#include "1.4.plot_real.typ"

#pagebreak()
=== Text Questions:

The output signal measured at $M p_21$ is a saw wave, which starts low and rises with each period, until reaching a maximum amplification and staying in the saw wave pattern.

As seen in @fig16 the average output voltage rises with increasing frequency, because the amplification circuit is switching more often, therefor leading to a higher amplification.

In contrast to the frequency, the duty cycle maxes out its ability to amplify the voltage at around 40% (@fig17). This is because the switching of the transistor needs to happen at the right intervals for the amplifier to work. In the measurement this is at 40%, in contrast to the simulation, where the maximum amplification is achieved at 50%. This is probably because of a difference in switch on/off of the input voltage and the transistor gate. At a duty cycle of 0% the output voltage is at nearly 5V which is roughly the same as the input voltage, just losing some in the circuit, mostly the diode $D_12$. This is because the transistor remains closed at 0%, never receiving any voltage. In contrast, the transistor remains open continuously at a duty cycle of 100%, leading to the input voltage being short circuited with ground.
//#table(
//  columns: 2,
//  inset: 5pt,
//  align: horizon,
//  table.header([*frequency*], [*average voltage*]),
//  [100], [4.69],
//  [200], [4.74],
//  [500], [4.78],
//  [1k], [6.27],
//  [2k], [8.44],
//  [5k], [12.99],
//  [10k], [18.52],
//  [20k], [26.67],
//  [50k], [32.10],
//)

=== Conclusion
