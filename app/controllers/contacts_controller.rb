class ContactsController < ApplicationController

    # GET Request to /contact
    # Show new contact form
    def new
        @contact = Contact.new
    end
    
    # POST request /contacts
    def create
        # Mass assignment of form fields into Contact object
        @contact = Contact.new(contact_params)
        # Save the Contact Object to the database
        if @contact.save
            # Store form firelds via parameters, into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Plug variables into contact mailer
            # email method and send email
            ContactMailer.contact_email(name, email, body).deliver
            # Store success message in flash hash and redirect to new action
            flash[:success] = "Message Sent.s"
            redirect_to new_contact_path
        else
            # If contact object does not save, store errors in flash hash
            # and redirect to the new action
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private 
        # To collect data from form we need to use strong parameters and 
        # whitelist the form fields
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
