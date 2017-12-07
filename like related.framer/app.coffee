Framer.Defaults.Animation =
	time: .2
	curve: Bezier.easeOut
	
# 	curve: Bezier.linear




scroll = new ScrollComponent
scroll.width = Screen.width
scroll.height = Screen.height


scroll.scrollHorizontal = false
scroll.parent = art
title.placeBefore(scroll)
bar.placeBefore(scroll)
list1.parent = scroll.content
list2.parent = scroll.content
related.parent = scroll.content
scroll.contentInset =
	bottom: -32

# print list2.y
layer = new Layer
	backgroundColor: null
	height: 2325

list2.states.a =
	y: 396 + 965
	
related.states.a =
	x: 0
	opacity: 1

text_17.states.a =
	opacity: 0
	time:0

text_18.states.a =
	opacity: 1
	time:0

scroll.onScrollStart ->
	btn.ignoreEvents = true

scroll.onScrollEnd ->
	btn.ignoreEvents = false
btn.onClick ->
	list2.stateCycle("a")
	text_17.stateCycle("a")
	text_18.stateCycle("a")
	layer.parent = scroll.content
	Utils.delay 0.1, ->
		related.stateCycle("a")

btn.onClick ->
	Like1.play()	
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
	

	
