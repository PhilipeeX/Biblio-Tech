require 'tty-spinner'
require 'rake'

namespace :dev do
  desc "Drop, create, migrate and seed the database for development environment"
  task reset: :environment do
    spinner = TTY::Spinner.new("[:spinner] Drop the development database...", format: :classic)
    spinner.auto_spin

    begin
      suppress_output { Rake::Task["db:drop"].invoke }
      sleep(1)
      spinner.success("(Database dropped!)")
    rescue => e
      spinner.error("(error) #{e.message}")
      raise
    end

    spinner = TTY::Spinner.new("[:spinner] Creating the database...", format: :classic)
    spinner.auto_spin

    begin
      suppress_output { Rake::Task["db:create"].invoke }
      sleep(1)
      spinner.success("(Database created!)")
    rescue => e
      spinner.error("(error) #{e.message}")
      raise
    end

    spinner = TTY::Spinner.new("[:spinner] Running migrations...", format: :classic)
    spinner.auto_spin

    begin
      suppress_output { Rake::Task["db:migrate"].invoke }
      sleep(1)
      spinner.success("(Database migrated!)")
    rescue => e
      spinner.error("(error) #{e.message}")
      raise
    end

    spinner = TTY::Spinner.new("[:spinner] Seeding the database...", format: :classic)
    spinner.auto_spin

    begin
      suppress_output { Rake::Task["db:seed"].invoke }
      sleep(1)
      spinner.success("(Database seeded!)")
    rescue => e
      spinner.error("(error) #{e.message}")
      raise
    end

    spinner.success("(successful) Reset completed.")
  end

  private

  def suppress_output
    original_stdout, original_stderr = $stdout.clone, $stderr.clone
    $stdout.reopen(File.new('/dev/null', 'w'))
    $stderr.reopen(File.new('/dev/null', 'w'))
    yield
  ensure
    $stdout.reopen(original_stdout)
    $stderr.reopen(original_stderr)
  end
end
