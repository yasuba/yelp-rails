module SessionHelpers

      def sign_up(email, password, password_confirmation)
        visit '/users/sign_up'
        fill_in 'Email', with: email
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_button 'Sign up'
    end

end