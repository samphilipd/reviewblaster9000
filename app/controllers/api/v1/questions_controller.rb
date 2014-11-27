module Api
  module V1
    class QuestionsController < BaseController

      # GET /questions
      def index
        @questions = Question.all
        render json: @questions, status: 200
      end

      # GET /questions/:id
      def show
        @question = Question.find(params[:id])
        render json: @question, status: 200
      end

      # PUT /questions/:id
      def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
          render json: @question, status: 200
        else
          render json: { :errors => @question.errors }, status: 400
        end
      end

      def reset
        Question.update_all(rating: -1)
        render json: {}, status: 200
      end

      private
        def question_params
          params.require(:question).permit(:rating)
        end
    end
  end
end
