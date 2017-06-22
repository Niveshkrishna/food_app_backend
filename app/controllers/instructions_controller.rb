class InstructionsController < ApplicationController
    def index
       @instructions = Instruction.where(recipe_id: params[:recipe_id]).to_a
       render :json => @instructions 
   end
   
   def create
     @instruction = Instruction.create!(instruction_params)
     render :json => @instruction
   end
   
   def show
    @instruction = Instruction.find(params[:id])
    render :json => @instruction
   end
   
   def update
       @instruction = Instruction.find(params[:id])
       @instruction.update(instruction_params)
       render :json => @instruction
   end
   
   def destroy
        @instruction = Instruction.find(params[:id])
        @instruction.destroy
        head :no_content
   end
   
   private
   
   def instruction_params
        params.permit(:recipe_id, :id, :content) 
   end
end
