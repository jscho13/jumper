$(function() {
  var makeAjaxVoteRequest = function(url, data) {
    var request = $.ajax({
      method: "PATCH",
      data: data,
      url: url
    });

    request.done(function(data) {
      var review = $("#review-" + data.id);
      review.find(".helpful").text("Helpful: " + data.revup_count);
      review.find(".not-helpful").text("Not Helpful: " + data.revdown_count);
    });
  };
  var onVoteClick = function(event) {
    event.preventDefault();
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
