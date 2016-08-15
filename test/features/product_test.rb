require "test_helper"

feature "Product" do
  
  before(:all) do
    Capybara.javascript_driver = :webkit
  end
  
  scenario "saving a new product" do
    create_product
    page.must_have_content "12345"
    page.must_have_content "Hat"
    page.must_have_content "Blocks the sun"
    page.must_have_content "20"
  end

  scenario "adding a new key/value pair", js: true do
    create_product
    add_k_v_pairs(keys: ['Key1'], values: ['Value1'])
    assert(page.has_button?('Update Product'))
    click_on('Update Product')
    page.must_have_content('Key1')
    page.must_have_content('Value1')
  end

  scenario "adding a duplicate key", js: true do
    skip('jquery autocomplete messed up spec. works in the browser. must research.')
    create_product
    add_k_v_pairs(keys: ['Key1', 'Key1'], values: ['Value1', 'Value2'])
    assert(page.has_button?('Update Product', disabled: true))
  end

  def create_product
    visit root_path
    click_on('New Product')
    fill_in('Sku',         with: '12345')
    fill_in('Name',        with: 'Hat')
    fill_in('Description', with: 'Blocks the sun')
    fill_in('Price',       with: '20')
    click_on('Create Product')
  end

  def force_autocomplete_change(id, value)
    page.execute_script("document.getElementById('#{id}').setAttribute('value', '#{value}');")
  end

  def press_enter(input)
    script  = "var e = jQuery.Event('keypress');"
    script += "e.which = 13;"
    script += "$('#{input}').trigger(e);"
    page.execute_script(script);
  end
  
  def add_k_v_pairs(kv_hash)
    click_on('Edit')
    
    kv_hash[:keys].count.times { click_on('add details') }
    
    inputs = page.find_by_id('details_area').all('input')
    inputs.each_slice(2).with_index do |(key, value), index|
      key.set(kv_hash[:keys][index])
      #key.trigger(:focus)
      #force_autocomplete_change(key[:id], kv_hash[:keys][index])
      #press_enter(key[:id])
      value.set(kv_hash[:values][index])
      #force_autocomplete_change(value[:id], kv_hash[:values][index])
    end
    #page.save_screenshot('~/Desktop/screenshot.png')
  end
end
