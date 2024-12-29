# Useful methods to run TimescaleDB in you Ruby app.
module Timescaledb
  # Migration helpers can help you to setup hypertables by default.
  module CommandRecorder
    def create_continuous_aggregates(*args)
      record(:create_continuous_aggregates, args)
    end

    def invert_create_continuous_aggregates(args)
      [:drop_continuous_aggregates, args.first]
    end
  end
end
ActiveRecord::Migration::CommandRecorder.include Timescaledb::CommandRecorder
