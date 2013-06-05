$(document).ready(function() {
  $('#new_story').on('ajax:error', function(event, xhr, status) {
    var errors = $('ul.form-errors');

    $(this).prepend(xhr.responseText)
  });
  $('#new_story').on('ajax:success', function(event, xhr, status) {
    console.log("SUCCESS");
    $(this).append(xhr.responseText)
  });

});

