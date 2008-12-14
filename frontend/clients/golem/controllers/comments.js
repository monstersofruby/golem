// ==========================================================================
// Golem.CommentsController
// ==========================================================================

require('core');

/** @class

  (Document Your View Here)

  @extends SC.Object
  @author AuthorName
  @version 0.1
  @static
*/
Golem.commentsController = SC.ObjectController.create(
/** @scope Golem.commentsController */ {

  contentBinding: 'Golem.linksController.selection',

	vote: function() {
		this.set('votes', this.get('votes') + 1);
		this.commitChanges();
	}

}) ;
