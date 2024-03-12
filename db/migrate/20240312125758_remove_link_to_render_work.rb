class RemoveLinkToRenderWork < ActiveRecord::Migration[7.1]
  def change
    remove_column :render_works, :link, :string
  end
end
