class PetSearch < SearchModel
  attr_reader :title, :category, :source

  def execute
    to_find_options(Pet).order("pets.title_cn")
  end

  def add_conditions
    add_search_condition("pets.title_cn", "any", title) if title.present?
    add_search_condition("pets.source", "equal", source) if source.present?
    add_include_condition(:category, "categories.id = ?", category) if category.present?
  end
end
