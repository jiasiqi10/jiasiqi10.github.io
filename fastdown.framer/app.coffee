# To start, simply add and style the ScrollComponent.
# In this example, we first add a nav bar layer.
# Then we create 10 layers and add them to the content layer, which is naturally scrollable.
# Learn more here: framer.com/getstarted/guide/#scroll

# Create ScrollComponent
scroll = new ScrollComponent
	width: 750
	height: 1334
	x: Align.center
	y: Align.center
	backgroundColor: "#E5E5E5"
	scrollHorizontal: false
# Add top and bottom inset
scroll.contentInset =
	top: 120
	bottom: -480
	
Framer.Defaults.Animation =
	time: 0.15
	curve: Bezier.easeInOut



body = new Layer
	parent: scroll.content
	width: 750
	height: 1795
	image: "images/body.png"
	y: 70 



head = new Layer
	height: 1334
	image: "images/head.png"
	width: 750
	parent: scroll
	width: scroll.width 

btn = new Layer
	parent: scroll.content
	opacity: 0
	y: 975
	height: 68
	width: 262




dialog = new Layer
	height: 354
	image: "images/dialog2.png"
	width: 750
	parent: scroll.content
	y: 664
	scale: 0.2
	opacity: 0
	originX: 0.164
	originY: 0.9
dialog.placeBefore(scroll.body)





layerA = new Layer
	parent: scroll.content
	opacity: 0
	width: 750
	height: 2334
	y: 92
	backgroundColor: "rgba(0,0,0,0.1)"
	
layerB = new Layer
	opacity: 0
	width: 750
	height: 213
	backgroundColor: "rgba(0,0,0,0.1)"
	
layerC = new Layer
	opacity:0
	width: 750
	height: 89
	backgroundColor: "rgba(0,0,0,0.1)"
	y: 1245
	
layerA.placeBehind(dialog)

layerA.states =
	show:
		opacity:1

dialog.states = 
	show:
		opacity: 1
		scale: 1
	close:
		opacity: 0
		scale: 0


layerB.states =
	show:
		opacity:1

layerC.states =
	show:
		opacity:1

			
# 	dialog.y = Utils.modulate(event.y,[-1000,1000],[-1000,1000],true)

dialog.stateSwitch("close")

# scroll.on "change:Y",->
# 	if scroll.y < 30
# 		dialog.rotation = 180
# 		print 1
btn.onClick (event,layer)->
# 	if(btn.y>900)	
	dialog.stateCycle("show")
	layerA.stateCycle("show")
	layerB.stateCycle("show")
	layerC.stateCycle("show")


scroll.onClick (event,layer)->
	dialog.stateCycle("close")
	layerA.stateCycle("default")
	layerB.stateCycle("default")
	layerC.stateCycle("default")





