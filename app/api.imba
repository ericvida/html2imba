import state from './state'
import html from './html-sample.txt'
import {compile} from './html-compiler'

class html2imba
	def convert arg
		console.log arg
		state.output = compile(arg)

let api = new html2imba
extend tag Element
	get api
		return api
export default api