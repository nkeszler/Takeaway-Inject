class Takeaway
	
	DISHES = {pizza: 5.50, 
	   		  chinese: 6.00, 
	   		  burger: 8.00, 
	   		  hot_dog: 2.00, 
	   		  soda: 1.50}

	def dishes
		DISHES
	end

	def process_order(order, price)
		price == order_price(order) ? place_order(order) : raise
	end

	def order_price(order)
		order.inject(0){|sum,item| sum += DISHES[item[0]] * item[1]}
	end

	def place_order(order)
		# twilio not working...
		true
	end
end	