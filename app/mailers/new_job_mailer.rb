class NewJobMailer < ApplicationMailer

  require 'mailgun'

  def new_job(job_id)
    @job = Job.find(job_id)

    mg_client = Mailgun::Client.new 'key-590686efd30b60a98524f5615ac40e28'

    content = "Description: #{@job.description}\nPhone: #{@job.phone}\n#{job_url(@job.id)}"

    message_params = {:from    => 'bob@yougotjob.com',
                  :to      => 'digdugdiggy@gmail.com',
                  :subject => 'Someone has submitted a new job request',
                  :text    => content}

    mg_client.send_message 'sandbox363062969a794f9eaebb78c41349cfd7.mailgun.org', message_params

  end
end
