class Visitabiblico < ApplicationRecord
  belongs_to :visitaigreja
  belongs_to :estudobiblico
  has_many :estudousers, inverse_of: :visitabiblico, dependent: :destroy
  accepts_nested_attributes_for :estudousers, reject_if: :all_blank, allow_destroy: true
end
