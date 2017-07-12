# Import file "Sample File" (sizes and positions are scaled 1:2)
# figma = Framer.Importer.load("imported/Sample File@2x")
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
	backgroundColor: "#f2f2f2"
	scrollHorizontal: false


# Add top and bottom inset
scroll.contentInset =
	top: 128

navBar = new Layer
	image: "images/top.png"
	parent: scroll
	backgroundColor: "#50F"
	width: scroll.width 
	height: 132

# Add layers
for i in [1]
	layer = new Layer
		image: "images/mid.png"
		parent: scroll.content
		name: "row #{i}"
		width: 750
		height: 1721
		y: 0* i
		backgroundColor: "#FFF"

bottom = new Layer
	image: "images/bottum.png"
	parent: scroll
	backgroundColor: "#50F"
	width: scroll.width 
	height: 87
	y: 1247

tip = new Layer
	image: "images/tip.png"
	parent: scroll
	y: 131
	width: 750
	height: 70
	opacity: 0

scroll.content.on Events.DragEnd, ->
	if scroll.content.y > 200
		tip.animate
			opacity: 1.00
			options:
				time: 1
				curve: Bezier.easeInOut


close = new Layer
	parent: tip
	width: 45
	opacity: 0
	height: 39
	x: 689

close.onClick (event, close) ->
	tip.animate
		opacity:0
		options: 
			time:0.2
			curve: Bezier.easeInOut	


	
	

