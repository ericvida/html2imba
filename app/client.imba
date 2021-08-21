import state from './state'
import api from './api'
import './global-styles.imba'
import './preflight.css'
import ClipboardJS from 'clipboard'
let clip = new ClipboardJS('.clip')
console.log clip
# import {Html2Imba} from './html-parser'
global css html
	* box-sizing:border-box
	ff:sans
# let imba_output = new Html2Imba state.html
# let string = imba_output.toString
tag app
	css header 
		px: 2rem
		h:80px  c:white d:flex ai:center jc:space-between fs:xx-large ff:sans-serif
		bg:white
		us:none
		cursor:pointer
		bdb: thin solid cooler2
		h1
			fw:800 ff:sans-serif @hover:indigo6 @active: indigo7
			h:80px
			jc:center d:flex ai:center
			c:indigo6 @hover:indigo5
		button.clip
			fs:xl ff:sans-serif fw:bold
			d:flex
			ai:center
			px:10px
			rd:md 
			h:40px
			c:white
			bg:indigo6
			shadow:sm
			# bdb:cooler3 5px solid
			@hover
				bg:indigo6/90
			@active
				bg:indigo6
			.text pr:8px 
			svg.icon size:25px
	css main 
		mx:auto
		d:flex fld:row
		w:100%
	css .code
		w:100%
		min-height: calc(100vh - 130px)
		flg:1
		ofy:scroll
		ofx:scroll
		p:2rem
		ff:monospace
		fs:xl
		&.input
			outline:none
			@placeholder
				c:cooler4
		&.output
			bg:cooler1 c:cooler7
	def render
		<self>
			<header>
				<h1 route-to="/#"> "HTML 👉 IMBA"
				<button.clip data-clipboard-target='#clipboard-target'> 
					<span.text> "copy output"
					<svg.icon xmlns="http://www.w3.org/2000/svg" .h-5.w-5 viewBox="0 0 20 20" fill="currentColor">
						<path d="M8 2a1 1 0 000 2h2a1 1 0 100-2H8z" />
						<path d="M3 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v6h-4.586l1.293-1.293a1 1 0 00-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L10.414 13H15v3a2 2 0 01-2 2H5a2 2 0 01-2-2V5zM15 11h2a1 1 0 110 2h-2v-2z" />
			<main>
				<textarea.code.input @keyup=api.convert(state.input) bind=state.input placeholder="Paste HTML snippets from your favorite UI framework to convert it to Imba syntax.">
				<div.code.output>
					<pre#clipboard-target>
						state.output
			<footer>
				<app-footer>
tag app-footer
	css self
		bg:indigo5
		# d:block
		h:50px
		d:flex
		ai:center
		jc:center
		# pos:fixed 
		w:100% 
		b:0
		c:white
		us:none
	css a
		px:.2rem
		c@hover:indigo2
	def render
		<self>
			"made by " 
			<a href="https://github.com/ericvida/" target="_blank"> "@ericvida "
			"with "
			<a href="https://imba.io" target="_blank"> "Imba"
			
imba.mount <app>