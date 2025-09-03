#import "@preview/cetz:0.4.1"
#set page(width : 20cm, height: 20cm, margin : 0.5cm)
#cetz.canvas({
	import cetz.draw: *
	set-style(stroke:(paint: rgb("#888888"), dash: "dashed", thickness: 0.5pt))
	let w = 3   // width of cell
	let h = 1   // height of cell
	let x = 5   // number of horizontal cells 
	let y = 18  // number of vertical cells
	for a in range(1,x+1){
		for b in range(1,y+1){
		rect(((a - 1)*w,(b - 1)*-h), (a*w , b*-h))
		}
	} 
	// draw outline
	set-style(stroke:(paint: black, dash: none, thickness: 1.5pt))
	rect((0,0), (x*w, -y*h))

	// draw time and day
	for a in range(1, y+1){
		let time_t = 450 + (a - 1)*45	// calculate time for each minute
		let time_h = int(time_t / 60)
		let time_m = time_t - (time_h*60)
		content((-w,(1-a)*h), (0,-a*h),
		box(
        align(top+center,
          par(justify: false)[
		  #set text(size: 15pt)
		  #time_h : #time_m]),
          width: 100%,
          height: 100%),
		)
	} 
	content((0,h), (w,0.2),
	box(
    align(center+horizon,
      par(justify: false)[
	  #set text(size: 15pt)
	  Monday]),
      width: 100%,
      height: 100%),
	)
	content((w,h), (2*w,0.2),
	box(
    align(center+horizon,
      par(justify: false)[
	  #set text(size: 15pt)
	  Tuesday]),
      width: 100%,
      height: 100%),
	)
	content((2*w,h), (3*w,0.2),
	box(
    align(center+horizon,
      par(justify: false)[
	  #set text(size: 15pt)
	  Wednesday]),
      width: 100%,
      height: 100%),
	)
	content((3*w,h), (4*w,0.2),
	box(
    align(center+horizon,
      par(justify: false)[
	  #set text(size: 15pt)
	  Thursday]),
      width: 100%,
      height: 100%),
	)
	content((4*w,h), (5*w,0.2),
	box(
    align(center+horizon,
      par(justify: false)[
	  #set text(size: 15pt)
	  Friday]),
      width: 100%,
      height: 100%),
	)

	// TODO: draw individual assignments (implement function)

	let add_assignment(name, f : red, start, end, day, x) = {
	let s = (0,0)
	let e = (0,0)
	let n = 10pt
	if (x == 0){
		s = ((day - 1)*w,(start - 1)*-h)	
		e = ((day*w, (end - 1)*-h))	
	} 
	if (x == 1){
		s = (((day - 1)*w) + (w/2),(start - 1)*-h)	
		e = ((day*w, (end - 1)*-h))	
		n = 8pt
	} 
	if (x == 2){
		s = ((day - 1)*w,(start - 1)*-h)	
		e = ((day*w - (w/2), (end - 1)*-h))	
		n = 8pt
	} 

	content(s, e,
	box(
        align(center+horizon,
          par(justify: false)[
		  #set text(fill : white, size : n)
		  #name]),
          stroke: 1pt ,
		  fill: f,
          width: 100%,
          height: 100%,
          inset: 1em),
	)
	} 
	// name, color, start, end, day, pos
	add_assignment("Álgebra y Geometría Analítica I (COM1)", 12, 15, 1, 0)
	add_assignment("Álgebra y Geometría Analítica I (COM1)", 11, 15, 3, 0)
	add_assignment("Álgebra y Geometría Analítica I (COM1)", 8, 11, 5, 0)
	add_assignment("Álgebra y Geometría Analítica II (COM1)", 5, 8, 1, 0)
	add_assignment("Álgebra y Geometría Analítica II (COM1)", 4, 8, 3, 0)
	add_assignment("Álgebra y Geometría Analítica II (COM1)", 1, 4, 5, 0)
	add_assignment("Análisis Matemático I (COM1)", 8, 12, 1, 0)
	add_assignment("Análisis Matemático I (COM1)", 8, 11, 3, 0)
	add_assignment("Análisis Matemático I (COM1)", 11, 15, 5, 0)
	add_assignment("Análisis Matemático II (COM1)", 1, 5, 1, 0)
	add_assignment("Análisis Matemático II (COM1)", 1, 4, 3, 0)
	add_assignment("Análisis Matemático II (COM1)", 4, 8, 5, 0)
	add_assignment("Programación II", f: blue, 1, 8, 2, 0)
	add_assignment("Programación II", f: blue, 1, 8, 4, 0)
})
