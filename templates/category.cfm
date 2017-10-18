<cfoutput>
	<li>
		<img src="#cb.themeRoot()#/includes/images/arrow.png" alt="">
		<p>
			<a href="#cb.linkRSS(category=category)#" title="RSS Feed For #category.getCategory()#"></a>
	<!--- Category --->
			<a href="#cb.linkCategory(category)#" title="Filter by #category.getCategory()#">#category.getCategory()# (#category.getNumberOfPublishedEntries()#)</a>
		</p>
		<div class="clear"></div>
	</li>
</cfoutput>