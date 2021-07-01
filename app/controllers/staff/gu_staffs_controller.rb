class Staff::GuStaffsController < ApplicationController
  def index
    if @osyalista.blank?
      redirect_to staff_searches_path
    end
  end

  def create
    if search_params[:ladies].blank? && search_params[:mens].blank?
      redirect_to staff_searches_path
    elsif search_params[:ladies] == 'true' && search_params[:mens] == 'true'
      @osyalista = Osyalista.readonly.order(gender: :DESC, height: :ASC).includes(gu_store: :prefecture)
    elsif search_params[:ladies] == 'true'
      @osyalista = Osyalista.readonly.where(gender: true).order(height: :ASC).includes(gu_store: :prefecture)
    elsif search_params[:mens] == 'true'
      @osyalista = Osyalista.readonly.where(gender: false).order(height: :ASC).includes(gu_store: :prefecture)
    end

    unless search_params[:store].blank?
      @osyalista = @osyalista.select { |osyalista| osyalista.store_id == search_params[:store].to_i }
    end

    render action: :index, osyalista: @osyalista
  end

  private
  def search_params
    params.permit(:ladies, :mens, :store)
  end
end
