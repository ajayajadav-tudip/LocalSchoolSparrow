class SchoolController < ApplicationController

#Displaying in Tabular form
  def index
    @schools= School.all
  end

#Show Content
  def show
    @school = School.find(params[:id])
  end

#Edit Content
  def edit
    @school = School.find(params[:id])
  end

#Update Content
  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      redirect_to @school
    else
      render 'edit'
    end
  end

#delete Content
  def destroy
    @school = School.find(params[:id])

    if @school.destroy
      redirect_to :action => :index
    end
  end

#New Content
  def new
    @school= School.new
  end

#Create new Content
  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end
  private
  def school_params
    params.require(:school).permit(:SchoolName, :School_Location, :Student_Capacity, :Email_Id)
  end

end
