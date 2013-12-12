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

  # Nicki, this will be a badge if you write more tests and fix the implementation

  # test that it works as expected for an array of numbers
  # and of strings (or something else)
  # if the initial value is given
  # and if it isn't
  # Finally, test that the method doesn't modify the array it's called on

end