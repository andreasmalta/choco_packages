
     $.extend({
         config: {
             
             productFullName: "Autodesk Navisworks Installation Guide",
             defaultPage:  "./files/GUID-7BFD69C9-7938-4B06-A540-20F0818BA45A.htm",
             locale: "en_US",

             // Labels (captions).
             

 labels: {
     locateInContent: "Show in Contents",
     addToFavorites: "Add to Favorites",
     home: "Home: Autodesk Navisworks Installation Guide",
     print: "Print Frame",

     tabs: {
         contents: 'Contents',
         index: 'Index',
         favorites: 'Favorites',
         search: 'Search'
     },

     search: {
         searchOptions: 'Search options',
         searchInHelpFor: 'Search help for:',
         anyWord: 'Any word',
         allWords: 'All words',
         phrase: 'Phrase',
         searchInFilesFor: 'Search in files for:',
         otherOptions: 'Other options',
         ignoreCase: 'Ignore case',
         exactWords: 'Exact words',
         highlightWords: 'Highlight words',

         warnings: {
             toManyOccurrences: '',
             refineSearch: 'Please refine your query or try different search method.',
             filteredStopwords: 'Following stop words were filtered -',
             noResultsBegin: 'Your search —',
             noResultsEnd: '— did not match any documents. Suggestions:',
             correctSpelling: 'Make sure all words are spelled correctly.',
             differentKeywords: 'Try different keywords.',
             generalKeywords: 'Try more general keywords.',
             searchOptions: 'Try different search options.'
         }
     },

     favorites: {
         noTopicsAdded: 'There are no topics added to favorites.'
     }
 },


             // Default publication search options.
             searchOptions: { caseInsensitiveEnabled: true, caseSensitiveSwitch: true, wholeWordsEnabled: true, wholeWordsSwitch: true, searchMethod: 'or', highlightEnabled: true, searchInThisBook: true, searchStopWords: 'stop-words.js'},

             // Index options.
             indexOptions: {dataFile:"adsk.indexes-data.js"},

             // UI options.
             

 ui: {
     // Navigation pane tab settings.
     tabs: {
         order: [
             'C','I','S','F'
         ],
         tocEnabled: true,
         indexEnabled: true,
         favoritesEnabled: true,
         searchEnabled: true
     },

     responsive: false,

     // Toolbar button settings.
     tools: {
         order: ['home', 'previous', 'parent', 'following', 'separator',
                 'favorites', 'share', 'separator', 'print'],
         home: true,
         previous: true,
         parent: true,
         following: true,
         favorites: true,
         share: true,
         print: true
     }
 },

 features: {
     tabsbarParent: 'navigation',
     banner: true,
     header: true,
     navigation: true,
     splitter: true,
     breadcrums: true,
     splitter: true
 },


             // Array of book configs.
             books: [],

             // Context ids.
             contextIds: {},

             // Booklists.
             booklist: []
         }
     });
 