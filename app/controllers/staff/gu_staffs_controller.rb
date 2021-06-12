class Staff::GuStaffsController < ApplicationController
  def index
  end

  def create
    if search_params[:ladies] == 'true' && search_params[:mens] == 'true'
      @osyalista = GuOsyaristum.readonly.order(gender: :ASC, height: :ASC).includes(:gu_store)

      unless search_params[:store].blank?
        @osyalista = @osyalista.select { |osyalista| osyalista.gu_store_id == search_params[:store].to_i }
      end
    elsif search_params[:ladies] == 'true'
      @osyalista = GuOsyaristum.readonly.where(gender: '女性').order(height: :ASC).includes(:gu_store)

      unless search_params[:store].blank?
        @osyalista = @osyalista.select { |osyalista| osyalista.gu_store_id == search_params[:store].to_i }
      end
    elsif search_params[:mens] == 'true'
      @osyalista = GuOsyaristum.readonly.where(gender: '男性').order(height: :ASC).includes(:gu_store)

      unless search_params[:store].blank?
        @osyalista = @osyalista.select { |osyalista| osyalista.gu_store_id == search_params[:store].to_i }
      end
    else
    end

    render action: :index, osyalista: @osyalista
  end

  private
  def search_params
    params.permit(:ladies, :mens, :store)
  end
end
