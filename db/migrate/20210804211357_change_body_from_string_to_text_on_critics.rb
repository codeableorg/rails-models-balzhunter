class ChangeBodyFromStringToTextOnCritics < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :critics, :body, :text
    end
    def down
      change_column :critics, :body, :string
    end
  end
end
