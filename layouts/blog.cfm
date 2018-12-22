<cfoutput>
<!--- Global Layout Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">
<!DOCTYPE html>
<html lang="en">
<head>
	<!--- Page Includes --->
	#cb.quickView( "_blogIncludes" )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeHeadEnd" )#
</head>
<body>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_afterBodyStart" )#
	
	<!--- Header --->
	#cb.quickView( view='_header' )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeContent" )#

	<!--- Main View --->
	#cb.mainView( args=args )#

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_afterContent" )#

	#cb.quickView( view='_footer' )#
	
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_beforeBodyEnd" )#
</body>
</html>
</cfoutput>
<script type="text/javascript">
$(document).ready(function() {
	// $('.dc_pagination').find('.row').css('margin-bottom','10px');
	$('.dc_pagination').find('.col-xs-12').addClass('col-md-6');
});

</script>
<style>
.pagination{
	margin:0px;
	width: 100%
}
ul.dc_pagination li:first-child{
	margin-right: 2% !important;
}
ul.dc_pagination li:last-child{
	margin-left: 3% !important;	
}
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
	background-color: #ffea00;
	border-color: #ffea00;
}
</style>