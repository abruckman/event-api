class Like < ApplicationRecord
  belongs_to :event
  belongs_to :pairing
  belongs_to :user 
end
