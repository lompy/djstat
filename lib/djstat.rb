require "djstat/files"

module Djstat
  class Djstat
    def initialize(dir_name = ".")
      @files = Files.new(dir_name).files
    end

    private

    def files; @files; end
  end
end
