require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "sports")
		@cat2 = Category.create(name: "programming")
	end	

	test "should show categories listing" do 
		get categories_path
		assert_template 'categories/index'
		assert_select 'a[href=?]', category_path(@category), text: @category.name 
		assert_select 'a[href=?]', category_path(@cat2), text: @cat2.name 
	end

end