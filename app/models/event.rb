class Event < ApplicationRecord
  has_many :interests
  has_many :users, through: :interests
  has_and_belongs_to_many :pairings
end
