class Address < ApplicationRecord
  belongs_to :account

  def self.confirm_all
    update_all(confirmed: true)
  end
end
