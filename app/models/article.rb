class Article < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :likes , dependent: :destroy
  validates :body,
            :presence => {:message => " can't be blank." }

  validates :title,
  :presence => {:message => " can't be blank." }
  after_destroy :log_destroy_action
  
 
  def log_destroy_action
    puts 'Article destroyed'
  end
  
end
