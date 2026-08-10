class Theme < ApplicationRecord
  has_many :posts

  def self.choose
    themes = order(:id)
    theme_index = Date.current.yday % themes.count
    themes[theme_index]
  end
end
