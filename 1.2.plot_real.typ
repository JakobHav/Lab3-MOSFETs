#import "@preview/lilaq:0.5.0" as lq
#let (t, vin, id) = lq.load-txt(read("assets/3.2.2.vgs.id.txt"), delimiter: "\t", skip-rows: 22)

#show: lq.theme.skyline

#figure(caption: [Measured MOSFET characteristics])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(G S)$* [V]],
    // ylabel: [*$V_(o u t)$* [V]],
    ylabel: [*$I_D$* [mA]],
    ylim: (-0.001, 25.15),
    xlim: (-0.1, 3.5),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(-20%), thickness: 1.5pt))
        it
      },
    ),

    yaxis: (mirror: false, exponent: 0, subticks: 4),


    lq.plot(vin, id.map(x => x * 1000), mark: ".", mark-size: 0pt),
  )
]

#let (vdd10, vds10, id10) = lq.load-txt(read("assets/3.2.2.handvalues10.txt"), delimiter: " ", skip-rows: 1)
#let (vdd66, vds66, id66) = lq.load-txt(read("assets/3.2.2.handvalues66.txt"), delimiter: " ", skip-rows: 1)
#let (vdd33, vds33, id33) = lq.load-txt(read("assets/3.2.2.handvalues33.txt"), delimiter: " ", skip-rows: 1)


#show: lq.theme.skyline
#figure(caption: [Measured MOSFET characteristic curves])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(D S)$* [V]],
    ylabel: [*$I_D$* [mA]],
    legend: (position: right + top, dx: 0pt, dy: -16.5pt),
    // xlim: (-0.001, 5.1),
    // ylim: (-0.001, 12),

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


    lq.plot(vds10.map(x => x / 1000), id10, mark: ".", label: [#h(-17pt)$I_D$ [mA]], mark-size: 0pt),
    lq.plot(vds10.map(x => x / 1000), id10, mark: ".", label: [$10.0$], mark-size: 0pt),
    lq.plot(vds66.map(x => x / 1000), id66, mark: ".", label: [$6.6$], mark-size: 0pt),
    lq.plot(vds33.map(x => x / 1000), id33, mark: ".", label: [$3.3$], mark-size: 0pt),
    // lq.plot(vin, id_1.map(x => x * 1000), mark: ".", label: [$2.19$], mark-size: 0pt),
  )
] <handvalues>
