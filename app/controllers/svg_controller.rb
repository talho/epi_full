class SvgController < ApplicationController
  respond_to :svg

  def chart
    @model = params[:model].camelize.constantize
    @data = @model.send("#{params[:chart_type]}_data", params)
    respond_with(@model, @data) do |format|
      format.svg {render params[:chart_type]}
    end
  end
end
