function updateAll() {
  $.ajax({
    url: "/chat/instant/0",
    method: "GET",
    dataType: "JSON",
    success: function(response) {
      if (response) {
        console.log(response);
        $('#chatbox').html(response['content']);
        latestMessageIndex = response['latest_id'];
      };
    },
    error: function(response) {
      window.location.href = '/chat';
    }
  });
}
