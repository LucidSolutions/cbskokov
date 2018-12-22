<style type="text/css">
	.dropdown-menu li{
		width: 100%;
	}
	.dropdown-menu li a{
		padding: 0px !important;
	}
	@media (max-width: 480px){
		.logo {
	    	width: 100%;
	    	float:left;
	    }
	}
	@media (max-width: 736px){
		.navbar-toggle .icon-bar {
			background:black;
		}
	}
</style>
<cfoutput>
	<div class="header float_left">	
       <div class="wrap"> 
       		<cfif cb.themeSetting( 'headerLogo' ) is "">
       			<div class="logo">
					<a href="#cb.linkHome()#" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
				</div>
			<cfelse>
				<div class="logo">
					<a href="#cb.linkHome()#" class="navbar-brand brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#" class="img-responsive"></a>
				</div>
			</cfif>
	         
	        <div class="head-bottom">
			    <div class="container">
			        <div class="navbar-header">
			          	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
				            <span class="sr-only">Toggle navigation</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
			          	</button>	          	
			        </div>
			        <div id="navbar" class="cssmenu collapse navbar-collapse">	       
						<ul class="nav navbar-nav">
							<cfset menuData = cb.rootMenu( type="data", levels="2" )>
							<!--- Iterate and build pages --->
							<cfloop array="#menuData#" index="menuItem">
								<cfif structKeyExists( menuItem, "subPageMenu" )>
									<li class="dropdown">
										<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
										#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
									</li>
								<cfelse>
									<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
										<li class="active">
									<cfelse>
										<li>
									</cfif>
										<a href="#menuItem.link#">#menuItem.title#</a>
									</li>
								</cfif>
							</cfloop>

							<!--- Blog Link, verify active --->
							<cfif ( !prc.cbSettings.cb_site_disable_blog )>
								<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
									<a href="#cb.linkBlog()#">Blog</a>
								</li>
							</cfif>	
						</ul>
			        </div>
			    </div>
			</div>
			<!--- <div class="cssmenu collapse navbar-collapse" id="cb-nav-collapse">
				<ul class="nav navbar-nav navbar-right">
					<cfset menuData = cb.rootMenu( type="data", levels="2" )>
					<!--- Iterate and build pages --->
					<cfloop array="#menuData#" index="menuItem">
						<cfif structKeyExists( menuItem, "subPageMenu" )>
							<li class="dropdown">
								<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a>
								#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
							</li>
						<cfelse>
							<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
								<li class="active">
							<cfelse>
								<li>
							</cfif>
								<a href="#menuItem.link#">#menuItem.title#</a>
							</li>
						</cfif>
					</cfloop>

					<!--- Blog Link, verify active --->
					<cfif ( !prc.cbSettings.cb_site_disable_blog )>
						<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
							<a href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
				</ul>
		    </div> --->
		    <div class="clear"></div>
	   </div>
   	</div>
<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li><a href="#parentLink#"><i class="fa fa-chevron-down"></i> <strong>#parentTitle#</strong></a></li><li role="separator" class="divider"></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>