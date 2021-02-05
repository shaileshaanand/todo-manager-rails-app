class User < ApplicationRecord
  has_many :todos

  def to_pleasant_string
    "#{name} : #{email}"
  end
end
