class NewJobMailer < ApplicationMailer

  require 'mailgun'

  def new_job(job_id)
    @job = Job.find(job_id)

    mg_client = Mailgun::Client.new Rails.application.secrets.mailgun_api_key

    content = "Description: #{@job.description}\nPhone: #{@job.phone}\n#{job_url(@job.id)}"

    message_params = {:from    => 'bob@yougotjob.com',
                  :to      => 'digdugdiggy@gmail.com',
                  :subject => 'Someone has submitted a new job request',
                  :text    => content}

    mg_client.send_message Rails.application.secrets.mailgun_username, message_params

  end
end
