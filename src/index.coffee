# Only works on pages where angular is loaded!

# getWatchers(element) -> [Watchers]
# Each Watcher object contains keys including
# classes associated with the DOM element the watcher belongs to
# an HTML5 tag type 
# the 'fn' function
# the 'exp' function
# the 'get' function name
# Any ng-{item} attributes

# Function returns an array of Watcher objects. Note these are not references to the actual 
# watchers.
getWatchers = (root) ->
  getElemWatchers = (element) ->
    isolateWatchers = getWatchersFromScope(element.data().$isolateScope, element)
    scopeWatchers = getWatchersFromScope(element.data().$scope, element)
    watchers = scopeWatchers.concat(isolateWatchers)
    angular.forEach element.children(), (childElement) ->
      watchers = watchers.concat(getElemWatchers(angular.element(childElement)))
      return
    watchers

  getWatchersFromScope = (scope, element) ->
    if scope
      x = scope.$$watchers
      elementClasses= element.context.className
      if x
        nWatchers = scope.$$watchers.length
        newList = []
        i = 0
        while i < nWatchers
          y = {}
          y['classes'] = elementClasses
          y['tagType'] = element.context.tagName
          y['fn'] = x[i].fn.name
          y['exp'] = x[i].exp.name
          y['get'] = x[i].get.name
          attributes = element.context.attributes
          j = attributes.length - 1 # Get attribute calling functions
          while j >= 0
            lName = attributes[j].name
            if /^ng-/.test(lName)
              y[lName] = attributes[j].nodeValue
           
            j--
          newList.push y
          i++
      newList or []
    else
      []

  root = angular.element(root or document.documentElement)
  watcherCount = 0
  getElemWatchers root

# Extends console to be able to save arrays of objects as a JSON file.
# Example, given x = [{'name': "john"}, {'name': "steve"}]
# console.save(x, 'object of numbers')
do (console) ->
  console.save = (data, filename) ->
    if !data
      console.error 'Console.save: No data'
      return
    if typeof data == 'object'
      data = JSON.stringify(data, undefined, 4)
    blob = new Blob([ data ], type: 'text/json')
    e = document.createEvent('MouseEvents')
    a = document.createElement('a')
    a.download = filename
    a.href = window.URL.createObjectURL(blob)
    a.dataset.downloadurl = [
      'text/json'
      a.download
      a.href
    ].join(':')
    e.initMouseEvent 'click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null
    a.dispatchEvent e
    return
  return

# Combination of above functions. Could modify to save objects to file system instead.
captureAndLog= (item, name) ->
  d = new Date()
  x = getWatchers()
  console.log(name + ": " + x.length + " watchers")
  console.log(x)
  # console.save(x, name + d.toJSON())

captureAndLog(document.documentElement ,'Entire Page') # Not yet a good way to pass in active item

# watchMe = $('header-bar')[0]
# Watchers for some DOM element tied to variable watchMe
# try 
#   captureAndLog(watchMe, 'watchedElement')
# catch
#   console.log("Set a DOM element to watchMe to get watchers associated with it")
