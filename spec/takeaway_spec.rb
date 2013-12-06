require_relative "../lib/takeaway"

describe Takeaway do

	Mail.defaults do
		delivery_method :test
	end

	include Mail::Matchers

	let(:takeaway){Takeaway.new}
	let(:order){ {pizza: 2, soda: 3, chinese: 1} }

	it "should have a hash of dishes w prices" do 
		expect(takeaway.dishes).to be_kind_of(Hash)
	end

	it "should have a method to process orders" do 
		should respond_to(:process_order)
	end

	it "should determine order price" do
		expect(takeaway.order_price(order)).to eq(21.50)
	end

	it "process order should throw error for wrong price" do 
		expect(lambda {takeaway.process_order(order, 22.00)}).to raise_error(RuntimeError)
	end

	it "should place an order if the price is right" do
		takeaway.process_order(order, 21.50)
		expect(takeaway.place_order(order)).to be_true
	end

	it "should send an email if order is being delivered" do
		takeaway.place_order(order) 
		should have_sent_email.to('nkeszler10@gmail.com')
	end
end