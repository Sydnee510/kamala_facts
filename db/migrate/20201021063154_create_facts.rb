class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.text :true_content
      t.text :receipt_url
      t.integer :myth_id
      t.timestamps
    end
  end
end
