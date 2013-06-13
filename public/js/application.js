$(document).ready(function() {

  $('.post-vote').on('click', function(e) {
    e.preventDefault();
    var post_id = $(this).attr('href');
    var parent = $(this).closest('li');

    $.ajax({
      type: 'post',
      url: '/posts/vote',
      data: post_id
    }).done(function(response) {
      parent.children('.post-points').remove();
      parent.append(response);
    });
  });

  $('.comment-vote').on('click', function(e) {
    e.preventDefault();
    var comment_id = $(this).attr('href');
    var parent = $(this).closest('div');

    $.ajax({
      type: 'post',
      url: '/comments/vote',
      data: comment_id
    }).done(function(response) {
      parent.children('.comment-points').remove();
      parent.append(response);
    });
  });

});
