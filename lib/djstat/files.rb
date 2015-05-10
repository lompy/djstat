module Djstat
  class Files
    def initialize(dir_name = ".")
      @dir_name = dir_name
    end

    def files
      @files ||= `git ls-files "#{dir_name}"`
        .split("\n")
        .map { |file_name| get_file(file_name) }
    end

    private

    def dir_name; @dir_name; end

    def get_file(file_name)
      {
        name: file_name,
        lines_count: ::File.foreach(file_name).reduce(0) {|c| c + 1},
        commits: get_commits(file_name)
      }
    end

    def get_commits(file_name)
      `git --no-pager log --follow --pretty=format:"%H%n%an%n%ad" --stat -- "#{file_name}"`
        .split("\n")
        .slice_after("")
        .map { |log_entry| get_commit_from(log_entry) }
    end

    def get_commit_from(log_entry)
      ins_dels_regex = /(\d+)\sinsertion.*(\d+)\sdeletion/
      ins_dels_match = ins_dels_regex.match(log_entry[4]) || [0, 0, 0]
      {
        hash: log_entry[0],
        author: log_entry[1],
        date: ::Date.parse(log_entry[2]),
        insertions: ins_dels_match[1].to_i,
        deletions: ins_dels_match[2].to_i
      }
    end
  end
end
