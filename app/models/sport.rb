class Sport < ActiveRecord::Base
  attr_accessible :sport

  has_many :rankings
  has_many :teams, :through => :rankings

  validates :sport, :presence => true


end
