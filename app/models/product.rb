class Product < ActiveRecord::Base
  has_many :properties, dependent: :destroy
  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true
  after_save :ensure_details_keys_are_unique, if: Proc.new { |record| record.properties.present? }

  def unique_keys
    properties.pluck(:name).uniq
  end

  def ensure_details_keys_are_unique
    if unique_keys.count == properties.pluck(:name).count
      true
    else
      errors.add(:properties, 'must only contain unique keys!')
      false
    end
  end
end
