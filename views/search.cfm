<cfoutput>
<div class="banner float_left">
  	<div class="wrap">
  	     <h2>Search Results</h2><div class="clear"></div>
  	</div>
</div>
<div class="main float_left search">	
	<div class="project-wrapper float_left">
		<div class="wrap">
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_prePageDisplay" )#
			<!--- Search Results --->
			#cb.getSearchResultsContent()#
			<ul class="dc_pagination dc_paginationA dc_paginationA06">
			    #cb.quickSearchPaging()#
		   	</ul>
		   	<!--- ContentBoxEvent --->
			#cb.event( "cbui_postPageDisplay" )#		
		</div>
	</div>
</div>

	
</cfoutput>