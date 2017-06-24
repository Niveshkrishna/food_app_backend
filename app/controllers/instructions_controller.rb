class InstructionsController < ApplicationController
    def index 
       @instructions = Instruction.where(recipe_id: params[:recipe_id]).order('serial_number').to_a
       if @instructions != nil
            render :json => @instructions
        else
            head :no_content
        end 
   end
   
   def create
     @instruction = Instruction.new(instruction_params)
        if @instruction.save
            render :json => @instruction
        else
            render :json => @instruction.errors.messages
        end    
    end
   
   def show
    @instruction = Instruction.find_by_id(params[:id])
     if @instruction != nil
            render :json => @instruction
        else
            head :no_content
        end    
   end
   
   def update
       @instruction = Instruction.find_by_id(params[:id])
        if @instruction != nil
            if @instruction.update(instruction_params)
                render :json => @instruction
            else
                render :json => @instruction.errors.messages
            end
        else
            head :no_content
        end    
   end
   
   def destroy
        @instruction = Instruction.find_by_id(params[:id])
        if @instruction.destroy
            render :json => {deleted: true}
        else
            render :json => {deleted: false}
        end
   end
   
   private
   
   def instruction_params
        params.permit(:recipe_id, :id, :content, :serial_number, :image) 
   end
end
