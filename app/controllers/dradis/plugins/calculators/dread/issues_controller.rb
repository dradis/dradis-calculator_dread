module Dradis::Plugins::Calculators::DREAD
  # Does it matter that we're inheriting from the no-frills controller?
  class IssuesController < ::IssuesController
    before_action :set_dread_vector, only: :edit

    skip_before_action :remove_unused_state_param

    def edit
    end

    def update
      dread_fields = Hash[ *params[:dread_fields].scan(FieldParser::FIELDS_REGEX).flatten.map(&:strip) ]
      dread_fields.each do |name, value|
        @issue.set_field(name, value)
      end

      if @issue.save
        redirect_to main_app.project_issue_path(current_project, @issue), notice: 'DREAD fields updated.'
      else
        render :edit
      end
    end

    def set_dread_vector
      # Undefined values default to 0
      @dread_vector = Hash.new { |h, k| h[k] = 0 }
      field_value  = @issue.fields['DREAD.Vector']

      # If no vector is set yet, that's OK
      return if field_value.blank?

      if field_value =~ V1::VECTOR_REGEXP
        field_value.split('/').each do |pair|
          field, value = pair.split(':')
          @dread_vector[field] = value.to_i
        end
      else
        redirect_to main_app.project_issue_path(current_project, @issue), alert: 'The format of the DREAD Vector field is invalid.'
      end
    end
  end
end
