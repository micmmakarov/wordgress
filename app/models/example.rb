class Example < ActiveRecord::Base
  attr_accessible :definition_id, :text

  belongs_to :definition
#  belongs_to :word, :through => :definitions

end
