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
	bottom: -500
Framer.Defaults.Animation =
	time: 0.15
	curve: Bezier.easeInOut





body = new Layer
	parent: scroll.content
	width: 750
	height: 1795
	image: "images/body.png"
	y: 70 

dialog = new Layer
	height: 354
	image: "images/dialog.png"
	width: 750
	parent: scroll.content
	y: 1015
	opacity: 0
	scale: 0.2
	originX: 0.2
	originY: 0
dialog.placeBefore(scroll.body)


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
	clip: false


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
	
layerB = new Layer
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

layerB.states =
	show:
		opacity:1

			
# 	dialog.y = Utils.modulate(event.y,[-1000,1000],[-1000,1000],true)
	
btn.onClick (event,layer)->
	dialog.stateCycle("show")
	layerA.stateCycle("show")
	layerB.stateCycle("show")


scroll.onClick (event,layer)->
	dialog.stateCycle("default")
	layerA.stateCycle("default")
	layerB.stateCycle("default")








