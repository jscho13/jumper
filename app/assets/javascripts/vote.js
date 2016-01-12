// $('.upvote').on('click', function(e) {
//   e.preventDefault();
//
//   debugger;
//
//   var $this = $(this);
//   var selfieId = $this.data('selfie-id');
//
//   $.post('/selfies/' + selfieId + '/upvote')
//    .done(function(resp) {
//       $this.find('.upvote-count').html(resp.upvotes_count);
//    })
// })
