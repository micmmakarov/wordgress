class Voc < ActiveRecord::Base
  attr_accessible :user_id, :word_id

  belongs_to :user
  belongs_to :word

end
