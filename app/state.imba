let state = {}
state.html = `<h1 class="preview">Paste HTML snippets from your favorite UI framework to convert it to Imba syntax.</h1>`
state.input = `<h1 class="preview">Paste HTML snippets from your favorite UI framework to convert it to Imba syntax.</h1>`
state.output = `<h1 .preview> "Paste HTML snippets from your favorite UI framework to convert it to Imba syntax."`
extend tag Element
	get state
		return state
export default state