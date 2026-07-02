class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :pages, numericality: { greater_than: 0 }
end