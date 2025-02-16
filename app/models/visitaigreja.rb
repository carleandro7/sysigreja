class Visitaigreja < ApplicationRecord
  belongs_to :igreja

  has_many :visitabiblicos, inverse_of: :visitaigreja, dependent: :destroy
  accepts_nested_attributes_for :visitabiblicos, reject_if: :all_blank, allow_destroy: true
end
