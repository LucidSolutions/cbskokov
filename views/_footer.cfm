<style type="text/css" scope>
.footer-nav .nav>li>a:focus, .nav>li>a:hover{
	background-color: inherit;
}
</style>
<cfoutput>
<div class="footer float_left">
	<div class="footer-top">
	   	<div class="wrap">
		   	<div class="section group">
				<div class="col_1_of_3 span_1_of_3">
					<h3>About Us</h3>
					<cfif cb.themeSetting( "aboutUs" ) NEQ ''>
						<p>#cb.themeSetting( "aboutUs" )#</p>
					</cfif>
					
				</div>
				<div class="col_1_of_3 span_1_of_3">
					 <div class="social-icons">	
					 	<h4>Social Connecting</h4>
						    <ul>
							    <cfif cb.themeSetting( "socialFB" ) NEQ ''>
								  	<li class="facebook"><a href="#cb.themeSetting( "socialFB" )#"><span> </span></a></li>
								</cfif>
								<cfif cb.themeSetting( "socialg+" ) NEQ ''>
								  	<li class="google"><a href="#cb.themeSetting( "socialg+" )#"><span> </span></a></li>
								</cfif>
								<cfif cb.themeSetting( "socialTwitter" ) NEQ ''>
								  	<li class="twitter"><a href="#cb.themeSetting( "socialTwitter" )#"><span> </span></a></li>
								</cfif>
								<cfif cb.themeSetting( "socialLN" ) NEQ ''>
								  	<li class="linkedin"><a href="#cb.themeSetting( "socialLN" )#"><span> </span></a></li>	 
								</cfif>
								<cfif cb.themeSetting( "socialYT" ) NEQ ''>
								  	<li class="youtube"><a href="#cb.themeSetting( "socialYT" )#"><span> </span></a></li>	
								</cfif>
								<cfif cb.themeSetting( "socialbloger" ) NEQ ''>
								  	 <li class="bloger"><a href="#cb.themeSetting( "socialbloger" )#"><span> </span></a></li>
								</cfif>
								<cfif cb.themeSetting( "socialrss" ) NEQ ''>
								  	<li class="rss"><a href="#cb.themeSetting( "socialrss" )#"><span> </span></a></li>	
								</cfif>
								<cfif cb.themeSetting( "socialdribble" ) NEQ ''>
								  	 <li class="dribble"><a href="#cb.themeSetting( "socialdribble" )#"><span> </span></a></li>	
								</cfif>    	
					        </ul>
				     </div>
			    </div>
				<div class="col_1_of_3 span_1_of_3">
					<h3>Contact info</h3>
					<div class="footer-list">
						<ul>
							<cfif cb.themeSetting( "contactInfo" ) NEQ ''>
								<li><img src="#cb.themeRoot()#/includes/images/address.png" alt=""/><p>#cb.themeSetting( "contactInfo" )#</p><div class="clear"></div></li>
							</cfif>
							<cfif cb.themeSetting( "numberInfo" ) NEQ ''>
								<li><img src="#cb.themeRoot()#/includes/images/phone.png" alt=""/><p>Phone: #cb.themeSetting( "numberInfo" )#</p><div class="clear"></div></li>
							</cfif>
							<cfif cb.themeSetting( "emailInfo" ) NEQ ''>
								<li><img src="#cb.themeRoot()#/includes/images/msg.png" alt=""/><p>Email: <span class="yellow"><a href="#cb.themeSetting( "emailInfo" )#">#cb.themeSetting( "emailInfo" )#</a></span></p><div class="clear"></div></li>
							</cfif>
					   </ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
	  	</div>
	</div>
</div>
<div class="footer-bottom float_left">
 	<div class="wrap">
	 	<div class="copy">
		    <p class="copy">
		    	<p>Copyright &copy; #cb.siteName()#.  All rights reserved.</p>
				<p>Powered by ContentBox v#cb.getContentBoxVersion()#</p>
		  	</p>
	    </div>
	 	<div class="footer-nav">
	 		<ul class="nav navbar-nav navbar-right">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif structKeyExists( menuItem, "subPageMenu" )>
						<li class="dropdown">
							<!--- <a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <b class="caret"></b></a> --->
							<a href="#menuItem.link#">#menuItem.title#</a>
							<!--- #buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )# --->
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
	 	<div class="clear"></div>
    </div>
</div>
</cfoutput>
<script type="text/javascript">
$(document).ready(function() {
	var testArea = $('.text1').find('textarea');
	testArea.on("focus",function(){
		setTimeout(function(){
			$('.text1').removeAttr('style');
			$('.text1').css('width','auto');
		},10);
	});
});
</script>