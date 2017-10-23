<cfoutput>
<div class="banner float_left">
  	<div class="wrap">
  	     <h2>#prc.entry.getTitle()#</h2><div class="clear"></div>
  	</div>
</div>
<div class="main float_left">	
	<div class="single-wrapper">
		<div class="single-blog">
			<!--- ContentBoxEvent --->
			#cb.event("cbui_preEntryDisplay")#
			<cfif #prc.entry.getfeaturedImageURL()# NEQ ''>
				<div class="single-img"><img src="#prc.entry.getfeaturedImageURL()#" alt=""></div>
			</cfif>
			<div class="blog-desc">
				<h5>#prc.entry.getTitle()#</h5>
				<div class="comment">
					<div class="comment-desc">
						#prc.entry.getnumberOfHits()# views /
						Posted by #prc.entry.getAuthorName()# / <a href="#cb.linkEntry( prc.entry )#" title="Read The Full Entry!">#prc.entry.getNumberOfApprovedComments()# Comments</a> / #prc.entry.getDisplayPublishedDate()# / #cb.quickCategoryLinks(prc.entry)#
					</div>
					<div class="clear"></div>
				</div>
			</div>

			<div class="blog-text">
				#prc.entry.renderContent()#
			</div>
			<cfif cb.themeSetting( "entrySocialicons", true )>
				<div class="share-point">
					<div class="point">
						<h5>Share this post</h5>
					</div>
					<div class="social-list">
						<ul>
							<li class="facebook"><a href="https://www.facebook.com/sharer/sharer.php?u=#cb.linkEntry(prc.entry)#"><span> </span></a></li>
						    <li class="google"><a href="https://plus.google.com/share?url=#cb.linkEntry(prc.entry)#"><span> </span></a></li>
						<li class="twitter"><a href="https://twitter.com/home?status=#cb.linkEntry(prc.entry)#"><span> </span></a></li>
						<li class="linkedin"><a href="https://www.linkedin.com/shareArticle?mini=true&url=#cb.linkEntry(prc.entry)#&title=#prc.entry.getTitle()#"><span> </span></a></li>								
						</ul>
				    </div>
					<div class="clear"></div>
				</div>
			</cfif>
			<cfif !args.print>
				<div class="blog-comment">
		      		<h5>#prc.entry.getNumberOfApprovedComments()# Comments</h5><div class="clear"></div>
		      		#html.anchor(name="comments")#
		      		<div class="clear"></div>
		      		<div class="data">
		      			<cfif NOT cb.isCommentsEnabled(prc.entry)>
							<i class="icon-warning-sign icon-2x"></i>
							Comments are currently closed
						</cfif>
		      		</div>
		      		<ul class="list">
		      			#cb.quickComments()#
		      		</ul>
		      	</div>
		      	<h5 class="leave">Leave a Comment</h5><div class="clear"></div>
					#cb.quickCommentForm( prc.entry )#			
			</cfif>	
			#cb.event("cbui_postEntryDisplay")#
        </div>
        <cfif args.sidebar>
			<div class="project-sidebar">
		 		#cb.quickView(view='_blogsidebar', args=args)#
			</div>
		</cfif>
		<div class="clear"></div>
	</div>
</div>
<!--- Body Main --->
<!--- 
	<!--- Export and Breadcrumbs Symbols --->
	<!--- <cfif !args.print AND !isNull( "prc.entry" )>
		<!--- Exports --->
		<div class="btn-group pull-right">
			<button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="Export Page...">
				<i class="fa fa-print"></i> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#cb.linkEntry( prc.entry )#.print" target="_blank">Print Format</a></li>
				<li><a href="#cb.linkEntry( prc.entry )#.pdf" target="_blank">PDF</a></li>
			</ul>
		</div>
	</cfif> --->

	<!--- post --->
	<div class="post" id="post_#prc.entry.getContentID()#">
		<div class="row">
			<div class="col-xs-9 pull-left">
				<i class="fa fa-tag"></i> Tags: #cb.quickCategoryLinks(prc.entry)#
			</div>
		</div>
	</div> --->		
</cfoutput>