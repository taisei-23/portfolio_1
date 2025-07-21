class TrainRoutesController < ApplicationController
  def sidebar
    @from = params[:from]
    @to = params[:to]
    logger.debug "🚆 FROM: #{@from}, TO: #{@to}"

    if @from.present? && @to.present?
      render partial: "train_routes/yahoo_link", formats: [ :html ]
    else
      render partial: "train_routes/empty", formats: [ :html ]
    end
  end
end
