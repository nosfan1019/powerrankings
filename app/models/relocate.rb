class Relocate < ActiveRecord::Base
  	attr_protected :admin

  	belongs_to :team


end
