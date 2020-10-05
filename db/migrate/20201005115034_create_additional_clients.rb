class CreateAdditionalClients < ActiveRecord::Migration[6.0]
  def change
    create_table :additional_clients do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
