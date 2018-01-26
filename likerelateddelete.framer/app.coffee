
# 	curve: Bezier.linear




scroll = new ScrollComponent
scroll.width = Screen.width
scroll.height = Screen.height

scroll.parent= art
scroll.scrollHorizontal = false
related.parent = scroll.content
scroll.parent = art
tittle.placeBefore(scroll)
bar.parent=art


list1.parent = scroll.content
list2.parent = scroll.content
scroll.contentInset =
	bottom: 40

# print list2.y
layer = new Layer
	backgroundColor: null
	height: 0

list2.states.a =
	y: 396 + 170
	options:
		time: 0.2
		curve: Bezier.easeInOut
	
related.states.a =
	opacity: 0
	options:
		time: 0.2
		curve: Bezier.easeInOut


scroll.onScrollStart ->
	btn.ignoreEvents = true

scroll.onScrollEnd ->
	btn.ignoreEvents = false
btn.onClick ->
	Utils.delay 0.15, ->
		list2.stateCycle("a")
		layer.parent = scroll.content
		Utils.delay 0, ->
			related.stateCycle("a")
			


	

	
