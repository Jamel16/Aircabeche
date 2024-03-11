class Reservation < ApplicationRecord
  belongs_to :cabeche
  belongs_to :user
end
