﻿/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A theme is composed of the following pieces
* 
* /ThemeDirectory
*  + Theme.cfc (The CFC that models your theme implementation)
*  / layouts (The folder that contains layouts in your theme)
*    + blog.cfm (Mandatory layout used for all blog views by convention)
*    + pages.cfm (Mandatory layout used for all pages by convention)
*    + maintenance.cfm (Optional used when in maintenance mode, else defaults to pages)
*    + search.cfm (Optional used when doing searches, else defaults to pages)
*  / views (The folder that contains views for rendering)
*  	 + archives.cfm (MANDATORY: The view used to render out blog archives.)
*  	 + entry.cfm (MANDATORY: The view used to render out a single blog entry with comments, etc.)
*  	 + error.cfm (MANDATORY: The view used to display errors when they ocurr in your blog or pages)
*  	 + index.cfm (MANDATORY: The view used to render out the home page where all blog entries are rendered)
*  	 + notfound.cfm (The view used to display messages to users when a blog entry requested was not found in our system.)
*  	 + page.cfm (MANDATORY: The view used to render out individual pages.)
*  	 + maintenance.cfm (OPTIONAL: Used when in maintenance mode)
* / templates (The folder that contains optional templates for collection rendering that are used using the quick rendering methods in the CB Helper)
* 	 + category.cfm (The template used to display an iteration of entry categories using coldbox collection rendering)
* 	 + comment.cfm (The template used to display an iteration of entry or page comments using coldbox collection rendering)
* 	 + entry.cfm (The template used to display an iteration of entries in the home page using coldbox collection rendering)
* / widgets (A folder that can contain layout specific widgets which override core ContentBox widgets)
* 
* Templates
* Templates are a single cfm template that is used by ContentBox to iterate over a collection (usually entries or categories or comments) and
* render out all of them in uniformity.  Please refer to ColdBox Collection Rendering for more information.  Each template recevies
* the following:
* 
* _counter (A variable created for you that tells you in which record we are currently looping on)
* _items (A variable created for you that tells you how many records exist in the collection)
* {templateName} The name of the object you will use to display: entry, comment, category
*
* Layout Local CallBack Functions:
* onActivation()
* onDelete()
* onDeactivation()
* 
* Settings
* You can declare settings for your layouts that ContentBox will manage for you.
* 
* this.settings = [
* 	{ name="Title", defaultValue="My Awesome Title", required="true", type="text", label="Title:" },
* 	{ name="Colors", defaultValue="blue", required="false", type="select", label="Color:", options="red,blue,orange,gray" }
* ];
* 
* The value is an array of structures with the following keys:
* 
* - name : The name of the setting (required), the setting is saved as cb_layoutname_settingName
* - defaultValue : The default value of the setting (required)
* - required : Whether the setting is required or not. Defaults to false
* - type : The type of the HTMl control (text=default, textarea, boolean, select, color)
* - label : The HTML label of the control (defaults to name)
* - title : The HTML title of the control (defaults to empty string)
* - options : The select box options. Can be a list or array of values or an array of name-value pair structures
* - optionsUDF : The select box options. This points to a UDF that returns a list or array of values or an array of name-value pair structures. Example: getColors not getColors()
* - group : lets you group inputs under a Group name - settings should be in order for groupings to work as expected
* - groupIntro : Lets you add a description for a group of fields
* - fieldDescription : Lets you add a description for an individual field
* - fieldHelp : Lets you add a chunk of HTML for a Modal, openable by the User by clicking on question mark next to the field label. Recommended use is to readFiles from the ./includes/help directory, with a helper function, for example: loadHelpFile( 'cbBootswatchTheme.html' ); 
*/
component{
	// Layout Variables
     this.name       	= "Skokov";
	this.description 	= "Content box theme Skokov";
	this.version		= "1.1.0";
	this.author 		= "Lucid Outsourcing Solutions Pvt. Ltd.";
	this.authorURL		= "https://lucidsolutions.in/";
	// Screenshot URL, can be absolute or locally in your layout package.
	this.screenShotURL	= "screenshot.png";
	// Layout Settings
	this.settings = [
		{ name="headerLogo", 		group="Header", defaultValue="", 		type="text", 	label="Logo URL:", groupIntro="Customize the header section of your theme. You can change the logo and the search field.", fieldDescription="Enter a relative or full url for the website logo. This image is not scaled with html or css, so please size it accordingly. Resize the image to approximately 300x50." },
		// { name="shareLinks", 		group="Header", defaultValue="ra-59ddfdcc3948e67d", type="text",	label="Shows Share Link"},
		{ name="aboutUs", 			group="Footer", defaultValue="Coldfusion Development Company In Jodhpur, India - Lucid Outsourcing Solutions Pvt Ltd provides services like website development jodhpur India", 	type="textarea", label="About Us Text:", groupIntro="Customize the footer of your site."  },
		{ name="socialFB", 			group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Facebook Link", groupIntro="Customize the footer of your site."  },
		{ name="socialg+", 			group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Google+ Link", groupIntro="Customize the footer of your site."  },
		{ name="socialTwitter", 	group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Twitter Link", groupIntro="Customize the footer of your site."  },
		{ name="socialLN", 			group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Linkedin Link", groupIntro="Customize the footer of your site."  },
		{ name="socialYT", 			group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Youtube Link", groupIntro="Customize the footer of your site."  },
		{ name="socialbloger", 		group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Bloger Link", groupIntro="Customize the footer of your site."  },
		{ name="socialrss", 		group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="RSS Link", groupIntro="Customize the footer of your site."  },
		{ name="socialdribble", 	group="Footer", defaultValue="https://lucidsolutions.in/", 	type="text", 	label="Dribble Link", groupIntro="Customize the footer of your site."  },
		{ name="contactInfo", 		group="Footer", defaultValue="STPI, Plot No. CYB-I, Cyber Park ,RIICO Heavy Industrial Area, Near Saras Dairy, Jodhpur-342003", 	type="textarea",label="Contact Info", groupIntro="Customize the footer of your site."  },
		{ name="numberInfo",		group="Footer", defaultValue="+15035935119 ,+91-291-3192333", 	type="textarea",label="Number Info", groupIntro="Customize the footer of your site."  },
		{ name="emailInfo", 		group="Footer", defaultValue="info@lucidsolutions.in", 	type="text", 	label="Email Info", groupIntro="Customize the footer of your site."  },
		{ name="entrySocialicons", 	group="Footer", defaultValue="true", type="boolean",label="Show Social options in single entry", required="false" },
		{ name="showCategoriesBlogSide", group="Blog Sidebar Options", defaultValue="true", type="boolean",		label="Show Categories in Blog Sidebar", 	required="false", groupIntro="By default, you have lots of widgets displayed in the Blog Sidebar. Enable or Disabled those items below." },
		{ name="showRecentEntriesBlogSide", 	group="Blog Sidebar Options", defaultValue="true", type="boolean",	label="Show Recent Enties in Blog Sidebar", 	required="false" },
		{ name="showSiteUpdatesBlogSide", 	group="Blog Sidebar Options", defaultValue="true", type="boolean",	label="Show Site Updates in Blog Sidebar", 	required="false" },
		{ name="showEntryCommentsBlogSide", 	group="Blog Sidebar Options", defaultValue="true", type="boolean",	label="Show Entry Comments in Blog Sidebar", 	required="false" },
		{ name="showArchivesBlogSide", 	group="Blog Sidebar Options", defaultValue="true", type="boolean",	label="Show Archives in Blog Sidebar", 	required="false" },
		{ name="showEntriesSearchBlogSide", 	group="Blog Sidebar Options", defaultValue="true", type="boolean",	label="Show Entries Search in Blog Sidebar", 	required="false" }
	];

	/**
	* Build the swatches options
	*/
	array function getSwatches(){
		return listToArray( "cerulean,cosmo,cyborg,darkly,flatly,green,journal,lumen,paper,readable,sandstone,simplex,slate,spacelab,superhero,united,yeti" );
	}
	
	/**
	*
	*/
	array function getBackgroundPositions(){
		return [ 
			"Top Left",
			"Top Center",
			"Top Right",
			"Middle Left",
			"Middle Center",
			"Middle Right",
			"Bottom Left",
			"Bottom Center",
			"Bottom Right"
		];
	}
	
	/**
	*
	*/
	array function getBootstrapButtonStyles(){
		return [ 
			"default",
			"primary",
			"success",
			"info",
			"warning",
			"danger"
		];
	}
	
	/**
	* loadHelpFile - helper function for loading html help into a variable for modal
	* @helpFileName - the name of the file to read and return
	* @helpFilePath - the relative directory for the help files. Defaulting to ./includes/help/ inside the theme.
	* @return the contents of the file or empty string if the file does not exist
	*/
	function loadHelpFile( required string helpFileName, string helpFilePath='includes/help/' ){
		try {
			var thisPath = getDirectoryFromPath( getMetadata( this ).path ) & arguments.helpFilePath;
			return fileRead( thisPath & arguments.helpFileName );
		} catch( any e ){
			return '';
		}
	}

	/**
	* Call Back when layout is activated
	*/
	function onActivation(){

	}

	/**
	* Call Back when layout is deactivated
	*/
	function onDeactivation(){

	}

	/**
	* Call Back when layout is deleted from the system
	*/
	function onDelete(){

	}
}
