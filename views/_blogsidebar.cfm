<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
	<div class="project-list">
 	 	<div class="search_box">
			#cb.widget( "SearchForm" )#
	 	</div>
	</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
	<div class="project-list">
		<h4>Categories</h4>
		<ul class="blog-list">
			#cb.quickCategories()#
		</ul>
		<div class="clear"></div>
	</div>
</cfif>
<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
	<div class="project-list">
     	<h4>Recent Entries</h4>
     	#cb.widget( 'RecentEntries' )#
	</div>
</cfif>
<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
	<div class="project-list">
     	<h4>Site Updates</h4>
		<ul>
			<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i></a><img src="#cb.themeRoot()#/includes/images/arrow.png" alt=""><p><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!">RSS Feed</a></p></li>
			<div class="clear"></div>
		</ul>
	</div>
</cfif>

<cfif cb.isEntryView()>
	<cfif cb.themeSetting( "showEntryCommentsBlogSide", true )>
		<div class="project-list">
		 	<h4>Entry Comments</h4>
			<ul>
				<li><a href="#cb.linkRSS(comments=true,entry=prc.entry)#" title="Subscribe to our Entry's Comment(s) RSS Feed!"><i class="fa fa-rss"></i></a><img src="#cb.themeRoot()#/includes/images/arrow.png" alt=""><p><a href="#cb.linkRSS(comments=true,entry=prc.entry)#" title="Subscribe to our Entry's Comment(s) RSS Feed!">RSS Feed</a></p></li>
				<div class="clear"></div>
			</ul>
		</div>
	</cfif>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
	<div class="project-list">
		<h4>Archive</h4>
		<ul class="blog-list">
			#cb.widget( "Archives" )#
		</ul>
		<div class="clear"></div>
	</div>
</cfif>

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>