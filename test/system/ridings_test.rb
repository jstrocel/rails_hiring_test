# frozen_string_literal: true

require 'application_system_test_case'

class RidingsTest < ApplicationSystemTestCase
  setup do
    @riding = ridings(:one)
  end

  test 'visiting the index' do
    visit ridings_url
    assert_selector 'h1', text: 'Ridings'
  end

  test 'should create riding' do
    visit ridings_url
    click_on 'New riding'

    fill_in 'Name', with: @riding.name
    fill_in 'Province', with: @riding.province
    fill_in 'Riding code', with: @riding.riding_code
    click_on 'Create Riding'

    assert_text 'Riding was successfully created'
    click_on 'Back'
  end

  test 'should update Riding' do
    visit riding_url(@riding)
    click_on 'Edit this riding', match: :first

    fill_in 'Name', with: @riding.name
    fill_in 'Province', with: @riding.province
    fill_in 'Riding code', with: @riding.riding_code
    click_on 'Update Riding'

    assert_text 'Riding was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Riding' do
    visit riding_url(@riding)
    click_on 'Destroy this riding', match: :first

    assert_text 'Riding was successfully destroyed'
  end
end
