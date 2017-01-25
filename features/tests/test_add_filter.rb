class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
    @data = Filter.new('property_positive')
  end

  def select_category(category)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row category
  end

  def select_type
    @screens.screen_select_sub_category.visible?(@data.sub_categories.at(0)['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories.at(0)['option']
  end

  def select_district
    @screens.screen_select_sub_category.visible?(@data.sub_categories.at(1)['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories.at(1)['option']
  end

  def select_town
    @screens.screen_select_sub_category.visible?(@data.sub_categories.at(2)['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories.at(2)['option']
  end

  def select_action
    @screens.screen_select_sub_category.visible?(@data.sub_categories.at(3)['title'])
    @screens.screen_select_sub_category.select_sub_category @data.sub_categories.at(3)['option']
  end

  def set_filter
    @screens.screen_set_filter_parameters.set_filter @data.name
  end

  def set_price
    @screens.screen_set_filter_parameters.set_values @data.parameters.at(0)['name'], @data.parameters.at(0)['left'],@data.parameters.at(0)['right']
  end

  def set_area
    @screens.screen_set_filter_parameters.set_values @data.parameters.at(1)['name'], @data.parameters.at(1)['left'],@data.parameters.at(1)['right']
  end

  def submit_empty_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def submit_filter
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def valid_filter
    @screens.screen_check_filter_parameters.check_filter @data.name
  end

  def create_empty_filter
    select_category @data.category
    select_type
    select_district
    select_town
    select_action
    submit_empty_filter_parameters
  end

  def create_filter
    select_category @data.category
    select_type
    select_district
    select_town
    select_action
    set_filter
    set_price
    set_area
    submit_filter
  end
end
