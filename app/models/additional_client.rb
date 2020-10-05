class AdditionalClient < ApplicationRecord
  belongs_to :invoice
  belongs_to :client
end
