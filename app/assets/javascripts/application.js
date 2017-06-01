//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require chartkick
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .


$('body').on('hidden.bs.modal', '.modal', function () {
  $(this).removeData('bs.modal');
});
