PadrinoRedisStore.controllers :base do
  get :index, :map => '/' do
    return 'hey you are authorized'
  end
end

PadrinoRedisStore.controllers :sessions do
  get :new, :map => '/sessions/new' do
    render '/sessions/new', nil, :layout => false
  end

  post :create, :map => '/sessions' do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:base, :index)
    else
      params[:email], params[:password] = h(params[:email]), h(params[:password])
      flash[:warning] = "Login or password wrong."
      redirect url(:sessions, :new)
    end
  end

  delete :destroy, :map => '/sessions' do
    set_current_account(nil)
    redirect url(:sessions, :new)
  end
end