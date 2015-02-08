# openpgp.initWorker("/assets/openpgp.worker.js")

$ ->
  getKey = () ->
    key = $(".public-key").data('key')
    openpgp.key.readArmored(key)

  $(".fingerprint").text getKey().keys[0].primaryKey.fingerprint


  $("#encrypt").click ->
    k = getKey()
    openpgp.encryptMessage(k.keys, $("#message").val()).then((pgpMessage) ->
        $("#encrypted").val(pgpMessage)
        $("#send").attr("href", "mailto:#{$("#send").data('to')}?subject=Encrypted%20message&body=#{encodeURIComponent(pgpMessage)}")
    ).catch((error) ->
        alert error
    )
