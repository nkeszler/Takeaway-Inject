require_relative 'inject'
require_relative '../lib/email'

class Takeaway
	
	include Email

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
		# STD Inject => order.inject(0){|sum,item| sum += DISHES[item[0]] * item[1]}
		# Super Inject :
		block = lambda {|sum,item| sum += DISHES[item[0]] * item[1]}
		order.super_inject(0,&block)
	end

	def place_order(order)
		create_email
	end

end	