class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])

    @email.read = true
    @email.save

    respond_to do |format|
      format.html{ redirect_to email_path }
      format.js{ }
    end

  end

  def new
  end

  def create
    @email = Email.create(
      object: Faker::Book.title,
      body: Faker::Lorem.paragraph
    )

    respond_to do |format|
      format.html{ redirect_to email_index_path }
      format.js{ }
    end
  end

  def edit
  end

  def update
    @email = Email.find(params[:id])

    @email.read = false
    @email.save

    respond_to do |format|
      format.html{ redirect_to email_index_path }
      format.js{ }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html{ redirect_to email_index_path }
      format.js{ }
    end
  end
end
