class AddTitleToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :title, :string, comment: "标题"
  end
end
