class GuStaffsController < ApplicationController
  def index
    @osyalista = GuOsyaristum.readonly.order(gender: :ASC, height: :ASC).includes(:gu_store)
  end

  def create
    if search_params[:commit].include? 'デフォルト'
      @osyalista = GuOsyaristum.readonly.order(gender: :ASC, height: :ASC).includes(:gu_store)
    elsif search_params[:commit] == '女性'
      @osyalista = GuOsyaristum.readonly.where(gender: '女性').order(height: :ASC).includes(:gu_store)
    elsif search_params[:commit] == '男性'
      @osyalista = GuOsyaristum.readonly.where(gender: '男性').order(height: :ASC).includes(:gu_store)
    elsif search_params[:commit] == '検索'
      gender = search_params[:gender]
      store = search_params[:store]

      if store.nil?
        @osyalista = GuOsyaristum.readonly.where(gender: gender).includes(:gu_store)
      elsif gender.nil?
        @osyalista = GuOsyaristum.readonly.where(gu_store_id: store).includes(:gu_store)
      elsif store == ''
        @osyalista = GuOsyaristum.readonly.where(gender: gender).includes(:gu_store)
      else
        @osyalista = GuOsyaristum.readonly.where(gu_store_id: store, gender: gender).includes(:gu_store)
      end
    end
    render action: :index, osyalista: @osyalista
  end

  private
  def search_params
    params.permit(:gender, :store, :commit)
  end
end
