﻿/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic widget that shows N recent entries
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	RecentEntries function init(){
		// Widget Properties
		setName( "RecentEntries" );
		setVersion( "1.0" );
		setDescription( "A cool basic widget that shows N recent blog entries." );
		setAuthor( "Ortus Solutions" );
		setAuthorURL( "http://www.ortussolutions.com" );
		setIcon( "list" );
		setCategory( "Blog" );
		return this;
	}

	/**
	* Show n recent entries with some cool orderings
	* @max.hint The number of recent entries to show. By default it shows 5
	* @title.hint An optional title to display using an H2 tag.
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The list of categories to filter on
	* @category.multiOptionsUDF getAllCategories
	* @searchTerm.hint The search term to filter on
	* @searchTerm.label Search Term
	* @sortOrder.hint How to order the results, defaults to publishedDate
	* @sortOrder.label Sort Order
	* @sortOrder.options Most Recent,Most Popular,Most Commented
	*/
	any function renderIt(
		numeric max=5,
		title="",
		string titleLevel="2",
		string category="",
		string searchTerm="",
		string sortOrder="Most Recent"
	){
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue( name="cbSettings", private=true );
		
		// Determine Sort Order
		// Determine Sort Order
		switch ( arguments.sortOrder ) {
			case "Most Popular": {
				arguments.sortOrder = "hits DESC";
				break;
			}
			case "Most Commented": {
				arguments.sortOrder = "numberOfComments DESC";
				break;
			}
			default: {
				arguments.sortOrder = "publishedDate DESC";
			}
		}

		var entryResults = variables.entryService.findPublishedContent(
			max       : arguments.max,
			category  : arguments.category,
			searchTerm: arguments.searchTerm,
			sortOrder : arguments.sortOrder,
			siteID    : getSite().getsiteID()
		);

		var rString			= "";

		// iteration cap
		if( entryResults.count lt arguments.max){
			arguments.max = entryResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput( "<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>" ); }
			// UL start
				<!--- <span class="likes"><span class="link"><a href="##">Dec 14, 2013</a></span><a href="##"><img src="#cb.themeRoot()#/includes/images/heart.png" title="likes" alt=""/></a>16</span> --->
			writeOutput('<ul>');
			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				writeOutput('<li><img src="#cb.themeRoot()#/includes/images/arrow.png" alt=""><p><a href="#cb.linkEntry(entryResults.content[ x ])#">#entryResults.content[ x ].getTitle()#</a></p><div class="clear"></div></li>');
			}
			// close ul
			writeOutput( "</ul>" );
		}

		return rString;
	}

	/**
	* Get all the categories
	*/
	array function getAllCategories() cbIgnore{
		return variables.categoryService.getAllNames();
	}

}
