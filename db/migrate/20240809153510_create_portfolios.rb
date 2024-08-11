class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
