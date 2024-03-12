class CourseCategoriesController < ApplicationController

    def index
        @course_categories = CourseCategory.all
    end

    def new
        @course_category = CourseCategory.new
    end

    def create
        @course_category = CourseCategory.new(course_category_params)
        
        if @course_category.save
            redirect_to participants_path, notice: 'Course category was successfully created.'
        else
            render :new
        end
    end

    def show
        @course_category = CourseCategory.find(params[:id])
    end

    private
        
        def course_category_params
            params.require(:course_category).permit(:name, :venue)
        end


end