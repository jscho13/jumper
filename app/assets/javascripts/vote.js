$(function() {
  var makeAjaxVoteRequest = function(url, data) {
    var request = $.ajax({
      method: "PATCH",
      data: data,
      url: url
    });

    request.done(function(data) {
      var review = $("#review-" + data.id);
      review.find(".helpful").text(data.revup_count);
      review.find(".not-helpful").text(data.revdown_count);
    });
  };
  var onVoteClick = function(event) {
    event.preventDefault();
    // if (document.getElementById("sign-in").innerHTML == '<a href="/users/sign_in">Sign In</a>') {
    //   alert("You need to sign in before you can vote!");
    // };
    var data;
    var reviewButton = $(this);
    if (reviewButton.hasClass("downvote")){
      data = { down: "true", load_javascript: "true"};
    } else {
      data = { up: "true", load_javascript: "true" };
    }
    var form = reviewButton.find("form");
    var url = form.attr("action");

    makeAjaxVoteRequest(url, data);
  }

  $(".upvote").on("click", onVoteClick);
  $(".downvote").on("click", onVoteClick);
});
