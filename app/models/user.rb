class User < ApplicationRecord
  def to_pleasant_string
    "#{name} : #{email}"
  end
end
