$(document).ready(function() {
    $('.card').on('click', function () {
      $(this).toggleClass('card__flipped');
    }).find('form').click(function(e) {
      e.stopPropagation();
    });
    $('.card').first().addClass('card-current')
});
