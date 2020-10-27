class MythsController < ApplicationController
    def index 
        if params[:search]
            @myths = Myth.search_content_for(params[:search])
        else
            @myths = Myth.all.order(:false_content) 
    end 
end
    def show 
        @myth = Myth.find(params[:id])
    end 
    def new 
        @myth = Myth.new
    end 
    def edit 
        @myth = Myth.find(params[:id])
    end 
    def create 
        @myth = Myth.new(myth_params)
        if  @myth.save 
            redirect_to myths_path, notice: "Myth Successfully Created"
        else 
            render 'new'
        end 
    end 
    def update 
        @myth = Myth.find(params[:id])
        if @myth.update(myth_params)
            redirect_to myth_path(@myth), notice: "Myth Successfully Updated" 
        else 
            render :edit 
        end
    end
    def destroy 
        @myth = Myth.find(params[:id]).destroy
        redirect_to myths_path
    end 
    private 
    def myth_params
        params.require(:myth).permit(:false_content, fact_attributes: [:true_content, :receipt_url] )
    end 
end
