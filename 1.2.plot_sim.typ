#import "@preview/lilaq:0.5.0" as lq
#let (vin, vout, id) = lq.load-txt(read("LTSpice/3.2.1.txt"), delimiter: "\t", skip-rows: 1)

#show: lq.theme.skyline

#figure(caption: [Simulated MOSFET characteristics])[
  #lq.diagram(
    width: 80%,
    height: 22%,
    xlabel: [*$V_(G S)$* [V]],
    ylabel: [*$V_(o u t)$* [V]],
    legend: (position: left + horizon),
    ylim: (-0.001, 5),

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
      lim: (-0.01, 26),
    ),
  )
]

// #panic(id.slice(-10, -1)))

