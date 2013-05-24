module Questionable
  class Question < ActiveRecord::Base
    #before_destroy :answers_delete

    has_many :options, :order => 'questionable_options.position ASC', :dependent => :destroy
    has_many :assignments, :dependent => :destroy
    has_many :subjects, :through => :assignments
    has_many :answers, :through => :assignments

    accepts_nested_attributes_for :options, allow_destroy: true
    accepts_nested_attributes_for :subjects
    attr_accessible :title, :input_type, :note, :category, :coeff, :position, :options, :options_attributes, :subjects_attributes

    #validates_presence_of :title, :unless => :skip_validation

    def skip_validation
      if self.category == 'comment'
        return true
      end
      false
    end

    def accepts_multiple_answers?
      ['checkboxes', 'multiselect'].include?(self.input_type)
    end

    def self.create_comment(attributes = nil, options = {}, &block)
      merge = {:input_type => 'text', :category => 'comment'}
      if attributes.is_a?(Array)
        attributes.collect { |attr| self.create(attr.merge(merge), options, &block) }
      else
        self.create(attributes.merge(merge), options, &block)
      end
    end

    def answers_for_user(user)
      answers = self.answers.where(user_id: user.id)
      answers.any? ? answers : [self.answers.build(user_id: user.id)]
    end

    def self.with_subject(subject)
      if subject.kind_of?(Symbol) or subject.kind_of?(String)
        Questionable::Question.joins('INNER JOIN questionable_assignments ON questionable_assignments.question_id = questionable_questions.id').where(:questionable_assignments => { :subject_type => subject }).order('questionable_assignments.position')
      else
        Questionable::Question.joins('INNER JOIN questionable_assignments ON questionable_assignments.question_id = questionable_questions.id').where(:questionable_assignments => { :subject_type => subject.class.to_s, :subject_id => subject.id }).order('questionable_assignments.position')
      end
    end

    def answers_delete
        self.answers.each do |answer|
          answer.delete
        end
    end

    def replicate
      replica = dup

      options.each do |option|
        replica.options << option.dup
      end

      replica
    end
  end
end
