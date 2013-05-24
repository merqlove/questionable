module Questionable
  class Assignment < ActiveRecord::Base
    attr_accessible :question_id, :subject, :subject_id, :subject_type, :position, :coeff

    belongs_to :question, :dependent => :destroy
    belongs_to :subject, :polymorphic => true

    has_many :answers, :dependent => :destroy
    has_many :answered_options, :through => :answers, :source => :option

    scope :category, lambda { |category| includes(:question).where("questionable_questions.category #{category.nil? ? 'IS ' : ' = '} ?", category) }

    def self.with_subject(subject)
      if subject.kind_of?(Symbol) or subject.kind_of?(String)
        assignments = Questionable::Assignment.where(:subject_type => subject)
      else
        assignments = Questionable::Assignment.where(:subject_type => subject.class.to_s, :subject_id => subject.id)
      end

      assignments.order(:position)
    end

    def answers_for_user(user)
      self.answers.where(user_id: user.id)
    end

    # for ActiveAdmin
    def display_name
      "#{self.subject_type}#{self.subject_id}: #{self.question.title}"
    end

  end # End Assignment
end
