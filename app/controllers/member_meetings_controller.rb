class MemberMeetingsController < ApplicationController
  before_filter :authorize_as_officer
  
  def new
    @updates = {
      "#{params[:relationship].downcase}_form" => { partial:
        'member_meetings/new' }
    }
    @relationship = params[:relationship]
    render 'shared/update'
  end

  def create
    # TODO
  end
end
