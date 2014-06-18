class LeaguesController < RestController

  protected

  def object_params
    params.require(:league).permit( :name )
  end
end
