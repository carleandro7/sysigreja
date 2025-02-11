class Estudobiblico < ApplicationRecord
  has_many :itemestudobiblicos, inverse_of: :estudobiblico, dependent: :destroy
  accepts_nested_attributes_for :itemestudobiblicos, reject_if: :all_blank, allow_destroy: true
end
