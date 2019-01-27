# frozen_string_literal: true

# app/controllers/items_controller.rb
class ItemsController < ApplicationController
    before_action :set_todo
    before_action :set_todo_item, only: [:show, :update, :destroy]

    # GET /todo/:todo_id/items
    def index
        json_response(@todo.items)
    end
    # GET /todo/:todo_id/items/:id
    def show
        json_response(@item)
    end
    # POST /todo/:todo_id/items
    def create
        @todo.items.create!(item_params)
        json_response(@todo, :created)
    end
    # PUT /todo/:todo_id/items/:id
    def update
        @item.update(item_params)
        head :no_content
    end
    # DELETE /todo/:todo_id/items/:id
    def destroy
        @item.destroy
        head :no_content
    end

    private

    def item_params
        params.permit(:name, :done)
    end

    def set_todo
        @todo = Todo.find(params[:todo_id])
    end

    def set_todo_item
        @item = @todo.items.find_by!(id: params[:id]) if @todo
    end
end