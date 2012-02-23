require 'holmes/version'
require 'execjs'

module Holmes extend self
  def parse(data, options = {})
    context.call('find', data, options)
  end

  def find(src, options = {})
    data   = File.read(src)
    result = parse(data, options)
    raise 'Dynamic require calls' if result['expressions'].any?
    result['strings']
  end

  protected
    def context
      @context ||= backend.compile(script)
    end

    def script
      File.read(File.expand_path('../holmes/require.js', __FILE__))
    end

    def backend
      @backend ||= ExecJS::ExternalRuntime.new(
        :name        => 'Node.js (V8)',
        :command     => ['nodejs', 'node'],
        :runner_path => File.expand_path('../holmes/runner.js', __FILE__)
      )
    end

    def bundled_path
      File.expand_path('../holmes/node_modules', __FILE__)
    end

    ENV['NODE_PATH'] = "#{File.expand_path('node_modules')}:#{bundled_path}:#{ENV['NODE_PATH']}"
end
