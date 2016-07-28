
# Installation
<a href="javascript:(function()%7Bvar%20captureAndLog%2CgetWatchers%3BgetWatchers%3Dfunction(e)%7Bvar%20t%2Cn%2Co%3Breturn%20t%3Dfunction(e)%7Bvar%20o%2Ca%2Cc%3Breturn%20o%3Dn(e.data().%24isolateScope%2Ce)%2Ca%3Dn(e.data().%24scope%2Ce)%2Cc%3Da.concat(o)%2Cangular.forEach(e.children()%2Cfunction(e)%7Bc%3Dc.concat(t(angular.element(e)))%7D)%2Cc%7D%2Cn%3Dfunction(e%2Ct)%7Bvar%20n%2Co%2Ca%2Cc%2Cr%2Cu%2Cl%2Cs%2Cd%3Bif(e)%7Bif(s%3De.%24%24watchers%2Co%3Dt.context.className%2Cs)for(u%3De.%24%24watchers.length%2Cl%3D%5B%5D%2Ca%3D0%3Bu%3Ea%3B)%7Bfor(d%3D%7B%7D%2Cd.classes%3Do%2Cd.tagType%3Dt.context.tagName%2Cd.fn%3Ds%5Ba%5D.fn.name%2Cd.exp%3Ds%5Ba%5D.exp.name%2Cd.get%3Ds%5Ba%5D.get.name%2Cn%3Dt.context.attributes%2Cc%3Dn.length-1%3Bc%3E%3D0%3B)r%3Dn%5Bc%5D.name%2C%2F%5Eng-%2F.test(r)%26%26(d%5Br%5D%3Dn%5Bc%5D.nodeValue)%2Cc--%3Bl.push(d)%2Ca%2B%2B%7Dreturn%20l%7C%7C%5B%5D%7Dreturn%5B%5D%7D%2Ce%3Dangular.element(e%7C%7Cdocument.documentElement)%2Co%3D0%2Ct(e)%7D%2Cfunction(e)%7Be.save%3Dfunction(t%2Cn)%7Bvar%20o%2Ca%2Cc%3Breturn%20t%3F(%22object%22%3D%3Dtypeof%20t%26%26(t%3DJSON.stringify(t%2Cvoid%200%2C4))%2Ca%3Dnew%20Blob(%5Bt%5D%2C%7Btype%3A%22text%2Fjson%22%7D)%2Cc%3Ddocument.createEvent(%22MouseEvents%22)%2Co%3Ddocument.createElement(%22a%22)%2Co.download%3Dn%2Co.href%3Dwindow.URL.createObjectURL(a)%2Co.dataset.downloadurl%3D%5B%22text%2Fjson%22%2Co.download%2Co.href%5D.join(%22%3A%22)%2Cc.initMouseEvent(%22click%22%2C!0%2C!1%2Cwindow%2C0%2C0%2C0%2C0%2C0%2C!1%2C!1%2C!1%2C!1%2C0%2Cnull)%2Co.dispatchEvent(c)%2Cvoid%200)%3A(e.error(%22Console.save%3A%20No%20data%22)%2Cvoid%200)%7D%7D(console)%2CcaptureAndLog%3Dfunction(e%2Ct)%7Bvar%20n%2Co%3Breturn%20n%3Dnew%20Date%2Co%3DgetWatchers()%2Cconsole.log(t%2B%22%3A%20%22%2Bo.length%2B%22%20watchers%22)%2Cconsole.log(o)%7D%2CcaptureAndLog(document.documentElement%2C%22Entire%20Page%22)%3B%7D)()">Drag Me!</a> (Won't render properly on github as JS links are not allowed.)


Visit [here](public/) for access to the various bookmarks. The `.min.js` files are raw links, whereas the `.js` files can be used as chrome code snippets.

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