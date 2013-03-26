module Questionable
  class QuestionGroup < ActiveRecord::Base
    belongs_to :group, :polymorphic => true

    has_many :assignments, :as => :subject, :dependent => :destroy, :order => 'position'
    has_many :questions, :through => :assignments
    has_many :only_questions, :source => :question, :through => :assignments, :conditions => ["questionable_questions.category IS NULL OR questionable_questions.category NOT LIKE ?", 'comment']
    has_many :only_comments, :source => :question, :through => :assignments, :conditions => { :category => 'comment' }
    has_many :answers, :through => :assignments

    attr_accessible :title, :note, :category, :position

    #validates_presence_of :title, :unless => :skip_validation
=begin
    def answers_for_user(user)
      answers = self.answers.where(user_id: user.id)
      answers.any? ? answers : [self.answers.build(user_id: user.id)]
    end
=end

    #def self.with_subject(subject)
    #  if subject.kind_of?(Symbol) or subject.kind_of?(String)
    #    Questionable::QuestionGroup.joins('INNER JOIN questionable_assignments ON questionable_assignments.subject_id = questionable_question_groups.id').where(:questionable_assignments => { :subject_type => subject }).group('questionable_question_groups.id').order('questionable_assignments.position')
    #  else
    #    Questionable::QuestionGroup.joins('INNER JOIN questionable_assignments ON questionable_assignments.subject_id = questionable_question_groups.id').where(:questionable_assignments => { :subject_type => subject.class.to_s, :subject_id => subject.id }).group('questionable_question_groups.id').order('questionable_assignments.position')
    #  end
    #end

    #def self.build_groups_for_subject(subject, user=nil)
    #
    #  if subject.kind_of?(Symbol) or subject.kind_of?(String)
    #    assignments = Questionable::QuestionGroup.where(:subject_type => subject)
    #  else
    #    assignments = Questionable::QuestionGroup.where(:subject_type => subject.class.to_s, :subject_id => subject.id)
    #  end
    #
    #  assignments = assignments.order(:position)
    #
    #  assignments.map { |as| as.question }
    #  assignments = Questionable::Assignment.where(:subject_type => subject.class.to_s, :subject_id => subject.id)
    #
    #
    #  assignments = assignments.order(:position)
    #  if user.nil?
    #    assignments.map { |as| as.answers.all }
    #  else
    #    assignments.map { |as| as.answers_for_user(user) }
    #  end
    #end
  end
end
