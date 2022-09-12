class Admin::HomesController < ApplicationController
  def top
    @customers = Costomer.all
  end
end
