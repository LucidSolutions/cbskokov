<cfoutput>
<li>
	<div class="preview">
		<!--- <a name="comment_#comment.getCommentID()#"></a> --->
		<a href="##">#cb.quickAvatar(author=comment.getAuthorEmail(),size=50)#</a>
	</div>
	<div class="data">
		<cfif len(comment.getAuthorURL())>
			<div class="title">
				<strong>#comment.getAuthor()#</strong>
				<a href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#" title="Open #comment.getAuthorURL()#">#comment.getDisplayCreatedDate()#</a>
			</div>
		</cfif>
		<p>#comment.getContent()#</p>                
	</div>
	<div class="clear"></div>
</li>
</cfoutput>