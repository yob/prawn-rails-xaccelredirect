class ProductReport < ApplicationReport
  def initialize(product)
    @product = product
  end

  def render_header
    pdf.font_size(16) do
      pdf.text "<b>#{@product.description}</b>"
    end
  end

  def render_body
    pdf.font_size(12) do
      pdf.text "<b>Code: </b>#{@product.code}"
      pdf.text "<b>RRP: </b>#{@product.rrp}"
    end
  end
end
