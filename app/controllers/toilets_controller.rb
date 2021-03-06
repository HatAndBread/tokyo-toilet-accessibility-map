class ToiletsController < ApplicationController
  def toilets_near_me
    toilets = Toilet.where('latitude > ? - 0.015 AND latitude < ? + 0.015 AND longitude > ? - 0.015 AND longitude < ? + 0.015',
                           params[:latitude], params[:latitude], params[:longitude], params[:longitude])

    render json: { toilets: toilets }.to_json(include: %i[reviews photo_urls])
  end

  private

  def toilets_params
    params.require(:toilets).permit(:latitude, :longitude)
  end
end
