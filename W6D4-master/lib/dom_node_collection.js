//Dom NODe
 $l = require('./selector.js');

class DOMNodeCollection {
  
  constructor(nodeList) {
    this.nodeList = nodeList; // [HTMLElement, HTMLElement, HTMLElement]
    
  }

  html(string = null) {
    if (string === null) {
      return this.nodeList[0].innerHTML;
    }
    
    this.each((node) => {
      node.innerHTML = string;
    });
    return this;
  }
  
  attr(attrName, newValue = null) {
    const attrButt = [];
    this.each((node) => {
      if (newValue === null) {
        attrButt.push(node.attributes.getNamedItem(attrName).value);
      } else {
        node.setAttribute(attrName, newValue);
      }
    });
    if (attrButt.length > 0) return attrButt;
  }
  
  empty() {
    this.html('');
  }
  
  append(collection) {
    if (!(collection instanceof DOMNodeCollection)) {
      collection = $l(collection);
    }
    const outerHTML = collection.get('outerHTML').join('\n');  
    this.html(this.html() + '\n' + outerHTML);
  }
  
  get(htmlElementAttr) {
    return this.nodeList.map((node) => {
      return node[htmlElementAttr];
    });
  }
  
  removeClass() {
    this.each((node) => {
      if (node.className) {
        node.attributes.removeNamedItem('class');
      } 
    });
  }
  
  addClass(name) {
    this.each((node) => {
      node.className = name;
    });
  }
  
  each(callback) {
    this.nodeList.forEach(callback);
  } 
  
  children() {
    const childrens = [];
    this.each((node) => {
      childrens.push(...node.children);
    });
    return new DOMNodeCollection(childrens);
  }
  
  parent() {
    const parents = [];
    this.each((node) => {
      parents.push(node.parentElement);
    });
    return new DOMNodeCollection(parents);
  }
  
  find(selector) {
    const found = [];
    this.each((node) => {
      found.push(...node.querySelectorAll(selector));
    });
    return new DOMNodeCollection(found);
  }
  
  remove() {
    this.each((node) => {
      node.remove();
    });
    this.nodeList = [];
  }
  
  on(eventType, callback) {
    this.each((node) => {
      node.addEventListener(eventType, callback);
    });
  }
  
  off(eventType, callback) {
    this.each((node) => {
      node.removeEventListener(eventType, callback);
    });
  }
  
}

module.exports = DOMNodeCollection;












