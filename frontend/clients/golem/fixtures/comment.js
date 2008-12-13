// ==========================================================================
// Golem.Comment Fixtures
// ==========================================================================

require('core') ;

Golem.FIXTURES = Golem.FIXTURES.concat([

  // TODO: Add your data fixtures here.
  // All fixture records must have a unique guid and a type matching the
  // name of your contact.  See the example below.

  { guid: 1,
    type: 'Comment',
    author: 'Calavera',
    body: 'Ruby rocks!!',
    link: 1,
    updated_at: '2008-01-01 10:00'
  },
  
  { guid: 2,
    type: 'Comment',
    author: 'Cavalle',
    body: 'But merb definetly can',
    link: 2,
    updated_at: '2008-01-01 12:00'
  }

]);
