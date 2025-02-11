class Ministroubiblico < ApplicationRecord
  belongs_to :visitaigreja
  belongs_to :visitabiblico
  belongs_to :estudobiblico
  belongs_to :itemestudobiblico
end
