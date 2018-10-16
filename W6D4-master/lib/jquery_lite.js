/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("//Dom NODe\n $l = __webpack_require__(/*! ./selector.js */ \"./lib/selector.js\");\n\nclass DOMNodeCollection {\n  \n  constructor(nodeList) {\n    this.nodeList = nodeList; // [HTMLElement, HTMLElement, HTMLElement]\n    \n  }\n\n  html(string = null) {\n    if (string === null) {\n      return this.nodeList[0].innerHTML;\n    }\n    \n    this.each((node) => {\n      node.innerHTML = string;\n    });\n    return this;\n  }\n  \n  attr(attrName, newValue = null) {\n    const attrButt = [];\n    this.each((node) => {\n      if (newValue === null) {\n        attrButt.push(node.attributes.getNamedItem(attrName).value);\n      } else {\n        node.setAttribute(attrName, newValue);\n      }\n    });\n    if (attrButt.length > 0) return attrButt;\n  }\n  \n  empty() {\n    this.html('');\n  }\n  \n  append(collection) {\n    if (!(collection instanceof DOMNodeCollection)) {\n      collection = $l(collection);\n    }\n    const outerHTML = collection.get('outerHTML').join('\\n');  \n    this.html(this.html() + '\\n' + outerHTML);\n  }\n  \n  get(htmlElementAttr) {\n    return this.nodeList.map((node) => {\n      return node[htmlElementAttr];\n    });\n  }\n  \n  removeClass() {\n    this.each((node) => {\n      if (node.className) {\n        node.attributes.removeNamedItem('class');\n      } \n    });\n  }\n  \n  addClass(name) {\n    this.each((node) => {\n      node.className = name;\n    });\n  }\n  \n  each(callback) {\n    this.nodeList.forEach(callback);\n  } \n  \n  children() {\n    const childrens = [];\n    this.each((node) => {\n      childrens.push(...node.children);\n    });\n    return new DOMNodeCollection(childrens);\n  }\n  \n  parent() {\n    const parents = [];\n    this.each((node) => {\n      parents.push(node.parentElement);\n    });\n    return new DOMNodeCollection(parents);\n  }\n  \n  find(selector) {\n    const found = [];\n    this.each((node) => {\n      found.push(...node.querySelectorAll(selector));\n    });\n    return new DOMNodeCollection(found);\n  }\n  \n  remove() {\n    this.each((node) => {\n      node.remove();\n    });\n    this.nodeList = [];\n  }\n  \n  on(eventType, callback) {\n    this.each((node) => {\n      node.addEventListener(eventType, callback);\n    });\n  }\n  \n  off(eventType, callback) {\n    this.each((node) => {\n      node.removeEventListener(eventType, callback);\n    });\n  }\n  \n}\n\nmodule.exports = DOMNodeCollection;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const $l = __webpack_require__(/*! ./selector.js */ \"./lib/selector.js\");\n\n\n\nwindow.$l = $l;\n\n\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ }),

/***/ "./lib/selector.js":
/*!*************************!*\
  !*** ./lib/selector.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\nconst queue = [];\ndocument.ready(execute(queue));\n\nfunction execute(queue) {\n  queue.forEach((fn) => {\n    fn();\n  });\n}\n\nfunction $l(selector) { \n  \n  let nodeList; \n  if (typeof selector === \"string\") {\n    nodeList = Array.from(document.querySelectorAll(selector));\n  } else if (selector instanceof HTMLElement) {\n    nodeList = [selector]; \n  } else if (selector instanceof NodeList){\n    nodeList = Array.from(selector);\n  } else {\n    //push function into an array of functions to be exec\n    //document.ready(selector);\n    \n    return queue.push(selector);\n  } \n\n  return new DOMNodeCollection(nodeList);\n}\n\nmodule.exports = $l;\n\n//# sourceURL=webpack:///./lib/selector.js?");

/***/ })

/******/ });