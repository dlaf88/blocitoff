class ItemsController < ApplicationController
  before_action :set_list
  
  def create 
    
    @item = @list.items.create(item_params)
    @item.user_id = @list.user_id
    redirect_to @list
  end
  
  def destroy
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Todo Item was deleted"
      redirect_to @list
    else 
      flash[:error] = "Todo list item could not be deleted"
    end 
  end 
  
  
  private
  def set_list
    @list = List.find(params[:list_id])
  end 
  
  def item_params
    params[:item].permit(:content)
  end 
    
end
