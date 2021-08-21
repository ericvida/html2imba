import state from './state'
import './global-styles.imba'
import api from './api'
import 'tailwindcss/dist/tailwind.min.css'


let State = {}
State.input = ''
State.out
# import {Html2Imba} from './html-parser'
global css html
	ff:sans
# let imba_output = new Html2Imba state.html
# let string = imba_output.toString
tag app
	css self 
		max-width:1200px mx:auto my:2rem 
		d:flex ai:center
		fld:column p:1rem
	css textarea
		resize: vertical
		min-height: 8rem
		w:100% p:4 fs:md
		@placeholder
			c:indigo9 ta:center fw:bold
		bg:cooler1 c:indigo9 rd:md shadow: inset 0 .5rem 2rem 0.1rem cooler3
	css button
		p:1rem outline:none rd:lg bd:none
		bg:indigo5 
		bdb: 5px solid indigo9
		shadow:sm, md, lg
		w:14rem
		# mx:auto
		@hover
			bg: indigo6
		@active
			bg: indigo7
			bdt: 5px solid indigo9
			bdb: 0
			shadow:sm, md inset
		c:white fw:bolder fs:sm my:1rem
	css div.output
			c:cooler4 of:scroll py:2rem
			shadow:rose4 inset
			bg:cooler9 
			w:100%
			px:2rem
			min-height:10rem
			rd:lg
			pb:3rem
			fs:sm
	def render
		<self>
			<h1[ff:sans-serif fs:6xl mb:3rem c:indigo6 ff:sans fw:bold]> "HTML 👉 IMBA"
			<textarea bind=state.html placeholder="Paste HTML snippets from your favorite UI framework to convert it to Imba syntax.">
			<button @click=api.convert(state.html)> "Convert"
			<div.output>
				<pre>
					<code> state.output
			<app-footer>
tag app-footer
	css self py:2rem
	css a
		td:none 
		c: indigo5
		pb:3px
		px:.2rem
		@hover 
			bdb: medium solid indigo1
	def render
		<self>
			"made by " 
			<a href="https://github.com/ericvida/" target="_blank"> "@ericvida "
			"with "
			<a href="https://imba.io" target="_blank"> "Imba"
			
imba.mount <app>