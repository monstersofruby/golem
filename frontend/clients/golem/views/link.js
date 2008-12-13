// ==========================================================================
// Golem.LinkView
// ==========================================================================

require('core');

/** @class

  (Document Your View Here)

  @extends SC.View
  @author AuthorName
  @version 0.1
*/
Golem.LinkView = SC.View.extend(
/** @scope Golem.LinkView.prototype */ {



  /** The record we want to display. */
  content: null,



  _contentObserver: function() {
    var content = this.get('content') ;
    var value = (content) ? content.get('url') : '(No Value)';
    this.set('asHTML', value) ;
  }.observes('*content.url'),


}) ;
