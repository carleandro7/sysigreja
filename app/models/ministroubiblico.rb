class Ministroubiblico < ApplicationRecord
  belongs_to :estudobiblico
  belongs_to :itemestudobiblico
  belongs_to :igreja
  belongs_to :user

  has_many :ministroubiblicousers, inverse_of: :ministroubiblico, dependent: :destroy
  accepts_nested_attributes_for :ministroubiblicousers, reject_if: :all_blank, allow_destroy: true

  has_many :estudoministrados, inverse_of: :ministroubiblico, dependent: :destroy
  accepts_nested_attributes_for :estudoministrados, reject_if: :all_blank, allow_destroy: true
end
