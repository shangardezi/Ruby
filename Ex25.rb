module Ex25

	# This function will break up word for us
    def Ex25.break_words(stuff)	
   	 	words = stuff.split(' ')
     	return words 	
    end
    
    # Sorts the words.
    def Ex25.sort_words(words)
    	return words.sort
    end
    
    # Prints the first word after shifting it off
    def Ex25.print_first_word(words)
    	word = words.shift
    	puts word
    end 
    
    # Prints the last word after popping it off
    def Ex25.print_last_word(words)
    	word = words.pop
    	puts word
    end
    
      
	# Takes in a full sentence and returns the sorted words.
    def Ex25.sort_sentence(sentence)
    	words = Ex25.break_words(sentence)
    	return Ex25.sort_words(words)
    end
    
    # Prints the first and last word of a sentence
    def Ex25.print_first_and_last_sentence(sentence)
    	words = Ex25.break_words(sentence)
    	first_word = Ex25.print_first_word(words)
    	last_word = Ex25.print_last_word(words)
    end
    
    # Sorts the words then prints the first and last one.
    def Ex25.print_first_and_last_sorted(sentence)
   		words = Ex25.sort_sentence(sentence)
    	Ex25.print_first_word(words)
   		Ex25.print_last_word(words)
    end
    
end