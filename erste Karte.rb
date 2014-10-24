def nichtVerstanden
	puts "Das habe ich nicht verstanden. Wo willst du hin?"
end

def leseAntwort(question)
	puts question
	answer = gets
	return answer.strip!
end

def gehen(answer,state)
	case answer
	when "see"
		return :see
	when "fluss"
		return  :fluss
	when "wald"
		return :wald
	when "haus" 
		return :haus
	when "oeffne"
		weitergehen (answer,state)
		#if state == :haus then
		#	puts ("Du öffnest den Briefkasten.")
		#	return :haus
		#else ("Du must am Haus sein um denn Briefkasten öffnen zu können.")	
		#end
	when "steg"
		weitergehen (answer,state)
		# if state == :see then
		#	puts ("Du befindest dich aufm Steg")		
		#	return :see
		#else ("Du kannst nur von dem See aus auf den Steg.")
		#end	
	when "brücke"
		weitergehen (answer,state)
		 #if state == :fluss then
		#	puts ("Du befindest dich auf der Brücke. Auf der anderen Seite siehst du eine schöne Wiese.")
		#	if answer == "wiese" then
		#		leseAntwort ("Du gehst auf über die Brücke auf die Wiese.")
		#		if answer == :brücke then 
		#			return :brücke
		#		else puts ("Das geht nicht.")
		#		end
		#	else return :fluss
		#	end
		#else ("Die Brücke befindet sich nur am Fluss.")
		#end	
	else 
		nichtVerstanden()
	end
end


def weitergehen(answer,state)
	case answer
	when "oeffne"
		if state == :haus then
			puts ("Du öffnest den Briefkasten.")
			return :haus
 		else 
 			puts ("Was soll ich öffnen?")	
 		end
	when "steg"
		if state == :see then
			puts ("Du befindest dich aufm Steg")		
			return :see
 		else ("Du kannst nur von dem See aus auf den Steg.")
 		end	
	when "brücke"
 		if state == :fluss then
 			puts ("Du befindest dich auf der Brücke. Auf der anderen Seite siehst du eine schöne Wiese.")
 			if answer == "wiese" then
 				leseAntwort ("Du gehst auf über die Brücke auf die Wiese.")
 				if answer == :brücke then 
 					return :brücke
 				else
 					puts ("Das geht nicht.")
 				end
 			else return :fluss
 			end
 		else 
 			puts ("Die Brücke befindet sich nur am Fluss.")
 		end	
	else
		nichtVerstanden()
	end
	
end

puts ("Willkommen in meiner kleinen Welt.")

state = :haus

until false
	case state
	
	when :haus
 		answer = leseAntwort("Du bist vorm Haus. Neben dem Haus steht ein Briefkasten.")
 		state = gehen(answer, state)
 	
 	when :fluss
 		answer = leseAntwort("Du bist am Fluss. Flussaufwärts ist eine Brücke.")
 		state = gehen(answer,state)
 		
 	when :wald
 		answer = leseAntwort("Du bist am Waldrand.")
 		state = gehen(answer,state)
 		
 	when :see
 		answer=leseAntwort("Dieser See hat einen schönene Steg.")
 		state = gehen(answer,state)
 		
 	else
 		puts "Du hast dich verlaufen, schnell zurück zum Haus"
 		state = :haus
 	end
end



#puts "Du stehst vor einem Haus."
#answer = gets
#
#if answer.start_with? ("schaue") then
#	puts "Du stehs vorm Haus...."
#else 
#	nichtVerstanden()
#end
#answer = gets
#
#if answer.start_with? ("osten") then
#	puts "Du befindest dich am Fluss. Möchtest du auf die Brücke gehen?"
#	answer = gets
#	if answer.start_with? ("ja") then
#		puts "Du stehst auf der Brücke."
#		puts ("Was jetzt?")
#	end
#end
#answer = gets
#
#if answer.start_with? ("suden") then
#	puts "Du befindest dich am Waldrand. Möchtest du zum See gehen."
#	answer = gets
#	if  answer.start_with? ("ja") then
#		puts "Nun stest du am See. Dort ist ein Steg."
#		if answer.start_with? ("Steg") then
#			puts "Jetzt stehst du auf dem Steg."
#		end	
#	end
#	else puts "wohin dann?"
#		answer = gets
#end
#answer = gets
#
#if answer.start_with? ("norden") then
#	puts "Du befindest dich vorm Laden. Möchtest du hineingenen?"
#	answer = gets
#	if answer.start_with? ("ja")then
#		puts "Du befindast dich im Laden."
#	end	
#end
#answer = gets
#
#if answer.start_with? ("Haus") then
#	puts "Du befindest dich wieder vorm Haus."
#end
#answer = gets