class FactsController < ApplicationController
    def index 
        if params[:search]
           
                @facts = Fact.searched(params[:search])
            else
                @facts = Fact.all.order(:myth_id) 
        end 
        
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
        @fact = Fact.new(fact_params)
        if  @fact.save 
            redirect_to fact_path(@fact), notice: "Fact Successfully Created"
        else 
            render 'new'
        end 
    end 
    def destroy 
        @fact = Fact.find(params[:id]).destroy
        redirect_to facts_path
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
    def fact_params
        params.require(:fact).permit(:true_content, :receipt_url, :myth_id, myth_attributes: [:false_content])
    end 
end
