class Public::HomesController < ApplicationController
  def top
    #新着順
    @animals = Animal.order('id DESC').limit(4)
  end

  def about
  end
end
