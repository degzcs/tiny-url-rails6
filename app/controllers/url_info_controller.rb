class UrlInfoController < ApplicationController

  before_action :set_url_info, only: [:show, :redirect]

  def index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @visits = @url_info.visits
    @short_url = UrlFormatter.new.call(
      token: @url_info.token
    )
    respond_to do |format|
      format.html { render :show }
    end
  end

  def redirect
    CreateVisit.new.call(token: params[:token],
                         ip_address: request.remote_ip)
    respond_to do |format|
      format.html { redirect_to @url_info.url }
    end
  end

  def create
    service = CreateUrlInfo.new
    service.call(url: params[:url])
    if service.valid?
      respond_to do |format|
        format.html { redirect_to '/' + service.token + '/info' }
      end
    else
      respond_to do |format|
        format.html { render :index, notice: 'Try again please!' }
      end
    end
  end

  private

  def set_url_info
    @url_info = UrlInfo.find_by(token: params[:token])
  end
end
