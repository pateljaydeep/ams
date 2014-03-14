# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#asset_purchase_date, #asset_release_date, #asset_make_year").parent().append('<span class="add-on"><i class="icon-calendar"></i></span>')
  $("#purchase_date").datepicker({format: 'yyyy-mm-dd'})
  $("#release_date").datepicker({format:'yyyy-mm-dd'})
  $("#make_year").datepicker({format:'yyyy-mm-dd'})
  $(".clickable").each(() ->
    $(this).click( ()-> window.location = $(this).parent('tr').attr('url') )
  )
