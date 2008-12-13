// ==========================================================================
// Golem.ListItemView
// ==========================================================================

require('core');

/** @class

  (Document Your View Here)

  @extends SC.View
  @author AuthorName
  @version 0.1
*/
Golem.ListItemView = SC.View.extend(
/** @scope Golem.ListItemView.prototype */ {

  emptyElement: '<div></div>',

  content: [],
  contentBindingDefault: SC.Binding.MultipleNotEmpty,

  render: function() {
      var html = [];
      var content = this.get('content');

      // Iterate through the collection and add rows
      html.push(this._renderRowHtml(content));

      // Finally set the innerHTML of the view
      html = html.join('');
      this.set('innerHTML', html);
  }.observes('content'),
  
  _renderRowHtml: function(content) {
      var html = [];

       content.forEach( function(record){
          //  html.push('<tr>');

            var noColumns = record.get('properties').length;
            for (i=0; i < noColumns; i++){
              html.push('<p>');
              html.push(record.get('properties')[i]);
              html.push('</p>');
          };
      });
       return html.join('');
  }

  

}) ;
