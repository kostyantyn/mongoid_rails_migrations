module MongoidRailsMigrations
  class Generator
    attr_reader :class_name, :dirname

    def initialize(class_name, dirname)
      @class_name, @dirname = class_name, dirname
    end

    def create
      FileUtils.mkdir_p(dirname)

      migration_file = File.join(dirname, next_file_name)
      File.open(migration_file, 'w') do |file|
        file << content
      end
      migration_file
    end

    def next_file_name
      "#{version}_#{class_name}.rb"
    end

    def version
      @version ||= Time.now.utc.strftime("%Y%m%d%H%M%S")
    end

    def content
      "class #{class_name.camelize} < Mongoid::Migration\n" \
      "  def up\n" \
      "  end\n\n" \
      "  def down\n" \
      "  end\n" \
      "end"
    end
  end
end