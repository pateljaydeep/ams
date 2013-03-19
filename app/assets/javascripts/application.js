// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui
//= require dataTables/jquery.dataTables

$(document).ready(function() {
	var oTable;
	
	oTable = $('#asset_table').dataTable({
		"bJQueryUI" : true,
		"sPaginationType" : "full_numbers",
		"aoColumnDefs": [
        {
            'bSortable': false, 
            'aTargets': [ 0,5,6 ]
        }]
	});


	$("#purchase_date,#release_date").datepicker({
		changeMonth : true,
		changeYear : true
	});
	
	function fnFormatDetails ( nTr )
	{
		
	    var aData = oTable.fnGetData( nTr );
	    var sOut = $('#assetdesc_'+aData[1]).val(); 
	    sOut = sOut.replace(/\n/g, '<br/>');
	    return sOut;
	}

	 $('#asset_table tbody td img').click(function () {

        var nTr = $(this).parents('tr')[0];
        if ( oTable.fnIsOpen(nTr) )
        {
            /* This row is already open - close it */
            $(this).removeClass('ui-icon ui-icon-circle-minus').addClass('ui-icon ui-icon-circle-plus');
            oTable.fnClose( nTr );
        }
        else
        {
            /* Open this row */
            $(this).removeClass('ui-icon ui-icon-circle-plus').addClass('ui-icon ui-icon-circle-minus');
            oTable.fnOpen( nTr, fnFormatDetails(nTr), 'details' );
        }
    } );
    
}); 


