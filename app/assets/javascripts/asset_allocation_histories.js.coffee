# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("input#returned_date").datepicker({format:'dd/mm/yyyy'})
  $("a.retainAsset").click ->
    $("#retainAssetButton").show()
    $("div#assetRetainmentSuccess").hide()
    $("div#error_explanation_retain").hide()
    $("input#retain_asset_id").val("")
    $("input#returned_date").val("")
    $("span#assetTypeToBeRetained").text($(this).parent().siblings(".assetType").text())
    $("span#assetSerialNoToBeRetained").text($(this).parent().siblings(".serialNo").text())
    $("span#assetAssignedEmployeeName").text($(this).siblings("input.assigneeName").val())
    $("span#assetAssignedEmployeeId").text($(this).siblings("input.assigneeId").val())
    assignedDate = $(this).siblings("input.assignedDate").val()
    assignedDateArr = assignedDate.split("-")
    if(assignedDateArr.length == 3)
      assignedDateFormatted = assignedDateArr[2]+"/"+assignedDateArr[1]+"/"+assignedDateArr[0]
    else
      assignedDateFormatted = assignedDate
    $("span#assetAssignedDate").text(assignedDateFormatted)
    $("input#retain_asset_id").val($(this).siblings(".assetId").val())
    $("#retainAssetButton").click ->
      $(this).hide()
      $("#retainAssetCloseButton").hide()
  
  window.assetRetainmentSuccess = ()->
    $("div#error_explanation_retain").hide()
    
    retainedAssetId=$("input#retain_asset_id").val()
    $("a#deleteAsset"+retainedAssetId).show()
    $("a#assignAsset"+retainedAssetId).show()
    $("a#retainAsset"+retainedAssetId).hide()
    $("input#asset_assigneeName"+retainedAssetId).val("")
    $("input#asset_assigneeId"+retainedAssetId).val("")
    $("input#asset_assignedDate"+retainedAssetId).val("")
    
    $("#retainAssetButton").hide()
    $("#retainAssetCloseButton").show()
    $("div#assetRetainmentSuccess").show()