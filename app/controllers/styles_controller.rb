class StylesController < ApplicationController


  def index
    @styles = Style.all
  end

  def show
    @style = requested_style
  end


  private

  def style_params
    params.require(:style).permit(:name, :description, :category)
  end

  def requested_style
    Style.find_by(id: params[:id])
  end

end