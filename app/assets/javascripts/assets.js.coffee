# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".jquery-ui-date").each ()->
    $this = $(this)
    id = $this.attr('id')
    $this.datepicker(
      altFormat: "yy-mm-d"
      altField: $("##{id}_alt")
    )