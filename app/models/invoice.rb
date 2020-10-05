class Invoice < ApplicationRecord
  belongs_to :client
  has_one :additional_client_relationship, class_name: 'AdditionalClient'
  has_one :additional_client, through: :additional_client_relationship, source: :client
end
