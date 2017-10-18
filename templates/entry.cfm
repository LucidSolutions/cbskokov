<cfoutput>
<cfif !isdefined('args.count') >	
	<cfset args.count = 0>
</cfif>
<cfif args.count EQ ceiling(prc.ENTRIESCOUNT/2)>	
</div>	
<div class="blog-right">
</cfif>

<cfset args.count = args.count+1 >
<div class="blog-img" id="post_#entry.getContentID()#">
	<cfif #entry.getfeaturedImageURL()# NEQ ''>
		<a href="#cb.linkEntry( entry )#">
			<div class="single-img"><img src="#entry.getfeaturedImageURL()#" alt=""></div>
		</a>
	</cfif>
	<div class="blog-desc">
		<a href="#cb.linkEntry( entry )#">
			<cfif entry.hasExcerpt()>
				#entry.renderExcerpt()#
				<div class="post-more">
					<a href="#cb.linkEntry( entry )#" title="Read The Full Entry!"><button class="submit">Read More...</button></a>
				</div>
			<cfelse>
				<h5>#entry.getTitle()#</h5>
				<p>#entry.renderContent()#</p>
			</cfif>
		</a>
		<div class="comment">
			<a href="#cb.linkEntry( entry )#"></a>
			<div class="comment-desc">
				#entry.getnumberOfHits()# views /
				Posted by #entry.getAuthorName()# / <a href="#cb.linkEntry( entry )#" title="Read The Full Entry!">#entry.getNumberOfApprovedComments()# Comments</a> / #entry.getDisplayPublishedDate()#
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>

</cfoutput>