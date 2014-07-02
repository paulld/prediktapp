class RestController < ApplicationController
  before_action :configure_controller
  before_action :set_attributes, only: [ :index ]
  before_action :set_item, only: [ :update, :destroy ]

  # GET /:controller
  # GET /:controller/:ids
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

  # PUT /:controller/:id
  def create_or_replace
    # Create the new item in memory, but do not persist it yet
    # Make sure the item's ID is the one passed in the URL
    new_item = get_class.new( object_params.merge( id: params[:id] ) )


    if new_item.valid?
      begin
        # Check to see if this is a replace or a create
        if old_item = get_class.find_by( id: params[:id] )
          # If a replace, destroy the old item, then save the new
          # Then return a 204
          old_item.destroy
          new_item.save
          head :no_content
        else
          # If a create, save the item, returna 201 with a JSON representation
          new_item.save
          instance_variable_set( get_name, [ new_item ] )
          render :create, status: :created
        end
      rescue
        # If save or destroy fails, return a 500
        head :internal_server_error
      end
    else
      # Return 422 and an error hash if the new item is not valid
      @messages = new_item.errors.messages
      render 'common/errors', status: :unprocessable_entity
    end
  end

  # PATCH /:controller/:id
  def update
    if @item.update_attributes( object_params )
      # Return 204 if the update is successful
      head :no_content
    else
      # Return 422 and an error hash if update fails
      @messages = @item.errors.messages
      render 'common/errors', status: :unprocessable_entity
    end
  end

  # DELETE /:controller/:id
  def destroy
    # Return 204 if destroy succeeds, 500 otherwise
    head @item.destroy ? :no_content : :internal_server_error
  end

  protected

  # These are the default configurations
  def configure_controller
    config[:display] = []        # Fields to (optionally) include in the JSON
    config[:require] = [ :id ]   # Fields that MUST be included in the JSON
    config[:permit]  = []        # Permitted params for create/replace/update
    config[:include] = []        # Associated objects to be eagerly loaded
  end

  # Compare the number of items found with the number requested
  # Set return status to 200 OK if all found, 206 Partial Content otherwise
  def partial_content?(num_items)
    if @ids && @ids.length > num_items
      :partial_content
    else
      :ok
    end
  end

  # Convert the name of the controller to an instance variable symbol,
  # e.g. "tags" -> :@tags, for use in instance_variable_set
  def get_name
    "@#{params[:controller]}".to_sym
  end

  # Convert the name of the controller to the class, e.g. "tags" -> Tag
  def get_class
    params[:controller].singularize.camelize.constantize
  end

  # Convert the name of the controller to a symbol, e.g., "tags" -> :tags
  def get_key
    params[:controller].to_sym
  end

  # Split the requested IDs into an array of ID strings
  def set_ids
    @ids = params[:ids].split(",")
  end

  def convert_fields_to_hash
    unless params[:fields].nil?
      # Convert string list of fields, e.g., fields: "title,body", to a hash,
      # e.g., fields: { articles: "title,body" }
      if params[:fields].is_a?( String )
        params[:fields] = { get_key => params[:fields] }
      end

      # Convert strings of field names to arrays of symbols,
      # e.g., "title,body" -> [ :title, :body ]
      # for all model keys
      params[:fields].keys.each do |k|
        params[:fields][k] = params[:fields][k].split(",").map {|f| f.to_sym }
      end

      # Return the fields hash
      params[:fields]
    end || {}
  end

  def set_fields(key)
    # Convert the params[:fields] to a hash of key:value pairs where the key
    # is the name of the model and the value is an array of symbols, each of
    # which represents an attribute of that model to include in the result set
    @fields = convert_fields_to_hash

    # Whitelist the fields, stripping out any not included in the :display list
    # and including any from the :require list that are missing
    @fields[key] = @fields[key].select {|f| config[:display].include?(f) } + config[:require]
  end

  def set_sort
    # Split the sort fields into an array and convert to asc or desc
    # (a - indicated descending)
    @sort = params[:sort].split(",").map do |f|
      f.start_with?('-') ? { f[1..-1] => :desc } : { f => :asc }
    end
  end

  def set_includes
    # Set the includes to whatever the configure_controller calls for
    # Ensure an empty array as default to prevent the need for .all calls
    @includes = config[:include] || []
  end

  def set_attributes
    # Call the various methods above to set the various query attributes
    key = get_key
    set_includes
    set_fields(key) if params[:fields]
    set_ids         if params[:ids]
    set_sort        if params[:sort]
  end

  def get_query(key)
    # Create the cursor for the query
    qry = get_class
    qry = qry.includes(@includes)
    qry = qry.unscoped.order(@sort) if @sort
    qry = qry.select(@fields[key]) if @fields && @fields[key]
    qry = qry.where(id: @ids) if @ids
    qry
  end

  def set_item
    # Find the item for update or destroy, returning 404 if not found
    head :not_found unless @item = get_class.find_by( id: params[:id] )
  end

  def object_params
    # Set the strong params according to the model and the permitted params
    params.require(params[:controller].singularize.to_sym).permit(config[:permit])
  end
end