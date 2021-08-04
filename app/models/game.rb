class Game < ApplicationRecord
  validates :name, :genre, :price, :release_date, presence: true
  validates :genre,
            inclusion: {
              in: %w(Simulator Adventure Strategy Role-playing\ (RPG) Shooter Fighting
                     Sport)
            }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
