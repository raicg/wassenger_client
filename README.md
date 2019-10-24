# WassengerClient

Ruby client for wassenger.com API (https://wassenger.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wassenger_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wassenger_client

## Usage

First of all you need to create the variable ENV['WASSENGER_TOKEN'] with your token.

### Creating Webhooks:

```ruby
response = WassengerClient::Webhook.post(
name: 'name of the webhook',
url: 'your_website_url.com/webhook',
events: ['message:in:new']
)
```
available events: 'message:in:new', 'message:out:sent', 'message:out:failed'

### Sending Messages:

```ruby
params = {
    phone: '+558499887766',
    message: 'message to send'
}

wassenger_client_response = WassengerClient::Message.post(params)
```
You can use more params, look at the documentation (https://docs.wassenger.com/#operation/createMessage)

### Receiving Messages or Status of Sent Messages:
```ruby
event = WassengerClient::Event.new(params)
message = event.message
```

This code will probably be in a webhook controller and the params will be the parameters received by some request of the wassenger service, you need to create the webhook first.

message get many parameters and they may be different because of the different events of the webhook, here are some of them:
```ruby
text = message['message']
phone_number = message['phone']
status = message['status']
delivery_status = message['deliveryStatus']
retries = message['retries']
sent_at = message['sentAt']
device_id = message['device']
webhook_status = message['webhookStatus']
reference = message['reference']
wassenger_message_id = message['id']
whatsapp_id = message['waId']
user = message['user']
google_account = message['googleAccount']
message_type = message['type']
from_phone_number = message['fromNumber']
received_at  = message['date']
```

You can use the methods below to check what is the event, this may be useful if you create a webhook with more then one event.

```ruby
event = WassengerClient::Event.new(params)
event.in_new? # returns true if the event is 'message:in:new'
event.sent_message? # returns true if the event is 'message:out:sent'
event.failed_message? # returns true if the event is 'message:out:failed'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/raicg/wassenger_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
