module ApplicationHelper
    def title
        base_title = "Mon Bac en 2022"
        if @title.nil?
        base_title
        else
        " #{@title} - #{base_title}"
        end
    end

    #Sign in and up anywhere on app
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end

