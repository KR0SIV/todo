class TodoItemsController < ApplicationController
	before_action :set_todo_list


	def create
		@todo_item = @todo_list.todo_items.create(params[:todo_item].permit(:content))

		redirect_to @todo_list
	end

	def destroy
		@todo_item = @todo_list.todo_items.find(params[:id])
		if @todo_item.destory
			flash[:success] = "Todo list item was deleted"
		else
			flash[:error] = "Todo list item failed to delete"
		end
		redirect_to @todo_list
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)			
	end

end
