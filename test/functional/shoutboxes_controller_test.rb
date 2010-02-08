require 'test_helper'

class ShoutboxesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Shoutbox.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Shoutbox.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Shoutbox.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to shoutbox_url(assigns(:shoutbox))
  end
  
  def test_edit
    get :edit, :id => Shoutbox.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Shoutbox.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Shoutbox.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Shoutbox.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Shoutbox.first
    assert_redirected_to shoutbox_url(assigns(:shoutbox))
  end
  
  def test_destroy
    shoutbox = Shoutbox.first
    delete :destroy, :id => shoutbox
    assert_redirected_to shoutboxes_url
    assert !Shoutbox.exists?(shoutbox.id)
  end
end
