class CreateKudosSents < ActiveRecord::Migration[8.0]
  def change
    create_table :kudos_sents do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :message
      t.integer :points
      t.boolean :processed

      t.timestamps
    end
  end
end
