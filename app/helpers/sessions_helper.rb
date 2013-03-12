module SessionsHelper

    def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user
    end

    def signed_in?
        !current_user.nil?
    end

    def sign_out
        self.current_user = nil
        cookies.delete(:remember_token)
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end

    def current_user?(user)
        user == current_user
    end

    def current_person
        @current_person ||= (User.find_by_remember_token(cookies[:remember_token])).person
    end

    def current_person?(person)
        person == current_person
    end

    def current_condo
        @current_condo = Condo.find current_user.condo_id
    end

    def current_condo_id
        current_user.condo_id
    end

    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end

    def store_location
        session[:return_to] = request.url
    end

end
