class SweetAlert
    include Capybara::DSL

    def confirm_removal
        find(".swal2-confirm").click
    end

    def cancel_removal
        find(".swal2-cancel").click
    end
end