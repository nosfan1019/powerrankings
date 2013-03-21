class Tester < ActiveRecord::Base
	attr_protected :admin

	has_many :teams
end
