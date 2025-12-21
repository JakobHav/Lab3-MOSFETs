#import "@preview/lilaq:0.5.0" as lq
#let (t, vi_f, vo_r) = lq.load-txt(read("assets/3.3.2.out_rising.txt"), delimiter: "\t", skip-rows: 24)
#let (t2, vi_r, vo_f) = lq.load-txt(read("assets/3.3.2.in_rising.txt"), delimiter: "\t", skip-rows: 24)

#let t = t.map(x => x * 1000)
#let t2 = t2.map(x => x * 1000)

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
    xlim: (-4, 6),
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
      lq.plot(t2.map(x => (x - 0) * 1000), vi_r, mark: ".", label: [$V_(i n)$], mark-size: 0pt),
      lim: (-0.4, 0.6),
    ),


    // lq.plot(t, vi, mark: ".", mark-size: 0pt, label: [$V_(i n)$]),
    lq.plot(t.map(x => 1000 * (x) - 2), vo_r, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
  )
] <rise_real>


#v(10pt)
// #align(center)[#line(stroke: 0.3pt, length: 80%)]
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
    xlim: (-4.2, 5),
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
      lq.plot(t.map(x => (x - 0) * 1000 + 0.58), vi_f, mark: ".", label: [$V_(i n)$], mark-size: 0pt),
      lim: (-4.2, 5),
    ),


    // lq.plot(t, vi, mark: ".", mark-size: 0pt, label: [$V_(i n)$]),
    lq.plot(t2.map(x => 1000 * (x) - 1), vo_f, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
  )
] <fall_real>
