class Admin::HomesController < ApplicationController
  def top
    #新着順
    @animals = Animals.order('id DESC').limit(4)
  end
end
