class ErrorsController < ApplicationController


   def not_found
     render '/errors_controller/not_found'
   end

   def unacceptable
     respond_to do |format|
       format.html { render status: 422 }
       format.json { render json: { error: "Params unacceptable" }, status: 422 }
     end
   end

   def internal_error
     respond_to do |format|
       format.html { render status: 500 }
       format.json { render json: { error: "Internal server error" }, status: 500 }
     end
   end


end
