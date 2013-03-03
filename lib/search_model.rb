class SearchModel   
  def self.case_insensitive_like
    ActiveRecord::Base.connection.respond_to?(:sqlserver?) ? 'LIKE' : 'ILIKE'
  end

  def initialize(params = {})
    params = {} unless params
    params.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.blank?
    end
  end

  def to_find_options(collection, additions = {}, orders = [])
    process_additions(additions)
    add_conditions

    options = collection.where(computed_conditions)
    options = options.includes(@includes.uniq) unless @includes.empty?
    options = options.order(orders) unless orders.empty?
    options
  end

  def process_additions(additions)
    @condition_strings = []
    @condition_values = []
    @includes = []
    additional_include = additions[:include]
    @includes << additional_include if additional_include
  end

  def computed_conditions
    [combined_condition_string] + @condition_values
  end

  def combined_condition_string
    core = @condition_strings.join(") AND (")
    @condition_strings.size > 1 ? "(#{core})" : core
  end

  def add_condition(condition_string, condition_value)
    @condition_strings << condition_string
    @condition_values = @condition_values + [ condition_value ].flatten
  end

  def add_include_condition(table_name, condition_string,condition_value)
    @includes << table_name
    add_condition(condition_string, condition_value)
  end

  def add_include_search_condition(table_name, field, search_type, value)
    @includes << table_name
    add_search_condition(field, search_type, value)
  end
  
  def add_search_condition(field, search_type, value)
    case search_type
      when "starts", "ends", "any"
        add_condition("#{field} #{case_insensitive_like} ?", like_string(search_type, value) )
      else
        add_condition("#{field} = ?", value)
    end
  end

  def add_fuzzy_condition(field, search_type, value)
    if search_type.present?
      add_search_condition(field, first_name_search_type, value)
    else
      add_condition("#{field} #{case_insensitive_like} ?", value)
    end
  end
  
  def like_string(search_type, value)
    case search_type
      when "starts"
        "#{value}%%"
      when "ends"
        "%%#{value}"
      when "any"
        "%%#{value}%%"
      else
        value
    end
  end
  
  protected

  def case_insensitive_like
    self.class.case_insensitive_like
  end

end