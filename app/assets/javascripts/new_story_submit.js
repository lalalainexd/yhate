$(document).ready(function() {
  $('#new_story').on('ajax:success', function(event, xhr, status) {
      var $form = $(this);
      var $share = $('#share');
      $share.find('.row').last().html("<h3 class='center'>Thank you for sharing your story with us!</h3>");

  })
  .on("ajax:error", function(evt, xhr, status, error){
      var $form = $(this),
          errors,
          errorText;

      try {
        // Populate errorText with the comment errors
        errors = $.parseJSON(xhr.responseText).errors;
      } catch(err) {
        // If the responseText is not valid JSON (like if a 500 exception was thrown), populate errors with a generic error message.
        errors = {message: "Please reload the page and try again"};
      }

      // Build an unordered list from the list of errors
      errorText = "There were errors with the submission: \n<ul>";

      for ( error in errors ) {
        errorText += "<li>" + error + ': ' + errors[error] + "</li> ";
      }

      errorText += "</ul>";

      // Insert error list into form
      $('.new-story-container').find('div.form-errors').html(errorText);
    });
});

