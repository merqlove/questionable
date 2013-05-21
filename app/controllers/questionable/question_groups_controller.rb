require_dependency 'questionable/application_controller'

module Questionable
  class QuestionGroupsController < ApplicationController
    def update
      @question = QuestionGroup.find(params[:id])

      respond_to do |format|
        if @question.update_attributes(params[:question_group])
          format.html { redirect_to @question, notice: 'Question was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit

    end

    def destroy

    end

    def create

    end
  end
end