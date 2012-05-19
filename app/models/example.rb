class Example < ActiveRecord::Base
  attr_accessible :definition_id, :text

  has_many :ratings
  belongs_to :definition
#  belongs_to :word, :through => :definitions

end
