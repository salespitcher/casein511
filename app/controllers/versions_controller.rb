module Casein
  class VersionsController < Casein::CaseinController
    
    def revert
      @version = PaperTrail::Version.find(params[:id])
      if @version.reify
        @version.reify.save!
      else
        @version.item.destroy
      end
      redirect_to :back
    end
    
    def allversions
      
    end
    
  end
end