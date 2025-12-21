#import "@preview/lilaq:0.5.0" as lq

#let (t, v100) = lq.load-txt(read("assets/3.4.2.50.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v200) = lq.load-txt(read("assets/3.4.2.100.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v500) = lq.load-txt(read("assets/3.4.2.200.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v1k) = lq.load-txt(read("assets/3.4.2.1k.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v2k) = lq.load-txt(read("assets/3.4.2.2k.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v5k) = lq.load-txt(read("assets/3.4.2.5k.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v10k) = lq.load-txt(read("assets/3.4.2.10k.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v20k) = lq.load-txt(read("assets/3.4.2.20k.txt"), delimiter: "\t", skip-rows: 24)
#let (t, v50k) = lq.load-txt(read("assets/3.4.2.50k.txt"), delimiter: "\t", skip-rows: 24)

#let avg(l) = l.sum() / l.len()

#let freq = (100, 200, 500, 1000, 2000, 5000, 10000, 20000, 50000).map(x => x / 1000)
#let values = (v100, v200, v500, v1k, v2k, v5k, v10k, v20k, v50k).map(avg)

#show: lq.theme.skyline

#figure(
  caption: [...],
)[
  #lq.diagram(
    width: 90%,
    height: 24%,
    // title: [],
    xlabel: [*Frequency* [kHz]],
    ylabel: [*Average Voltage* [V]],
    legend: (position: right + bottom, dx: -0pt, dy: -0pt, stroke: none),
    xlim: (0.08, 60),
    ylim: (0, 45),
    xscale: lq.scale.log(base: 2),

    xaxis: (
      exponent: 0,
      // subticks: 10,
      ticks: (
        (.1, ".1"),
        (.2, ".2"),
        (.5, ".5"),
        (1, "1"),
        (2, "2"),
        (5, "5"),
        (10, "10"),
        (2, "2"),
        (50, "50"),
      ),
    ),
    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: red.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
    ),


    lq.plot(freq, values, mark: ".", mark-size: 0pt),
  )

]
