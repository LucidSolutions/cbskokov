<cfoutput>
<div class="banner float_left">
  	<div class="wrap">
  	     <h2>Archive</h2><div class="clear"></div>
  	</div>
</div>
<!--- Body Main --->
	<div class="main float_left">
		<div class="project-wrapper">
			<div class="content-top">
		 		<div class="wrap">
		 			<!--- Title --->
					<h3>Blog Archives - #prc.entriesCount# Record(s)</h3>
					<!--- Archives --->
					<cfif rc.year NEQ 0>
						<p>
							<span class="display-inline-block">
								Year: '#rc.year#'
								<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
								<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
							</span>
							<span class="display-inline-block"><a class="pull-right submit" href="#cb.linkBlog()#" title="Remove filter and view all entries">Remove Filter</a></span>
						</p>
					</cfif>
				</div>
			</div>
			<div class="project">
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preArchivesDisplay" )#
				
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
				#cb.event( "cbui_postArchivesDisplay" )#
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
