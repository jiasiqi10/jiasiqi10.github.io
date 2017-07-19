mainScreen = new Layer
mainScreen.clip = true
mainScreen.height = 1334
mainScreen.width = 750
screenWidth = screen.width * window.devicePixelRatio
screenHeight = screen.height * window.devicePixelRatio

if Utils.isPhone()
	Framer.Device.fullScreen = true
	if screenWidth > 750
		mainScreen.scale = screenWidth/900
		mainScreen.y = (screenHeight - 64*devicePixelRatio - mainScreen.height)/2
	else
		mainScreen.y = (screenHeight - mainScreen.height)/2
	mainScreen.x = (screenWidth - mainScreen.width)/2

Screen.backgroundColor = "#EEE"

Screen.perspective = 0


background = new Layer
	superLayer: mainScreen
	height: 1334
	image: "images/background.png"
	width: 750
	z:-100
	backfaceVisible: true


bg= new Layer
	superLayer: mainScreen
	y: 1246
	height: 88
	width: 750
	backgroundColor: "transparent"
	backfaceVisible: true



photo = new Layer
	superLayer: mainScreen
	height: 196
	image: "images/photo.png"
	width: 176
	opacity: 0
	x: 286
	y: 1060


add = new Layer
	superLayer: bg
	height: 80
	image: "images/add.png"
	width: 82
	x: Align.center()
	y: Align.center()
	
	
bg.perspective=300

a1 = new Animation add,
	rotationY: 180
	options: 
		time:0.6
		curve: Spring(mass: 0.5)

a2 = a1.reverse()

		
a5=new Animation photo,
	y:1045
	opacity: 1
	options:
		curve:Bezier.easeInOut
		time:0.5
a6 = a5.reverse()
 
Utils.delay 1,->
	a1.start()
	a5.start()
	add.on "change:rotationY", ->
		if add.rotationY >= 90
			add.image = "images/camera.png"
	Utils.delay 3,->
				a6.start()
				a2.start()
				add.on "change:rotationY", ->
					if add.rotationY <= 90
						add.image = "images/add.png"
		


					
		






