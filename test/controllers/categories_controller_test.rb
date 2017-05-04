require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

	def setup 
		@category = Category.create(name: "sports")
		@user = User.create(username: 'jean', email: "jean@123.com", password: "1234", admin: true)
	end

	test "shoul get categories index" do 
		get :index
		assert_response :success
	end

	test "shoul get new" do 
		#esta es la forma de simular la session en el controller - 
		session[:user_id] = @user.id 
		get :new
		assert_response :success
	end

	test "shoul get show" do 
		get(:show, {'id' => @category.id}) 
		assert_response :success
	end

	test "should redirect create when admin not logged in" do
		assert_no_difference 'Category.count' do
			post :create, category: { name: "sports" }
		end	
		assert_redirected_to categories_path
	end

end