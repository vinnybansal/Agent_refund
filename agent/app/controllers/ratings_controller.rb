class RatingsController < ApplicationController
before_filter :require_user
 def rate
    @object_class = params[:type]
     rateable = @object_class.constantize.find(params[:id])
     rateable.rate_it(params[:ratings_value], current_user.id)
    render :partial =>  'ratings/rating', :locals => { :rateable_object => rateable }
 end
  def rate_up
   @object_class = params[:type]
    rateable = @object_class.constantize.find(params[:id])
    Rating.delete_all(["rateable_type = ? AND rateable_id = ? AND user_id = ?", params[:type],params[:id], current_user.id])
   render :partial =>  'ratings/rating', :locals => { :rateable_object => rateable }
  end

end
