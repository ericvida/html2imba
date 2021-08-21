let state = {}
state.html = `<h1 style="preview">Paste HTML snippets from your favorite UI framework to convert it to Imba syntax.</h1>`
state.output = ``
extend tag Element
	get state
		return state
export default state