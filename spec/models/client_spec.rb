require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should have_many(:invoices) }

  it { should validate_presence_of(:fiscal_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
