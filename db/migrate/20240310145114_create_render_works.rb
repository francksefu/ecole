class CreateRenderWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :render_works do |t|
      t.string :link
      t.references :give_work, foreign_key: true
      t.references :promotion, foreign_key: true

      t.timestamps
    end
  end
end
