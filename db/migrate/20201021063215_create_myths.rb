class CreateMyths < ActiveRecord::Migration[6.0]
  def change
    create_table :myths do |t|
      t.text :false_content
      t.timestamps
    end
  end
end
