const DOMNodeCollection = require('./dom_node_collection.js');
const queue = [];
document.ready(execute(queue));

function execute(queue) {
  queue.forEach((fn) => {
    fn();
  });
}

function $l(selector) { 
  
  let nodeList; 
  if (typeof selector === "string") {
    nodeList = Array.from(document.querySelectorAll(selector));
  } else if (selector instanceof HTMLElement) {
    nodeList = [selector]; 
  } else if (selector instanceof NodeList){
    nodeList = Array.from(selector);
  } else {
    //push function into an array of functions to be exec
    //document.ready(selector);
    
    return queue.push(selector);
  } 

  return new DOMNodeCollection(nodeList);
}

module.exports = $l;