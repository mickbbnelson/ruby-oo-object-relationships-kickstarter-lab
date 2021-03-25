require "pry"

class Project
    attr_reader :title

    def initialize(title)
        @title = title
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        backer = ProjectBacker.all.select do |back|
            back.project == self
        end
        backer.map do |back|
            back.backer
        end
    end
end