module PortfoliosHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
# portfolio_item.thumb_image.attached?
  def portfolio_img model, type
    if model.main_image.attached? && type == 'main'
      model.main_image
    elsif model.thumb_image.attached? && type == 'thumb'
      model.thumb_image
    elsif type == 'thumb'
      image_generator(height: '328', width: '82')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end
end