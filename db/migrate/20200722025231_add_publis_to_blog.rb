class AddPublisToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :is_publish, :boolean, default: true, comment: '是否上架'
    add_column :blogs, :publish_at, :datetime, comment: '发布时间'
  end
end
