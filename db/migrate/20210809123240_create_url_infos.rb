class CreateUrlInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :url_infos do |t|
      t.text :url
      t.string :token

      t.timestamps
    end
  end
end
