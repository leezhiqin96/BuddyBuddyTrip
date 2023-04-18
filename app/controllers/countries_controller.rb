class CountriesController < ApplicationController
  skip_before_action :authenticate_user!

  def search
    skip_authorization

    @countries = Country.search_by_code_and_name(params[:query])

    respond_to do |format|
      format.json { render partial: 'countries/country_search_result', locals: { countries: @countries } }
    end
  end
end
