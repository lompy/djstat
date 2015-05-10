module Djstat
  class Stats
    def initialize(files, options = {})
      @files = files.map { |f| file_with_commits_counted(f) }
      @options = default_options.merge(options)
    end

    def stats
      files
        .sort_by { |f| f[options[:sort_by]] }
        .first(options[:first])
        .map { |f| { name: f[:name], stats: get_stats_from(f) } }
    end

    private

    def default_options
      {
        sort_by: :lines_count,
        first: 10,
        months: 12
      }
    end

    def files; @files; end
    def options; @options; end

    def get_stats_from(file)
      (0...months).map do |months_from_now|
        {
          month: Date.strftime('%b %Y')
        }
      end
    end

    def file_with_commits_counted(file)
      
    end
  end
end
