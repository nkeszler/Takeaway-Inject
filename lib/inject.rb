# Re-write of Inject method...
module Enumerable
	
  # the argument should be optional
  # also, why declare a block if you aren't using this variable?
	def super_inject(init_val, &block)
		memo = init_val
		self.each {|x| memo = yield(memo ,x)}
		memo
	end

end




