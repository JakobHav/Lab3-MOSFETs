#import "@preview/lilaq:0.5.0" as lq
#let (t, vi, vo) = lq.load-txt(read("LTSpice/3.3.1.txt"), delimiter: "\t", skip-rows: 1)

#let t = t.map(x => x * 1000)
#let t2 = t.map(x => x)

// #let vo = t2.zip(vo).filter(x => calc.abs(x.at(0)) > 0.01)

#show: lq.theme.skyline

#figure(caption: [Rising edge transition of the inverted signal $V_(o u t)$ and input signal $V_(i n)$])[
  #lq.diagram(
    width: 80%,
    height: 24%,
    xlabel: [relative *$t$* for *$V_(o u t)$* [$mu$s]],
    ylabel: [*amplitude* [V]],
    legend: (position: right + horizon),
    ylim: (-0.5, 5.5),
    xlim: (-45, 60),
    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(0%).transparentize(40%), dash: "solid", thickness: 1.5pt))
        it
      },
    ),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),
    lq.xaxis(
      position: top,
      label: [relative *$t$* for *$V_(i n)$* [$mu$s]],
      lq.plot(t.map(x => (x - 10) * 1000), vi, mark: ".", label: [$V_(i n)$], mark-size: 0pt),
      lim: (-1, 2),
    ),


    // lq.plot(t, vi, mark: ".", mark-size: 0pt, label: [$V_(i n)$]),
    lq.plot(t2.map(x => 1000 * (x - 20.552)), vo, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
  )
] <rise>


#v(10pt)
#align(center)[#line(stroke: 0.3pt, length: 80%)]
#v(10pt)
#show: lq.theme.skyline

#figure(caption: [Falling edge transition of the inverted signal $V_(o u t)$ and input  signal $V_(i n)$])[
  #lq.diagram(
    width: 80%,
    height: 24%,
    xlabel: [relative *$t$* for *$V_(o u t)$* [$mu$s]],
    ylabel: [*amplitude* [V]],
    legend: (position: right + horizon),
    ylim: (-0.5, 5.5),
    xlim: (-.12, .10),
    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(0%).transparentize(40%), dash: "solid", thickness: 1.5pt))
        it
      },
    ),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),
    lq.xaxis(
      position: top,
      label: [relative *$t$* for *$V_(i n)$* [$m$s]],
      lq.plot(t.map(x => (x - 20.5)), vi, mark: ".", label: [$V_(i n)$], mark-size: 0pt),
      lim: (-0.900, 0.800),
    ),


    // lq.plot(t, vi, mark: ".", mark-size: 0pt, label: [$V_(i n)$]),
    lq.plot(t2.map(x => 1000 * (x - 10.00043)), vo, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
  )
] <fall>


