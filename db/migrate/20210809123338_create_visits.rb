class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :url_info_id
      t.string :ip_address

      t.timestamps
    end
  end
end
