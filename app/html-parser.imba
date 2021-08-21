
import {tokenize} from './html-lexer'
window.log = console.log.bind console
window.logr = console.error.bind console
window.logy = console.warn.bind console
export def parse argument
	let parsed = ""
	let tokenized = tokenize(argument)
	let prev5
	let prev4
	let prev3
	let prev2
	for token in tokenized
		let current = 
			name: token[0]
			val: token[1]
		let prev =
			name: token[2][0]
			val: token[2][1]
		let next =
			name: token[3][0]
			val: token[3][1]
		# logy prev
		# log current
		# logr next
		switch current.name
			when "attributeName" # "class" 						# DONE: remove class attr name
				if current.val is 'class' or current.val is 'style' then parsed+='' else parsed+=current.val
			when "attributeAssign" # "=" 						# DONE: remove = sign from class
				if prev.val is 'class' or prev.val is 'style' then parsed+='' else parsed+=current.val
			when "attributeValueStart" # "\"" 					# DONE: Remove open quote from class
				# logr current,prev,prev2,prev3
				if prev3.val is 'class' or prev3.val is 'style' then parsed+='' else parsed+=current.val
			when "attributeValueData" # "size-choice-3-lable"
				if parsed[-1] is ' ' 							# DONE: make classes compatible with imba, dots and curly braces when needed
					if prev4.val is 'class'
						let res = ''
						let classArr = current.val.split(' ')
						for item in classArr
							if /\d\.\d/.test(item) # if has class has decimal like "py-0.5"
								res += ".\{'" + item + "'\}"
							elif /:/g.test(item) # NOTE: if has colon
								res += ".\{'" + item + "'\}"
							elif /^\W/g.test(item) # NOTE: if starts with non-letter character
								res += ".\{'" + item + "'\}"
							else
								res += ".{item}"
						parsed+=res
					if prev4.val is 'style'
						parsed+= "[{current.val}]"
				else
					parsed+=current.val
			when "attributeValueEnd" # "\"" 					# DONE: Remove end quote from class attributes
				if prev5.val is "class" or prev5.val is 'style' then parsed+="" else parsed+='"'
			when "tagSpace" # // whitespace and/ or slashes within tags
				parsed+=current.val
			when "commentStart" # '<!--'
				# parsed+=current.val.replace('<!--','# ')
				continue
			when "commentStartBogus" # comment content
				# parsed+=current.val.replace('<!--','# ')
				continue
			when "commentData" # turn comments into single sline comments for easy parsing.
				continue
			when "commentEnd" # '-->' 					# DONE
				continue
			when "commentEndBogus" # '-->' 				# DONE
				continue
			when "startTagStart" # "<----" 				# DONE
				parsed+=current.val 					
			when "endTagStart" # ">"					# DONE
				continue
			when "tagEnd" # "</---" 					# DONE
				if prev.name isnt 'endTagStart'
					parsed+=current.val
			when "tagEndClose" # ">"
				parsed+=current.val
			when "charRefDecimal" 
				parsed+=current.val
			when "charRefHex"
				parsed+=current.val
			when "charRefNamed"
				parsed+=current.val
			when "unescaped"
				parsed+=current.val
			# DONE: PUT QUOTES ON STRINGS
			when "data"
				# if /\`\`\`/.test(current.val)
				# 	parsed+="###"
				# 	parsed+="current.val"
				if prev.val is ' ' and next.name is 'newline'
					parsed+= "{current.val}\""  # DOES: if last word of string
				
				elif prev.val is ' ' and next.name isnt 'newline'
					if next.name is 'endTagStart'
						parsed+= "{current.val}\"" # DOES: if middle word of string
					else
						if prev2.val is '>'
							parsed+= "\"{current.val}" # DOES: if middle word of string
						else
							parsed+= "{current.val}" # DOES: if middle word of string
				
				elif /\t{1,}/.test(prev.val) # DOES: if word is on new line
					if next.val is '\n' # DOES: if first and last word
						parsed+= "\"{current.val}\""
					else # DOES: if first word of string
						parsed+= "\"{current.val}"
				
				elif next.name is 'endTagStart'
					parsed+= " \"{current.val}\""
				
				elif next.val is ' ' # if not last word
					if prev.val is '>' # DOES: if word is after tag
						parsed+= " \"{current.val}"
					if /;/.test(prev.val) # DOES: keeps unspaced letters unspaced
						parsed+= "{current.val}"
					# else # DOES: if last word of string
					# 	parsed+= " \"{current.val}"
				
				elif next.val is '\n'
					parsed+= "{current.val}\""
					
				else # DOES: if next value isn't space
					parsed+= "{current.val}"
					# logr next.val
					# parsed+=current.val
					# logr next.name
				# if prev.val is '>'
				# 	current.val
				# 	parsed+= " \"{current.val}"
				# if prev.val is ' ', and prev2.val is '>'
				# 	parsed+= "\"{current.val}"
				# parsed+="{current.val}\""
			when "newline" # "\n"
				parsed+=current.val
			when "rcdata"
				parsed+=current.val
			when "rawtext"
				parsed+=current.val
			when "plaintext"
				parsed+=current.val
			when "space" # "\t*"
				parsed+=current.val
		prev5 = prev4
		prev4 = prev3
		prev3 = prev2
		prev2 = prev
	log parsed
	return parsed
