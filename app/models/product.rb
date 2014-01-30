class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_that_or_equal_to: 0.01}
  validates :image_url,
              allow_blank: true,
              format: {
                with: %r{\.(gif|jpg|jpeg|png)\Z}i,
                message: 'Image URL must be .gif, .png or .jpg' 
              }
end
