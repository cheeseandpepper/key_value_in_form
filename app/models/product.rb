class Product < ActiveRecord::Base
  after_save :ensure_details_keys_are_unique, if: Proc.new { |record| record.details.present? }

  def self.known_keys
    all.flat_map { |record| JSON.parse(record.details).keys }.compact
  end

  def ensure_details_keys_are_unique
    keys = JSON.parse(details).keys
    if keys.uniq.count == keys.count
      true
    else
      errors.add(:details, 'must only contain unique keys!')
      false
    end
  end
end
