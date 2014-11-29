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
        # abstract away the answer model to simplify client-side logic
        @answer = Answer.new(question_id: params[:id])
        if @answer.update(answer_params)
          render json: {}, status: 200
        else
          render json: { :errors => @answer.errors }, status: 400
        end
      end

      private
        def answer_params
          params.require(:question).permit(:flavour, :rating, :true_false)
        end
    end
  end
end
