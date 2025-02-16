class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :igreja

  has_many :estudousers, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :estudousers, reject_if: :all_blank, allow_destroy: true
end
