authors = Author.create(
    [
      {name: 'Jack London', id: 1},
      {name: 'Jane Austen', id: 2}
    ]
  )

TodoItem.create(
    [  
      { 
        id: 1,
        author: authors.first,
        title: 'Explore the wilds',
        description: 'I want to get more in touch with nature so that I can write better novels'
      },

      { 
        id: 2,
        author: authors.first,
        title: 'Get a dog',
        description: 'I need some animal companionship'
      },

      { 
        id: 3,
        author: authors.second,
        title: 'go on dates',
        description: 'It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.'
      },

      { 
        id: 4,
        author: authors.second,
        title: 'read more books',
        description: 'The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.'
      }
    ]
  )