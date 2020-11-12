class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :body,
            :presence => {:message => " can't be blank." }
end
