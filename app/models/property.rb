class Property < ActiveRecord::Base
  belongs_to :product


  def self.known_keys
    all.pluck(:name).uniq
  end
end
