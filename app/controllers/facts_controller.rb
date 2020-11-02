class FactsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :edit, :destroy]
    before_action :set_myth
   def index
    @facts = Fact.all 
end
    def show 
        @fact = Fact.find(params[:id])
    end 
    def new 
        @fact = Fact.new
    end 
    def edit 
        @fact = Fact.find(params[:id])
    end 
    def create 
       # @myth = Myth.find(params[:myth_id])
        @fact = @myth.facts.new(fact_params)
        if @fact.save 
            redirect_to myth_path(@myth), notice: "Fact Successfully Created"
        else 
            render 'new'
        end 
    end 
    def destroy 
        @fact = @myth.facts.find(params[:id]).destroy
        redirect_to myth_path(@myth)
    end 
    def update 
        @fact = Fact.find(params[:id])
        if @fact.update(fact_params)
            redirect_to fact_path(@fact), notice: "fact Successfully Updated" 
        else 
            render :edit 
        end
    end

    private 
    def set_myth
        @myth = Myth.find(params[:myth_id])
    end 

    def fact_params
        params.require(:fact).permit(:true_content, :receipt_url, :myth_id, myth_attributes: [:myth_id])
    end 
end
