class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @parameter_name = element(:id, 'parameter_name')
    @from_value = element(:id, 'left_param')
    @till_value = element(:id, 'right_param')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @parameter_holders[:type], @parameter_holders[:value]
      ).displayed?
    end
  end

  def set_filter(text_name)
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).type(text_name)
  end

  def set_values(text_name, from, to)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |row|
      next unless row.find_element(:id, 'parameter_name').text == text_name
        row.find_element(:id,'left_param').send_keys(from)
        row.find_element(:id,'right_param').send_keys(to)
        @driver.hide_keyboard
      break
    end
  end

  def set_parameter(parameter_hash)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |param|
      next unless param.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter_hash['name']
      param.find_element(@from_value[:type], @from_value[:value]).send_keys(parameter_hash['left'])
      param.find_element(@till_value[:type], @till_value[:value]).send_keys(parameter_hash['right'])
      @driver.press_keycode(4)
    end
end

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
    sleep(5)
  end
end
