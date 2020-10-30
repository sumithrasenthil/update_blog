class Article < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  validates :body,
            :presence => {:message => " can't be blank." }

  validates :title,
  :presence => {:message => " can't be blank." }
  
end
