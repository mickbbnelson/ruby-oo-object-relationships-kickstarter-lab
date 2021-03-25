require "pry"

class Backer
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        project = ProjectBacker.all.select do |proj|
            proj.backer == self
        end
        project.map do |proj|
            proj.project
        end
    end

end