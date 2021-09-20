authors = Author.create(
    [
      {name: 'Jack London'},
      {name: 'Jane Austen'}
    ]
  )

TodoItem.create(
    [  
      {
        author: authors.first,
        title: 'Explore the wilds',
        description: 'I want to get more in touch with nature so that I can write better novels'
      },

      {
        author: authors.first,
        title: 'Get a dog',
        description: 'I need some animal companionship'
      },

      { 
        author: authors.second,
        title: 'go on dates',
        description: 'It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.'
      },

      { 
        author: authors.second,
        title: 'read more books',
        description: 'The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.'
      }
    ]
  )