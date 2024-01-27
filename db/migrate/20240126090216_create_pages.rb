class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :published, default: false
      t.json :prefrences, default: {}
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
