# NOTE: DOCUMENTATION: https://github.com/alwinb/tiny-html-lexer
# import html from './html-sample.txt'
import tinyhtml from 'tiny-html-lexer'
export def tokenize argument
	let chunks = tinyhtml.chunks(argument)
	let tokenizedHTML = []
	let history = 
		one: ["", ""]
		two: [undefined]
	for item, i of chunks
		let type = item[0]
		let data = item[1]
		let now = [type, data]
		let chunk = [...history.one, history.two, now]
		history.two = history.one
		history.one = now
		tokenizedHTML.push chunk
	tokenizedHTML.shift!
	# log tokenizedHTML
	return tokenizedHTML