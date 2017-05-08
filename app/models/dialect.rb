class Dialect < ApplicationRecord
  validates :name, presence: true
  validates :front_name, presence: true
  validates :svg_path, presence: true
  has_many :users
end
