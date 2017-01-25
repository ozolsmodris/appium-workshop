class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
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

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
    sleep(5)
  end

end
