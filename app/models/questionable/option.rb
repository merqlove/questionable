module Questionable
  class Option < ActiveRecord::Base
    attr_accessible :note, :position, :question_id, :title, :value

    belongs_to :question

    validates_presence_of :title, :question_id
  end
end
