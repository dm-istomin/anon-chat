$(document).ready(function() {
  var $reveal = $('#reveal-identity');
  var $hide = $('#hide-identity');
  var $identity = $('#user-identity');

  function updateForm(form) {
    form.submit(function(event) {
      event.preventDefault();

      var $target = $(event.target);

      $.ajax({
        url: $target.attr('action'),
        method: $target.attr('method'),
        data: $target.serialize()
      }).done(function(response) {
        var status = $.parseHTML(response);
        $('#identity-status').html(status[0]);
      });
    });

  }

  updateForm($reveal);
  updateForm($hide);
})
