$(document).ready(function() {

  var $chatbox = $('#chatbox');
  var $form = $('#user-input form');

  var refreshRate = 1000;
  var latestMessageIndex = 0;


  function checkUpdate() {
    setTimeout(function() {
      console.log('checking update...');
      console.log(latestMessageIndex);

      $.ajax({
        url: "/chat/instant/" + latestMessageIndex,
        method: "GET",
        dataType: "JSON",
        success: function(response) {
          console.log(response);
          if (response) {
            console.log("SUCCESS");
            if (latestMessageIndex === 0) {
              $chatbox.html(response['content']);
            } else {
              $chatbox.append(response['content']);
            };
            latestMessageIndex = response['latest_id']
          };
          checkUpdate();
        },
        error: function(response) {
          window.location.href = '/chat';
        }
      });


    }, refreshRate);
  }

  $form.submit(function(event) {
    event.preventDefault();

    var $target = $(event.target);
    var $textBox = $('#text-box')
    var $submitButton = $('#message-submit-button')

    $submitButton.val('Sending...')

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize(),
    }).done(function() {
      $textBox.val('');
      $submitButton.val('Send')
    })
  });






  checkUpdate();
});
