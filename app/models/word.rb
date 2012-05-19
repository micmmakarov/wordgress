class Word < ActiveRecord::Base
  attr_accessible :word

  has_many :ratings
  has_many :definitions
  has_many :ratings
  has_many :examples, :through => :definitions
  #has_many :vocs

end
