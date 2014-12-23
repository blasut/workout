$(document).ready(function() {
  console.log("nu kör vi!");
  var woa_id = "";

  $('.submit').click(function(e) {
    e.preventDefault();

    var form = $('#exercise_data');
    var post_data = form.serialize() + "&woa_id=" + woa_id; // serverside check for empty woa_id

    console.log(post_data);
    $.post('/add_woa', post_data, function(data) {
      console.log(data, "data from the post");
      woa_id = data;
    });
      
    // Show step1 without datum field
    // Visa knappen "KLAR"
    $('#step_1, .done').show();
    $('.date-field');
    $('input[type!="submit"][type!="date"]').val("");
    $('.name').focus();
  });

  $('.done').click(function(e) {
    e.preventDefault();
    // Show workouts and exercises
    var form = $('#exercise_data');
    var post_data = form.serialize() + "&woa_id=" + woa_id; // serverside check for empty woa_id

    console.log(post_data);
    $.post('/add_woa', post_data, function(data) {
      console.log(data, "data from the post");
      woa_id = data;
      window.location = "/";
    });
  });

});
