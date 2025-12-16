#import "@preview/lilaq:0.5.0" as lq
#let (vin, vout, id) = lq.load-txt(read("LTSpice/3.2.1.txt"), delimiter: "\t", skip-rows: 1)

#show: lq.theme.skyline

#figure(caption: [Simulated MOSFET characteristics])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(G S)$* [V]],
    ylabel: [*$V_(o u t)$* [V]],
    legend: (position: left + horizon),
    ylim: (-0.001, 5.15),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(-20%), thickness: 1.5pt, dash: "dashed"))
        it
      },
    ),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),


    lq.plot(vin, vout, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
    lq.yaxis(
      position: right,
      label: [*$I_D$* [mA]],
      lq.plot(vin, id.map(x => x * 1000), mark: ".", label: [$I_D$], mark-size: 0pt),
      lim: (-0.1, 26),
    ),
  )
]

#let value_mA = 3.3
#let precision = 5e-5

#let count = id.filter(x => calc.abs(x - value_mA * 1e-3) < precision)

#let index_item = id.position(x => calc.abs(x - value_mA * 1e-3) < precision)

#let corresponding_voltage = vout.at(index_item)


#let (vin, id_1) = lq.load-txt(read("LTSpice/3.2.1_step.txt"), delimiter: "\t", skip-rows: 2)
#let (vin, id_2) = lq.load-txt(read("LTSpice/3.2.1_step copy.txt"), delimiter: "\t", skip-rows: 2)
#let (vin, id_3) = lq.load-txt(read("LTSpice/3.2.1_step copy 2.txt"), delimiter: "\t", skip-rows: 2)

#let ax3 = id_3.at(-5)
#let ax2 = id_2.at(-5)
#let ax1 = id_1.at(-5)

#show: lq.theme.skyline
#figure(caption: [Simulated MOSFET characteristics for varying input voltages])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(D D)$* [V]],
    ylabel: [*$I_D$* [mA]],
    legend: (position: right + horizon, dx: 0pt, dy: -16.5pt),
    xlim: (-0.001, 5.1),
    ylim: (-0.001, 12),

    cycle: (
      it => {
        set lq.style(stroke: (paint: white, thickness: 1.5pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: purple.darken(-20%), thickness: 1.4pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: red, thickness: 1.4pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%), thickness: 1.4pt))
        it
      },
    ),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),


    lq.plot(vin, id_3.map(x => x * 1000), mark: ".", label: [#h(-17pt)$V_(i n)$ [V]], mark-size: 0pt),
    lq.plot(vin, id_3.map(x => x * 1000), mark: ".", label: [$2.26$], mark-size: 0pt),
    lq.plot(vin, id_2.map(x => x * 1000), mark: ".", label: [$2.23$], mark-size: 0pt),
    lq.plot(vin, id_1.map(x => x * 1000), mark: ".", label: [$2.19$], mark-size: 0pt),


    lq.line(
      (0, 0),
      (2.15 * 2, ax3 * 1000 * 2),
      stroke: (
        dash: "dashed",
        paint: green.darken(10%),
        thickness: 0.8pt,
      ),
      label: "l. fit",
    ),
  )
] <fig3>

#let value_mA = ax3 * 1000
#let precision = 5e-5

#let count = id_3.filter(x => calc.abs(x - value_mA * 1e-3) < precision)
#let index_item = id_3.position(x => calc.abs(x - value_mA * 1e-3) < precision)
#let corresponding_voltage = vin.at(index_item)

#let value_mA = ax2 * 1000
#let precision = 5e-5

#let count = id_2.filter(x => calc.abs(x - value_mA * 1e-3) < precision)
#let index_item = id_2.position(x => calc.abs(x - value_mA * 1e-3) < precision)
#let corresponding_voltage = vin.at(index_item)

#let value_mA = ax1 * 1000
#let precision = 5e-5

#let count = id_1.filter(x => calc.abs(x - value_mA * 1e-3) < precision)
#let index_item = id_1.position(x => calc.abs(x - value_mA * 1e-3) < precision)
#let corresponding_voltage = vin.at(index_item)
