class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
    @announcements = Announcement.all.order(:id)
  end

  def show
    @announcement = Announcement.find(params[:id])
  end
end
