class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1 }
  validate :body, presence: true

end
