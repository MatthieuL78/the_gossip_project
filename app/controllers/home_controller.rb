class HomeController < ApplicationController
  def index
    @last_gossips = Gossip.all.sort_by { |gossip_id, user_id, name, date, content| date }.reverse
  	@famous_gossips = Gossip.all.sort_by  { |gossip| gossip.comments.count }.reverse
  end
end
