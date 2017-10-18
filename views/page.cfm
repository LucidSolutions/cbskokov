<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">
<div class="banner float_left">
  	<div class="wrap">
  	     <h2>#prc.page.getTitle()#</h2><div class="clear"></div>
  	</div>
</div>
<div class="main float_left">	
	<div class="project-wrapper">
		<div class="wrap">
			<!--- ContentBoxEvent --->
			#cb.event( "cbui_prePageDisplay" )#
			<div class="section group">
				<!--- Render Content --->
				<p>#prc.page.renderContent()#</p>
			</div>
			<div class="comment">
				<div class="comment-desc">
					<a href="#cb.linkEntry( prc.page )#"></a>
					#prc.page.getnumberOfHits()# views /
					Posted by #prc.page.getAuthorName()# / #prc.page.getDisplayPublishedDate()#
				</div>
			</div>
			<cfif cb.isCommentsEnabled( prc.page )>
				<div class="blog-comment">
		      		<h5>#prc.entry.getNumberOfApprovedComments()# Comments</h5><div class="clear"></div>
		      		#html.anchor( name="comments" )#
		      		<div class="clear"></div>
		      		<ul class="list">
		      			#cb.quickComments()#
		      		</ul>
		      	</div>
		      	<h5 class="leave">Leave a Comment</h5><div class="clear"></div>
					#cb.quickCommentForm( prc.page )#
			</cfif>
			<!--- ContentBoxEvent --->
			#cb.event("cbui_postPageDisplay")#
        </div>
        <!--- <cfif args.sidebar and !cb.isHomePage()>
			<div class="project-sidebar">
		 		#cb.quickView( view='_pagesidebar' )#
			</div>
		</cfif> --->
		<div class="clear"></div>
	</div>
</div>
<!--- Body Main --->
<!---<section id="body-main">
	<div class="container">

		<!--- Export and Breadcrumbs Symbols --->
		 <cfif !args.print AND !isNull( "prc.page" ) AND prc.page.getSlug() neq cb.getHomePage()>
			<!--- Exports --->
			<div class="btn-group pull-right">
				<button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Export Page...">
					<i class="fa fa-print"></i> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#cb.linkPage( cb.getCurrentPage() )#.print" target="_blank">Print Format</a></li>
					<li><a href="#cb.linkPage( cb.getCurrentPage() )#.pdf" target="_blank">PDF</a></li>
				</ul>
			</div>

			<!--- BreadCrumbs --->
			<div id="body-breadcrumbs" class="col-sm-12">
				<i class="fa fa-home"></i> #cb.breadCrumbs( separator="<i class='fa fa-angle-right'></i> " )#
			</div>
		</cfif> 
	</div>
</section>--->
</cfoutput>