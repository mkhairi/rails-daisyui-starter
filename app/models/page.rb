class Page < ApplicationRecord
  # Associations

  # Validations
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 150 }
  validates :content, presence: true

  # Callbacks
end
