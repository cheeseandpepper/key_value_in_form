class Property < ActiveRecord::Base
  belongs_to :product


  def self.known_keys
    all.flat_map { |record| record.data.keys.uniq }.compact
  end
end
