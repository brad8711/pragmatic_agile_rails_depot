class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: {greater_that_or_equal_to: 0.01}
  validates :image_url,
              allow_blank: true,
              format: {
                with: %r{\.(gif|jpg|jpeg|png)\Z}i,
                message: 'Image URL must be .gif, .png or .jpg'
              }

  def self.latest
    Product.order(:updated_at).last
  end

  private
    #ensure there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
