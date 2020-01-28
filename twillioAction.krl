
ruleset use_twilio {
  meta {
    key twilio {
          "account_sid": "<your SID goes here>", 
          "auth_token" : "<your auth token goes here>"
    }
    use module twillo_Keys
    use module twilio_do alias twilio
        with account_sid = keys:twilio{"account_sid"}
             auth_token =  keys:twilio{"auth_token"}
  }
 
  rule test_send_sms {
    select when test new_message
    twilio:send_sms(event:attr("to"),
                    event:attr("from"),
                    event:attr("message")
                   )
  }
}