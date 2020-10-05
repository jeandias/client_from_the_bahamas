class Client < ApplicationRecord
  has_many :invoices

  validates_presence_of :fiscal_id, :name, :email
  validates :fiscal_id, uniqueness: true
  validates :email, uniqueness: true, email: true

  def as_json(options = nil)
    super({ only: %i[fiscal_id name email] }.merge(options || {}))
  end
end
