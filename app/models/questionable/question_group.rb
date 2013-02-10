module Questionable
  class QuestionGroup < ActiveRecord::Base

    #has_many :group_assignments
    #has_many :subjects, :through => :group_assignments

    #belongs_to :group, :polymorphic => true
    #belongs_to :assignment
    has_many :assignments
    has_many :subjects, :through => :assignments
    has_many :questions, :through => :assignments, :include => :answers
    has_many :answers, :through => :assignments

    has_ancestry :orphan_strategy => :destroy, :cache_depth => true

    attr_accessible :title, :note, :category, :group, :group_id, :group_type, :position

    validates_presence_of :title
=begin
    def answers_for_user(user)
      answers = self.answers.where(user_id: user.id)
      answers.any? ? answers : [self.answers.build(user_id: user.id)]
    end
=end
    def self.with_subject(subject)
      if subject.kind_of?(Symbol) or subject.kind_of?(String)
        Questionable::QuestionGroup.where(:group_type => subject ).order(:position)
      else
        Questionable::QuestionGroup.where(:group_type => subject.class.to_s, :group_id => subject.id).order(:position)
      end
    end

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
