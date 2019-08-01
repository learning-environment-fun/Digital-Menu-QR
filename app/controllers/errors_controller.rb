class ErrorsController < ApplicationController


   def not_found
     render '/errors_controller/not_found'
   end

   def unacceptable
     render '/errors_controller/unacceptable'
   end

   def internal_error
     render '/errors_controller/internal_error'
   end

end
