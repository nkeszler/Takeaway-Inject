require_relative '../lib/inject'


describe Array do 

	let(:array){Array.new}

	it "should respond to super_inject" do
		should respond_to(:super_inject)
	end

	it "should work the same as inject" do 
		block = lambda {|array, val| array << val}
		expect(array.super_inject([],&block)).to eq(array.inject([]){block})
	end

end