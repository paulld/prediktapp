class BetsController < RestController

  def index
    # Retrieve the items (e.g., articles)
    # The query is lazy loaded
    cursor = get_query(get_key)

    # Set an instance variable (e.g., @articles) to the cursor returned
    instance_variable_set( get_name, cursor )

    if @ids and cursor.empty?
      # Return a 404 if expecting individual items and none found
      head :not_found
    else
      # Return a 406 (partial content) if fewer items found than asked for
      # Otherwise, return a 200 OK
      render :index, status: partial_content?(cursor.length)
    end
  end


  protected

  def configure_controller
    config[:display] = [ :bet_type, :wager, :odds, :is_successful, :gain, :is_settled ]       # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :user_id, :match_id ]                                           # Fields that MUST be included in the JSON
    config[:permit]  = [ :user_id, :match_id, :bet_type, :wager, :odds, :is_successful, :gain, :is_settled ]        # Permitted params for create/replace/update
    config[:include] = [ :user, :match ]                                                      # Associated objects to be eagerly loaded
  end
     

end