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
	top: -10


# Add layers
for i in [1]
	layer = new Layer
		image: "images/mid.png"
		parent: scroll.content
		name: "row #{i}"
		width: 750
		height: 1791
		y: 70* i
		backgroundColor: "#FFF"

tip2 = new Layer
	parent: scroll.content
	image: "images/tip2.png"
	width: 750	
	height: 70
	y: Align.top(70)
	
	


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
	width: 750
	height: 70
	opacity: 0
	y: 58

navBar = new Layer
	image: "images/top.png"
	parent: scroll
	backgroundColor: "#50F"
	width: scroll.width 
	height: 132

scroll.content.on Events.DragEnd, ->
	if scroll.content.y > 300
		tip.animate
			opacity: 1.00
			y: 132
			options:
				time: 0.5
				delay:0.3
				curve: Bezier.easeInOut

	

