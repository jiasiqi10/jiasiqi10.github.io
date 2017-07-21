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


album = new Layer
	width: 120
	height: 120
	image: "images/album_01.png"
	x: 406
	y: 1600


article = new Layer
	width: 120
	height: 165
	image: "images/article.png"
	x: 228
	y: 1800

comment = new Layer
	width: 120
	height: 165
	image: "images/comment.png"
	x: 584
	y: 1800

live = new Layer
	width: 120
	height: 165
	image: "images/live.png"
	y: 1600
	x: 584


show = new Layer
	width: 120
	height: 165
	image: "images/show.png"
	y: 1800
	x: 50

sign = new Layer
	width: 120
	height: 165
	image: "images/sign.png"
	x: 406
	y: 1800

word = new Layer
	width: 120
	height: 165
	image: "images/word.png"
	x: 50
	y: 1600

shot = new Layer
	width: 120
	height: 165
	image: "images/shot.png"
	x: 228
	y:1600

background = new Layer
	superLayer: mainScreen
	height: 1334
	image: "images/background.png"
	width: 750
	z:-100
	backfaceVisible: true


bar= new Layer
	superLayer: mainScreen
	y: 1246
	height: 88
	width: 750
	backgroundColor: "transparent"
	backfaceVisible: true



layerA = new Layer
	width: 95
	height: 95
	opacity: 0
	y: 418
	x: 17
photo = new Layer
	superLayer: mainScreen
	height: 284
	image: "images/photo.png"
	width: 248
	opacity: 0
	x: 251
	y: 980

tip = new Layer
	superLayer: mainScreen
	height: 1334
	image: "images/tip.png"
	width: 750
	opacity: 0


add = new Layer
	superLayer: bar
	height: 80
	image: "images/add.png"
	width: 82
	x: Align.center()
	y: Align.center()



close = new Layer
	superLayer:mainScreen
	height: 32
	image: "images/close.png"
	width: 32
	x: Align.center()
	y: 1274
	rotationZ: 45
	opacity: 0

album_text = new Layer
	parent: mainScreen
	height: 24
	image: "images/album_text.png"
	width: 55
	y: 1740
	x: 439


	
bar.perspective=300

aword = new Animation word,
	y: 657
	options:
		time:0.3
		curve: Spring(damping: 0.8)
ashot = new Animation shot,
	y:657
	options:
		time:0.3
		curve: Spring(damping: 0.8)

aalbum_text= new Animation album_text,
	y:798
	options:
		time:0.3
		curve: Spring(damping: 0.8)


a1album = new Animation album,
	y:630
	options:
		time:0.3
	

a2album = new Animation album,
	y:657
	options:
		time:0.3

a3album = new Animation album,
	y:636
	options:
		time:0.3

a4album = new Animation album,
	y:657
	options:
		time:0.3

a5album = new Animation album,
	y:644
	options:
		time:0.3

a6album = new Animation album,
	y:657
	options:
		time:0.3




	
album = new Animation album,
	y:657
	options:
		time:0.3
		curve: Spring(damping: 0.8)


alive = new Animation live,
	y:657
	options:
		time:0.3
		curve: Spring(damping: 0.8)

ashow = new Animation show,
	y:889
	options:
		time:0.3
		curve: Spring(damping: 0.8)


		
article = new Animation article,
	y:889
	options:
		time:0.3
		curve: Spring(damping: 0.8)

asign = new Animation sign,
	y:889
	options:
		time:0.3
		curve: Spring(damping: 0.8)

comment= new Animation comment,
	y:889
	options:
		time:0.3
		curve: Spring(damping: 0.8)


all = ()->
	aword.start()
	Utils.delay 0.03,->
		ashot.start()
		Utils.delay 0.03,->
			album.start()
			Utils.delay 0.03,->
				alive.start()
				Utils.delay 0.03,->
					ashow.start()
					Utils.delay 0.03,->
						article.start()
						Utils.delay 0.03,->
							asign.start()
							Utils.delay 0.03,->
								comment.start()


		
a1 = new Animation add,
	rotationY: 180
	options: 
		time:0.5
		curve: Spring(mass:0.9)

a2 = a1.reverse()

		
a5=new Animation photo,
	y:965
	opacity: 1
	options:
		curve:Bezier.easeInOut
		time:0.5
a6 = a5.reverse()

a7 = new Animation tip,
	opacity:1
	options:
		time:0.2
		curve:Bezier.easeInOut

a8 = new Animation close,
	rotationZ:90
	opacity: 1
	options:
		time:0.2
		curve:Bezier.easeInOut

rword = aword.reverse()



layerA.onClick (event, layer) ->


	Utils.delay 1,->
		a1.start()
		a5.start()
		add.on "change:rotationY", ->
			if add.rotationY >= 90
				add.image = "images/camera.png"
	Utils.delay 5,->
					a6.start()
					a2.start()
					add.on "change:rotationY", ->
						if add.rotationY <= 90
							add.image = "images/add.png"

jump=()->
	a7.start()
	a8.start()
	aalbum_text.start()
	all()
	Utils.delay 1,->
		a1album.start()
		Utils.delay 0.3,->
			a2album.start()
			Utils.delay 0.2,->
				a3album.start()
				Utils.delay 0.2,->
					a4album.start()
					Utils.delay 0.2,->
						a5album.start()
						Utils.delay 0.2,->
							a6album.start()



add.on Events.Click,->
	jump()
	Utils.delay 2,->
		jump()	
		Utils.delay 2,->
			jump()	
			Utils.delay 2,->
				

reverseall = ()->
	aword.reverse
	start()
	Utils.delay 0.03,->
		ashot.start()
		Utils.delay 0.03,->
			album.start()
			Utils.delay 0.03,->
				alive.start()
				Utils.delay 0.03,->
					ashow.start()
					Utils.delay 0.03,->
						article.start()
						Utils.delay 0.03,->
							asign.start()
							Utils.delay 0.03,->
								comment.start()

add.on Events.Click,->
	rword.start()



			



					
		







