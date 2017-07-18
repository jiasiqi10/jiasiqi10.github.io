Screen.backgroundColor = "#EEE"

Screen.perspective = 0

background = new Layer
	height: 1334
	image: "images/background.png"
	width: 750
	z:-15


bg= new Layer
	y: 1246
	height: 88
	width: 750
	backgroundColor: "transparent"

	
camera = new Layer
	superLayer: bg
	height: 80
	image: "images/camera.png"
	width: 82
	x: Align.center()
	y: Align.center()

	rotationY:-90


photo = new Layer
	height: 202
	image: "images/photo.png"
	width: 178
	opacity: 0
	x: 286
	y: 1050


add = new Layer
	superLayer: bg
	height: 80
	image: "images/add.png"
	width: 82
	x: Align.center()
	y: Align.center()


bg.perspective=200

a1 = new Animation add,
	rotationY: 90
	options: 
		time:0.15
a2=a1.reverse()

a3 = new Animation camera,
	rotationY: 0
	options: 
		time:0.15

a4 = a3.reverse()
a5=new Animation photo,
	y:1035
	opacity: 1
	options:
		curve:Bezier.easeInOut
		time:0.3
a6=a5.reverse()

Utils.delay 1,->
	a1.start()
	a5.start()
	Utils.delay 0.15,->
		a3.start()
		Utils.delay 5,->
			a4.start()
			a6.start()
			Utils.delay 0.15,->
				a2.start()	


					
		






