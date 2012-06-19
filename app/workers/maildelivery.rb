require 'mail'

class Maildelivery
  @queue = :delivery_queue

  def self.perform(mailconfig_id, task_id)
    mailconfig = Mailconfig.find(mailconfig_id)
    task = Task.find(task_id)
    Mail.defaults do
      delivery_method :smtp, { 
        :address => mailconfig.address,
        :port => mailconfig.port,
        :user_name => mailconfig.user_name,
        :password => mailconfig.password,
        :authentication => mailconfig.authentication
      }
    end

    mail = Mail.new do
      from    task.from
      to      task.to
      subject task.template.subject
    end
    mail.html_part do
      content_type task.template.content_type
      body task.template.content
    end

    begin
      mail.deliver!
      puts "#{task.id}: #{mail.to.to_s} sent".to_s
      task.status = "completed"
    rescue
      puts "error: #{task.id}: #{mail.to.to_s} #{$!}"
      task.status = "error"
    end
    task.save
  end
end