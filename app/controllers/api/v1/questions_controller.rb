module Api
  module V1
    class QuestionsController < BaseController

      # GET /questions
      def index
        @questions = questions_with_results_if_admin(Question.all)
        render json: @questions, status: 200
      end

      # GET /questions/:id
      def show
        @question = questions_with_results_if_admin([Question.find(params[:id])]).first
        render json: @question, status: 200
      end

      # PUT /questions/:id
      def update
        # Abstract away the answer model to simplify client-side logic
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

        def questions_with_results_if_admin(questions)
          # Temporarily put authorization logic here.
          # In a real application this would be abstracted into a before_action on
          # the BaseController and results would probably be split into a different
          # serializer/template entirely
          #
          # Harcoding authorization like this would be a rather terrible way to do
          # API-based security in a production application, but here it serves to
          # demonstrate the concept.
          admin = false
          auth_header = request.headers['HTTP_AUTHORIZATION']
          if auth_header
            # check headers first
            access_token = auth_header.match(/\ABearer\s(.+)\z/)[1]
            if access_token == '12345'
              admin = true
            end
          end

          # horrible hack to inject conditionals into ActiveModelSerializer
          # A better way to do it would be to use a new model, or render with
          # templates using jbuilder instead
          if admin
            questions.each do |q|
              q.show_results = true
            end
          end
          return questions
        end
    end
  end
end
