
# Installation

1. Visit [here](public/) for access to the various bookmarks. The `.min.js` files are raw links, whereas the `.js` files can be used as chrome code snippets.

# Usage

1. Click bookmarklet to print array of all angular watchers to console
2. To analyze watchers for a component, make `watchMe` into a reference to a DOM element on the page from the console, and then click the bookmarklet. 
```javascript
// Example
watchMe = $('header-bar')[0]
watchMe = $0 // active element in inspector when using chrome
```
3. Bookmarklet extends console with a `console.save(thing, name)` method, where `thing` is an array of objects and `name` is the name of the file to save to. The JSON file can be opened easily using the pandas library in Python or the exploratory.io interface in R.

# Configuration

# Building the extension for yourself

Open your browser console to monitor the output of the script.

```
npm install
gulp bookmark
```

- Add GIFs to document usage
- Note that script will break around over 2000 chars (max URL length) - consider adding character count to bookmarklet log.