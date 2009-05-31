class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        report = ProductReport.new(@product)
        report.render
        x_accel_pdf(report.path, "product-#{@product.id}.pdf")
      end
    end
  end
end
