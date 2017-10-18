<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_BeforeSideBar")#
	
	<!--- <div class="sidebar-nav">
		<ul>
			#cb.subPageMenu( page=cb.getCurrentPage(), type="li" )#
		</ul>
	</div> --->
	<div class="project-list">	
		<ul class="blog-list">
			<li><img src="#cb.themeRoot()#/includes/images/arrow.png" alt=""><p>#cb.subPageMenu( page=cb.getCurrentPage())#</p>
			
		</ul>
	</div>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterSideBar")#
</cfoutput>