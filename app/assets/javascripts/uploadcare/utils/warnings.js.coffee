{
  namespace,
} = uploadcare

namespace 'uploadcare.utils', (ns) ->

  ns.log = (msg) ->
    if window.console and console.log
      console.log msg
    else
      # Uncomment this to see anything in ie8:
      # $('<div style="display:none!important"/>').text(msg).appendTo('body')

  ns.warn = (msg) ->
    if window.console and console.warn
      console.warn msg
    else
      ns.log "Warning: #{msg}"

  messages = {}
  ns.warnOnce = (msg) ->
    unless messages[msg]?
      messages[msg] = true
      ns.warn(msg)

  common =
    autostore: """
      You have enabled autostore in the widget, but not on the server.
      To use autostore, make sure it's enabled in project settings.

      https://uploadcare.com/accounts/settings/
      """

    publicKey: """
      Global public key not set. Uploads may not work!
      Add this to the <head> tag to set your key:

      <script>
      UPLOADCARE_PUBLIC_KEY = 'your_public_key';
      </script>
      """

  ns.commonWarning = (name) ->
    ns.warnOnce(common[name]) if common[name]?
