class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all 

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all 
           
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_many :articles, dependent: :destroy
  has_many :likes    , dependent: :destroy
  
  validates :firstname,
          :presence => {:message => " can't be blank." }
          
  validates :lastname,
  :presence => {:message => " can't be blank." }
  
  
  

  def fullname
    firstname + " " +lastname
  end

  def display_email
    self.email
  end

  def is_author
    article=Article.where("user_id=?",self.id)
    # article=self.articles
    if article.count >0
      true
    else
      false
    end
  end
end
