// ==========================================================================
// Golem.Link
// ==========================================================================

require('core');

/** @class

  (Document your class here)

  @extends SC.Record
  @author AuthorName
  @version 0.1
*/
Golem.Link = SC.Record.extend(
/** @scope Golem.Link.prototype */ {

  // TODO: Add your own code here.
  dataSource: Golem.server,
  resourceURL: 'links',
  properties: ['title', 'url', 'votes', 'description'],

	link: function() {
		return "<a href='" + this.url + "'>" + this.title + "</a>"
	}
  
  

}) ;

Golem.Link.allRecords = Golem.Link.collection();