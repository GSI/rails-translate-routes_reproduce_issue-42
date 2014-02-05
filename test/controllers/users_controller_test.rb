require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
		users_path
    #get :new, locale: 'en'
    assert_response :success
  end

  test "devise-destroy-route: sign_out closes session in any available language" do
    assert_generates '/en/users/sign_out',
      { :locale => 'en', :controller => 'devise/sessions', :action => 'destroy' }

    assert_generates '/de/benutzer/abmelden',
      { :locale => 'de', :controller => 'devise/sessions', :action => 'destroy' }

    assert_generates '/es/usuario/cerrar',
      { :locale => 'es', :controller => 'devise/sessions', :action => 'destroy' }
  end
end
