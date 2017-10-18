/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic commenting form for ContentBox
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	CommentForm function init(){
		// Widget Properties
		setName( "CommentForm" );
		setVersion( "1.0" );
		setDescription( "A cool basic commenting form for ContentBox content objects." );
		setAuthor( "Ortus Solutions" );
		setAuthorURL( "https://www.ortussolutions.com" );
		setIcon( "commenting" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The main commenting form widget
	* @content.hint The content object to build the comment form for: page or entry
	*/
	any function renderIt( any content ){
		var event 			= getRequestContext();
		var cbSettings 		= event.getPrivateValue( name="cbSettings" );
		var commentForm 	= "";
		var oCurrentAuthor 	= securityService.getAuthorSession();
		
		// generate comment form
		saveContent variable="commentForm"{
			writeOutput('
			#html.startForm( 
				name 		= "commentForm", 
				action 		= cb.linkCommentPost( arguments.content ), 
				novalidate 	= "novalidate" 
			)#

				#cb.event( "cbui_preCommentForm" )#

				#getModel( "messagebox@cbMessagebox" ).renderIt()#

				#html.hiddenField( name="contentID", value=arguments.content.getContentID() )#
				#html.hiddenField( name="contentType", value=arguments.content.getContentType() )#');
			writeOutput('<div class="to">');
			writeOutput('<input type="text"   name = "author" placeholder="Name (required)" class="text" value="#event.getValue("author",trim(oCurrentAuthor.getName()))#" required="required">');
			writeOutput('<input type="email" name = "authorEmail" placeholder="Email (required)" class="text" value="#event.getValue("authorEmail", oCurrentAuthor.getEmail())#" required="required" style="margin-left: 10px">');
			writeOutput('</div>');
			writeOutput('<div class="text1"><input type="url" name="authorURL" required="required" placeholder="Website (required)" class="text" value="#event.getValue("author",trim(oCurrentAuthor.getName()))#" required="required">');
			writeOutput('<textarea name="content" required="required" value="event.getValue( "content", "" ) required="required" placeholder="Comment (required)""></textarea>');
			writeOutput('</div>');
			writeOutput('#cb.event( "cbui_postCommentForm" )#');
			writeOutput('<div>
					#html.submitButton( name="commentSubmitButton", value="Add a comment", class="submit" )#
				</div>
			#html.endForm()#
			');
		}

		return commentForm;
	}

}
