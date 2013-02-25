class TemplatesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @template = current_user.templates.find(params[:id])
  end
end
