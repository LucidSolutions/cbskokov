<cfoutput>
<div class="banner float_left">
  	<div class="wrap">
  	     <h2>Blog</h2><div class="clear"></div>
  	</div>
</div>

<!--- Body Main 
	<div class="container">	
		<div class="row">--->
	<div class="main float_left">
		<div class="project-wrapper">
			<div class="content-top">
		 		<div class="wrap">
					<!--- Are we filtering by category? --->
					<cfif len( rc.category )>
						<p class="infoBar">
							<span class="display-inline-block">Category Filtering: '#rc.category#'</span>
							<span class="display-inline-block"><a href="#cb.linkBlog()#" class="submit" title="Remove filter and view all entries">Remove Filter</a></span>
						</p>
					</cfif>
					<!--- Are we searching --->
					<cfif len( rc.q )>
						<p>
							<span class="display-inline-block">Searching by: '#rc.q#'</span>
							<span class="display-inline-block"><a class="submit" href="#cb.linkBlog()#" title="Clear search and view all entries">Clear Search</a></span>
						</p>
					</cfif>
				</div>
			</div>
			<div class="project">
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preIndexDisplay" )#
					
				<div class="blog-left">					
					#cb.quickEntries()#	
				</div>

		   		<div class="clear"></div>
		   		<cfif prc.entriesCount>
					<ul class="dc_pagination dc_paginationA dc_paginationA06">
					    #cb.quickPaging()#
				   	</ul>
				</cfif>
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postIndexDisplay" )#
	 		</div>
			<!--- SideBar --->
			<cfif args.sidebar>
				<div class="project-sidebar">
			 		#cb.quickView( view='_blogsidebar', args=args )#			
				</div>
			</cfif>
		</div>
	</div>	 	
</cfoutput>