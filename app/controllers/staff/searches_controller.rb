class Staff::SearchesController < ApplicationController
  def index
    @form_storelists = GuStore.readonly.select(:id, :name).find(571, 572, 605, 610, 637, 645, 667, 1242)
  end
end
