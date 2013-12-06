# Re-write of Inject method...
module Enumerable
	
	def super_inject(init_val, &block)
		memo = init_val
		self.each {|x| memo = yield(memo ,x)}
		memo
	end

end




