class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
