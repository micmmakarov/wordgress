class Definition < ActiveRecord::Base
  attr_accessible :text, :word_id

  belongs_to :word
  has_many :examples
  has_many :ratings

end
