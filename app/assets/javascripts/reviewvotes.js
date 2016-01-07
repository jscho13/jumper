$(document).ready(function() {
  $('ul').on('click', 'button', function(event) {
    event.preventDefault();

    var button_id = this["id"];
    button_id.addEventListener("click", deleteGroceryViaAjax(button_id), false);
  })

//   $('form').submit(function(event) {
//     event.preventDefault();
//     var grocery = $("#grocery_name").val();
//
//     if (grocery){
//       submitGroceryViaAjax(grocery);
//     } else {
//       alert("Enter an item name, please.")
//     }
//   });
// });

// var submitGroceryViaAjax = function(grocery) {
//   var request = $.ajax({
//     method: "POST",
//     url: "/groceries",
//     data: {name: grocery}
//   });
//
//   request.done(function() {
//     $("ul").append("<li class='item' id=" + grocery + "_list" + ">" + grocery + ' <button class="delete_item" id=' + grocery + '>Delete</button>' + "</li>")
//   });
// }

var updateVoteCount = function(vote_id) {
  var request = $.ajax({
    method: "UPDATE",
    url: "/venues",
    data: {id: vote_id}
  });

  request.done(function() {
    debugger;
    $( "li" ).remove("#" + grocery_id + "_list");
  });
}

//
// jQuery(document).ready(function($){
//     $('.arrow').click(function(){ //if your upvote has class arrow?
//         //you need someway of passing postid to here!
//         //if you want up / downvote -- logic needed here, if not remove direction from below!
//
//         $.ajax({
//            type: "POST",
//            url: "/wp-admin/admin-ajax.php",
//
//            data: {
//               action: 'upvote',
//               id: id,
//               direction: direction //remove if not needed
//            },
//
//            success: function (output) { //do something with returned data
//
//               console.log(output);
//               jQuery('#postupvote').text(output); //write to correct id - maybe use postid in the id of the vote count on the page e.g. id="vote23" jQuery('#vote'+postid)
//         }
//
//
//         });
//     });
//
// })
