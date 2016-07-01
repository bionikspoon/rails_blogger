class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  before_filter :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def destroy
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to tags_path
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
