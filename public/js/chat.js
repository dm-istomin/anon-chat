$(document).ready(function() {

  var $chatbox = $('#chatbox');

  var refreshRate = 1000;
  var latestMessageIndex = null;



  checkUpdate();

  function checkUpdate() {
    setTimeout(function() {
      console.log('checking update...');

      $.ajax({
        url: "/chat/latest/" + latestMessageIndex,
        method: "GET",
        dataType: "JSON",
        success: function(response) {
          console.log(response);
          if (response) {
            console.log('appended!')
            $chatbox.append(response['content']);
            latestMessageIndex = response['latest_id']
          };
          checkUpdate();
        },
        error: function(response) {
          alert("ERROR" + response);
          window.location.href = '/chat'
        }
      });


    }, refreshRate);
  }

});
