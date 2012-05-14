class Rating < ActiveRecord::Base
  attr_accessible :definition_id, :example_id, :user_id, :value, :word_id

  belongs_to :user


end
