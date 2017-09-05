class Profile < ApplicationRecord
  belongs_to :account

  def self.confirm_all
    update_all(confirmed: true)
  end

  def full_name
    [name, surname].join(" ")
  end
end
