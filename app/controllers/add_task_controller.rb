# frozen_string_literal: true

class AddTaskController < ApplicationController
  def index
    require 'todoist'
    require 'rest-client'
    req_name = params['txtName']
    req_email = params['txtEmail']
    req_title = params['txtTitle']
    req_due = params['txtDueDate']
    req_notes = params['taNotes'] || ''
    req_captcha = params['g-recaptcha-response']
    req_raw_priority = params['optP']
    req_priority = 4 - req_raw_priority[1].to_i
    @client = Todoist::Client.create_client_by_token(
      ENV['PAPI_ADDTASK_TODOIST_API_KEY']
    )
    resp = if validation_ok(req_name, req_email, req_title,
                            req_due, req_raw_priority)
             if captcha_ok(req_captcha)
               item = create_item(req_title, req_due, req_priority)
               note = create_note(item, req_name, req_email, req_notes)
               @client.sync_items.collection
               if (note.id.class == Integer) && (item.id.class == Integer)
                 { success: true, err: nil }
               else
                 { success: false, err: 'TODOIST' }
               end
             else
               { success: false, err: 'CAPTCHA' }
             end
           else
             { success: false, err: 'VALIDATION' }
           end
    render json: resp
  end

  private

  def validation_ok(*args)
    validation_map = args.map(&:empty?)
    !validation_map.include?(true)
  end

  def captcha_ok(client_response)
    r = RestClient.post('https://www.google.com/recaptcha/api/siteverify',
                        secret: ENV['PAPI_ADDTASK_RECAPTCHA_SECRET'],
                        response: client_response)
    if r.code == 200
      JSON.parse(r)['success']
    else
      false
    end
  end

  def create_item(content, due, priority)
    @client.sync_items.add(
      content: content,
      due: { string: due },
      priority: priority
    )
  end

  def create_note(item, name, email, notes)
    note_content = <<-ENDCONTENT
      Added by #{name} <#{email}> via cando
      #{notes}
    ENDCONTENT
    note = note_content.lines.map(&:strip).join("\n")
    # noinspection RubyResolve
    @client.sync_notes.add(
      item_id: item.temp_id,
      content: note
    )
  end
end
