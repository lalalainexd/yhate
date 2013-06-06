$(document).ready(function(){
  toggleArchives();
  if ($("#filter").is(':visible')) {
    $("#toggleFilter").html("Filters");
  }
  $("#toggleFilter").on("click",toggleArchives);

});

var toggleArchives = function() {
  if ($("#filter").is(':visible')) {
    $("#filter").slideUp();
  }
  else {
    $("#toggleFilters").html("Filters");
    $("#filter").slideDown();
  }
}

$(document).ready( function() {

  $('.category-filter').hide();
  $('.bias-offense-filter').hide();

  $('input[name="filter_by"]').change(function() {

    var radioValue = $(this).val();
    $('.bias-offense-filter').hide();

    if(radioValue == "all") {
      $('.category-filter').hide();
    } else {
      $('.category-filter').show();

      if(radioValue == "offense"){
        $('.bias-categories').hide();
        $('.offense-categories').show();
      } else  {
        $('.bias-categories').show();
        $('.offense-categories').hide();
      }
    }

    console.log(radioValue);

  });

  $('.bias-categories').change(function() {
    if(radioValue == "all") {

    }

  })

  $('a#filter-submit').click(function() {
    console.log("hello");

    return false;
  });

});
