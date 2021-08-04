class ChangeBodyFromStringToTextOnCritics < ActiveRecord::Migration[6.0]
  def change
    remove_column :critics, :body, :string
    add_column :critics, :body, :text
  end
end
