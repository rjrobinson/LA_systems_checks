require_relative 'bounding_box'

class BoundingArea

	attr_reader :box_array

	def initialize(box_array)
		@box_array = box_array
	end


def contains_point?(x,y)
	result = nil
	if box_array.length == 0
		return false
	elsif box_array.each do |box|
		result = box.contains_point?(x,y)
			if result == true
				return true
		end
	end
	return result 
	end
end

end # class end

# test1 = BoundingArea.new([BoundingBox.new(5,5,5,5)])


# test1.contains_point?(1,2)