module SmartPension
  module QueryObjects
    class ResultEntry
      def initialize(initial_scope)
        @initial_scope = initial_scope
      end

      def call(**params)
        sort_desc(@initial_scope, params[:sort_desc])
      end
      
      private
      
      def sort_desc(scoped, sort)
        sort ? Hash[scoped.sort_by { |_name, values| values.count }.reverse] : scoped
      end
    end
  end
end