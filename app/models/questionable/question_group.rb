module Questionable
  class QuestionGroup < ActiveRecord::Base

    has_many :assignment_groups  
    has_many :subjects, :through => :assignment_groups

    attr_accessible :title, :note, :category

    validates_presence_of :title
=begin
    def answers_for_user(user)
      answers = self.answers.where(user_id: user.id)
      answers.any? ? answers : [self.answers.build(user_id: user.id)]
    end
=end
    def self.with_subject(subject)
      if subject.kind_of?(Symbol) or subject.kind_of?(String)
        Questionable::QuestionGroup.joins('INNER JOIN questionable_assignment_groups ON questionable_assignment_groups.question_group_id = questionable_question_groups.id').where(:questionable_assignment_groups => { :subject_type => subject }).order('questionable_assignment_groups.position')
      else
        Questionable::QuestionGroup.joins('INNER JOIN questionable_assignment_groups ON questionable_assignment_groups.question_group_id = questionable_question_groups.id').where(:questionable_assignment_groups => { :subject_type => subject.class.to_s, :subject_id => subject.id }).order('questionable_assignment_groups.position')
      end
    end
  end
end
