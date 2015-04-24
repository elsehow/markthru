$ = require 'jquery'
_ = require 'lodash'
Kefir = require 'kefir'
markdown = require('markdown').markdown


getButton = (id, className, text) ->
	_.template('<button class = "<%= className %>" id = "<%= id %>"> <%= text %> </button>')(
		id: id
		className: className 
		text: text)

getPrevButton = (index) -> getButton(index, 'prevButton', 'Previous')
getNextButton = (index) -> getButton(index, 'nextButton', 'Next')

hideThisAndShow = (thisId, diff) -> 
			$('#'+thisId).hide()
			$('#'+(thisId+diff)).show()

getPrevNextButtons = (index) ->
	'<div class="prevNextButtons">' + getPrevButton(index) + getNextButton(index) + '</div>'

init = ->

	# turn body from markdown into html
	md = $('#content').html()
	$('#content').html(markdown.toHTML(md))

	#
	# modify HTML
	#
	$('h1').each((index) -> 
		# turn each block (from one h1 to the next h1) into a div
		$(this).nextUntil('h1').andSelf()
			.wrapAll('<div class="block" id="'+index+'"></div>')
		$thisDiv = $("#"+index)
		# add previous / next buttons to each div
		$thisDiv.append(getPrevNextButtons(index))
		# hide the div
		$thisDiv.hide())
	# remove first previous button
	$('.prevButton').first().remove()
	# and final next button
	$('.nextButton').last().remove()
	# show first div
	$("#0").show()

	#
	# handle user events
	#
	$nextButtons = $('.nextButton')
	$prevButtons = $('.prevButton')
	# on next button, hide this div + show div+1
	nextButtonClicks = Kefir.fromEvent($nextButtons, 'click')
		.onValue((v) -> hideThisAndShow(Number(v.target.id), 1))
	# on prev button, hide this div + show div-1
	prevButtonClicks = Kefir.fromEvent($prevButtons, 'click')
		.onValue((v) -> hideThisAndShow(Number(v.target.id), -1))

	console.log 'main app launched ok'

# launch the app
$(document).ready(() ->
	init() )




















