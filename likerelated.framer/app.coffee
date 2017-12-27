Framer.Defaults.Animation =
	time: .2
	curve: Bezier.easeInOut

	
# 	curve: Bezier.linear




scroll = new ScrollComponent
scroll.width = Screen.width
scroll.height = Screen.height


scroll.scrollHorizontal = false
related.parent = scroll.content
scroll.parent = art
title.placeBefore(scroll)
bar.placeBefore(scroll)
list1.parent = scroll.content
list2.parent = scroll.content
scroll.contentInset =
	bottom: -300

# print list2.y
layer = new Layer
	backgroundColor: null
	height: 2580

list2.states.a =
	y: 396 + 953
	
related.states.a =
	y: 395
	opacity: 1

text_17.states.a =
	opacity: 0
	time:0.1

text_18.states.a =
	opacity: 1
	time:0.1

scroll.onScrollStart ->
	btn.ignoreEvents = true

scroll.onScrollEnd ->
	btn.ignoreEvents = false
btn.onClick ->
	Utils.delay 0.5, ->
		list2.stateCycle("a")
		layer.parent = scroll.content
		Utils.delay 0.1, ->
			related.stateCycle("a")

btn.onClick ->
	Like1.play()
	text_17.stateCycle("a")
	text_18.stateCycle("a")	
BodymovinLayer1 = require 'Bodymovin1'
BodymovinLayer2 = require 'Bodymovin2'
BodymovinLayer3 = require 'Bodymovin3'
BodymovinLayer4 = require 'Bodymovin4'



Like1 = new BodymovinLayer1
	superLayer: skt.FeedContent
	parent: skt
	width:50
	autoplay: false
	looping: false
	

	
