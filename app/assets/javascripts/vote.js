var makeAjaxRequestPost = function(reviewButtonTo, venueID, reviewId, voteType) {
  var request = $.ajax({
    method: 'PATCH',
    data: { up: voteType },
    url: '/api/venues/' + venueID + '/reviews/' + reviewId
  });

  request.done(function(data) {
    var review = $('#review-' + data.id)[0]
    review.getElementsByClassName("helpful")[0].innerHTML = "Helpful: " + data.revup_count
    review.getElementsByClassName("not-helpful")[0].innerHTML = "Not Helpful: " + data.revdown_count
  });
};

$('#upvote').on('click', function(event) {
    event.preventDefault();
    var reviewButton = event.target;
    var venueId = reviewButton.baseURI.match(/^(.*?)(\d+)(\D*)$/)[2];
    var reviewButtonTo = $(reviewButton).closest('.button_to');
    var reviewId = $(reviewButtonTo).attr('action').match(/\/(\d+)\//)[1];
    var voteType = "true";

    makeAjaxRequestPost(reviewButtonTo, venueId, reviewId, voteType)
  });

$('#downvote').on('click', function(event) {
    event.preventDefault();
    var reviewButton = event.target;
    var venueId = reviewButton.baseURI.match(/^(.*?)(\d+)(\D*)$/)[2];
    var reviewButtonTo = $(reviewButton).closest('.button_to');
    var reviewId = $(reviewButtonTo).attr('action').match(/\/(\d+)\//)[1];
    var voteType = "true";

    makeAjaxRequestPost(reviewButtonTo, venueId, reviewId, voteType)
  });
