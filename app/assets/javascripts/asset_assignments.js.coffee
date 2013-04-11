# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("input.isAssetUnassigned").each ->
    if $(this).val() == "true"
      $(this).siblings(".retainAsset").hide()
    else
      $(this).siblings(".assignAsset").hide()
      $(this).siblings(".deleteAsset").hide()
      
  $("input#assigned_date").datepicker()
  $("a.assignAsset").click ->
    $("#assignAssetButton").show()
    $("div#assetAssignmentSuccess").hide()
    $("div#error_explanation").hide()
    $("input#asset_id").val('')
    $("input#assigned_date").val('')
    $("select#asset_assignment_assignee_id").val('')
    $("span#assetTypeToBeAssigned").text($(this).parent().siblings(".assetType").text())
    $("span#assetSerialNoToBeAssigned").text($(this).parent().siblings(".serialNo").text())
    $("input#asset_id").val($(this).siblings(".assetId").val())
    $("select#asset_assignment_assignee_id").change ->
      $("input#assignee_name").val($("select#asset_assignment_assignee_id option:selected").text().split("[")[0])
    $("#assignAssetButton").click ->
      $(this).hide()
      $("#assignAssetCloseButton").hide()
  
  window.assetAssignmentSuccess = ()->
    $("div#error_explanation").hide()
    assignedAssetId=$("input#asset_id").val()
    $("a#deleteAsset"+assignedAssetId).hide()
    $("a#assignAsset"+assignedAssetId).hide()
    $("a#retainAsset"+assignedAssetId).show()
    $("#assignAssetButton").hide()
    $("#assignAssetCloseButton").show()
    $("div#assetAssignmentSuccess").show()