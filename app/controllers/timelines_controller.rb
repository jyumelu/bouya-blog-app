class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    # user2, user3, user4 => [2,3,4]
    user_ids = current_user.followings.pluck(:id)
    @articles = Article.where(user_id: user_ids)
  end
end
