module Questionable
  class Rating < ActiveRecord::Base
    attr_accessible :subject_id, :subject_type, :title, :subject, :current_rating

    belongs_to :subject, :polymorphic => true
    has_many :answers, :dependent => :destroy
    has_many :options, :through => :answers, :source => :option

    def current_rating
      rating = 0.0
      self.options.each do |answer|
        rating += answer.value.to_i * answer.question.coeff
      end
      return rating.round 4
    end
  end
end