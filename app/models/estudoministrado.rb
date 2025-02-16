class Estudoministrado < ApplicationRecord
  belongs_to :ministroubiblico
  belongs_to :visitaigreja
  attr_accessor :_sava_visita
end
