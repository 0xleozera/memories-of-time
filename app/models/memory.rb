class Memory < ApplicationRecord
  belongs_to :weather, optional: true
  belongs_to :user
end
