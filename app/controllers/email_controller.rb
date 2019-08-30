class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
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
  end

  def destroy
  end
end
