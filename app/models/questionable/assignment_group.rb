module Questionable
  class AssignmentGroup < ActiveRecord::Base
    attr_accessible :question_group_id, :subject, :subject_id, :subject_type, :position

    belongs_to :question_group
    belongs_to :subject, :polymorphic => true

    def self.with_subject(subject)
      if subject.kind_of?(Symbol) or subject.kind_of?(String)
        assignments = Questionable::AssignmentGroup.where(:subject_type => subject)
      else
        assignments = Questionable::AssignmentGroup.where(:subject_type => subject.class.to_s, :subject_id => subject.id)
      end

      assignments.order(:position)
    end

=begin 
    def answers_for_user(user)
      self.answers.where(user_id: user.id)
    end
=end

    # for ActiveAdmin
    def display_name
      "#{self.subject_type}#{self.subject_id}: #{self.question_group.title}"
    end

  end # End Assignment
end
