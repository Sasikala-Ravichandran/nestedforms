class Driver < ActiveRecord::Base
	has_one :license
	accepts_nested_attributes_for :license
end
