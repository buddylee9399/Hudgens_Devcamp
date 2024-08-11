class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  # GET /portfolios
  def index
    # @portfolios = Portfolio.all
    @portfolio_items = Portfolio.by_position.includes([main_image_attachment: :blob, thumb_image_attachment: :blob])
  end

  # GET /portfolios/1
  def show
    
  end

  # GET /portfolios/new
  def new
    # @portfolio = Portfolio.new
    @portfolio_item = Portfolio.new
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end  

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  def create
    # @portfolio = Portfolio.new(portfolio_params)
    @portfolio_item = Portfolio.new(portfolio_params)
    raise
    if @portfolio_item.save
      redirect_to portfolios_url, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    # raise
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_url, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body, 
                                        :position,
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes: [:id, :name, :_destroy]
                                        )
    end
end
