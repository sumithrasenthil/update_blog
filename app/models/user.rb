class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :articles, dependent: :destroy
  has_many :likes    , dependent: :destroy
  
  validates :firstname,
          :presence => {:message => " can't be blank." }

  validates :lastname,
  :presence => {:message => " can't be blank." }
  
  def display_name
    self.email
  end

end
