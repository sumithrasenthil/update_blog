class Article < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :likes , dependent: :destroy

  has_many :taggings , dependent: :destroy
  has_many :tags, through: :taggings
  validates :body,
            :presence => {:message => " can't be blank." }

  validates :title,
  :presence => {:message => " can't be blank." }

  after_destroy :log_destroy_action
  before_save :normalize_name 

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
  

  private 
  def normalize_name
    self.title = title.titleize
  end

  

  def log_destroy_action
    puts 'Article destroyed'
  end
  
end
