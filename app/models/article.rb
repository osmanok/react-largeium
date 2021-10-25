class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :available?, -> { where(visible: true) }
  scope :recent, -> { order(created_at: :desc) }

end
