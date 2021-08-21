import prettyJs from 'pretty'
import toTabs from 'convert-to-tabs'
import {parse} from './html-parser'
const prettyOptions =
	ocd:true
export def compile argument
	let html = argument.replace(/`/, '')
	let cleaned = toTabs(prettyJs(html, prettyOptions)).replace(/\n{2,}/g, '')
	let compiled = parse(cleaned)
	return compiled
	