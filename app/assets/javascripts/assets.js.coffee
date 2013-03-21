# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  fnFormatDetails = (nTr) ->
    aData = oTable.fnGetData(nTr)
    sOut = $("#assetdesc_" + aData[1]).val()
    sOut = sOut.replace(/\n/g, "<br/>")
    sOut
    
  oTable = undefined
  oTable = $("#asset_table").dataTable(
    bJQueryUI: true
    sPaginationType: "full_numbers"
    aoColumnDefs: [
      bSortable: false
      aTargets: [0,4, 5, 6]
    ],
    
  )
  $("#purchase_date,#release_date").datepicker
    changeMonth: true
    changeYear: true
    dateFormat: "yy-mm-d"

  $("#asset_table tbody td img").click ->
    nTr = $(this).parents("tr")[0]
    if oTable.fnIsOpen(nTr)
      
      # This row is already open - close it 
      $(this).removeClass("ui-icon ui-icon-circle-minus").addClass "ui-icon ui-icon-circle-plus"
      oTable.fnClose nTr
    else
      
      # Open this row 
      $(this).removeClass("ui-icon ui-icon-circle-plus").addClass "ui-icon ui-icon-circle-minus"
      oTable.fnOpen nTr, fnFormatDetails(nTr), "details"

 