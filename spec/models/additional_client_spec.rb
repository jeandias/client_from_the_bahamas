require 'rails_helper'

RSpec.describe AdditionalClient, type: :model do
  it { should belong_to(:client) }
  it { should belong_to(:invoice) }
end
