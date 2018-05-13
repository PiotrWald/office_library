class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: [ :open, :closed ]
end
