require_relative '../config/filters'
class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
<<<<<<< HEAD
    @data = Filter.new('property_positive')
=======
    @filter_data = Filter.new('property_positive')
>>>>>>> fcf178f41fddbfe8515762afc0b363dd498def4e
  end

  def select_category
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row(@filter_data.category)
  end

<<<<<<< HEAD
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
=======
  def select_sub_category(sub_cat_hash)
    @screens.screen_select_sub_category.visible?(sub_cat_hash['title'])
    @screens.screen_select_sub_category.select_sub_category(
      sub_cat_hash['option']
    )
  end

  def open_filter_parameter_screen
    select_category
    @filter_data.sub_categories.each do |sub_category|
      select_sub_category(sub_category)
    end
  end

  def set_filter_name
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name(@filter_data.name)
  end

  def set_all_parameters
    @screens.screen_set_filter_parameters.visible?
    @filter_data.parameters.each do |parameter|
      @screens.screen_set_filter_parameters.set_parameter(parameter)
    end
>>>>>>> fcf178f41fddbfe8515762afc0b363dd498def4e
  end

    def submit_filter_data
      set_filter_name
      set_all_parameters
      @screens.screen_set_filter_parameters.save_filter
    end

  def submit_empty_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

<<<<<<< HEAD
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
=======
  def create_filter
    open_filter_parameter_screen
    submit_filter_data
>>>>>>> fcf178f41fddbfe8515762afc0b363dd498def4e
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
