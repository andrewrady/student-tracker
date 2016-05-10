// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

var ready = function() {
  //$('#rank_checkbox, #phone_checkbox').prop('checked', true);
  //$('.rank_row, .phone_row').hide();

  $('#address_checkbox').on('click', function(){
    if($('#address_checkbox').is(':checked')) {
      $('.address_row').fadeOut('fast');
    } else {
      $('.address_row').fadeIn();
    }
  });

  $('#phone_checkbox').on('click', function(){
    if($('#phone_checkbox').is(':checked')) {
      $('.phone_row').fadeOut('fast');
    } else {
      $('.phone_row').fadeIn();
    }
  });

  $('#rank_checkbox').on('click', function(){
    if($('#rank_checkbox').is(':checked')) {
      $('.rank_row').fadeOut('fast');
    } else {
      $('.rank_row').fadeIn();
    }
  });

  $('#amount_checkbox').on('click', function(){
    if($('#amount_checkbox').is(':checked')) {
      $('.amount_row').fadeOut('fast');
    } else {
      $('.amount_row').fadeIn();
    }
  });

  if($('#student_status').val() == 'trail') {
    var today = Date.parse('today').add(35).days();
    var finalDate = (today.getMonth()+ 1) + '/' + today.getDate() + '/' + today.getFullYear();
    $('#student_trail').val(finalDate);
  } else {
      $('#student_trail').val('');
  }

  $('#student_status').change(function(){
    if($('#student_status').val() == 'trail') {
      var today = Date.parse('today').add(35).days();
      var finalDate = (today.getMonth()+ 1) + '/' + today.getDate() + '/' + today.getFullYear();
      $('#student_trail').val(finalDate);
    } else {
        $('#student_trail').val('');
    }
  });

  $(function(){ $(document).foundation(); });

$(function(){ $(document).foundation(); });

}

$(document).ready(ready);
$(document).on('page:load', ready);

