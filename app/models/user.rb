class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :vocs
  has_many :words, :through => :vocs


  def remember?(word)
    v = self.vocs.find_by_word_id(word.id)
    "Ya" if v
  end

  def remember!(word)
    self.vocs.create!(word_id:word.id)
  end
  def forget!(word)
    self.vocs.find_by_word_id(word.id).destroy
  end

  def toggle(word)
    if remember?(word)
      self.forget!(word)
    else
      self.remember!(word)
    end
  end

end
