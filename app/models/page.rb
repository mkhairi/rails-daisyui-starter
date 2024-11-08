class Page < ApplicationRecord
  # Attributes
  enum :status, { draft: 0, issued: 1, archived: 99 }

  # Associations

  # Validations
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 150 }
  validates :content, presence: true

  # Callbacks
end
