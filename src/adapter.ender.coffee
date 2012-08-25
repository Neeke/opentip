# Ender Opentip Adapter
# =====================
#
# Uses ender packages

# Because $ is my favorite character
$ = ender

# Using bean as event handler
bean = require "bean"

# Augment ender
$.ender {
  opentip: (content, title, options) -> new Opentip this, content, title, options
}, true


# And now the class
class Adapter

  name: "ender"

  # Simply using $.domReady
  domReady: (callback) -> $.domReady callback


  # DOM
  # ===

  # Using bonzo to create html
  create: (html) -> $ html


  # Element handling
  # ----------------

  # Wraps the element in ender
  wrap: (element) ->
    element = $ element
    throw new Error "Multiple elements provided." if element.length > 1
    element

  # Returns the unwrapped element
  unwrap: (element) -> $(element).get 0

  # Returns the tag name of the element
  tagName: (element) -> @unwrap(element).tagName

  # Returns or sets the given attribute of element
  attr: (element, attr, value) -> $(element).attr attr, value

  # Returns or sets the given data of element
  data: (element, name, value) -> $(element).data name, value

  # Finds elements by selector
  find: (element, selector) -> $(element).find selector

  # Finds all elements by selector
  findAll: -> @find.apply @, arguments

  # Updates the content of the element
  update: (element, content, escape) ->
    element = $ element
    if escape
      element.text content
    else
      element.html content

  # Appends given child to element
  append: (element, child) -> $(element).append child

  # Add a class
  addClass: (element, className) -> $(element).addClass className

  # Remove a class
  removeClass: (element, className) -> $(element).removeClass className

  # Set given css properties
  css: (element, properties) -> $(element).css properties

  # Returns an object with given dimensions
  dimensions: (element) -> $(element).dim()

  # Returns an object with x and y 
  mousePosition: (e) ->
    pos = x: 0, y: 0

    e ?= window.event

    return unless e?

    if e.pageX or e.pageY
      pos.x = e.pageX
      pos.y = e.pageY
    else if e.clientX or e.clientY
      pos.x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft
      pos.y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop

    pos

  # Returns the offset of the element
  offset: (element) -> 
    offset = $(element).offset()
    delete offset.width
    delete offset.height
    offset

  # Observe given eventName
  observe: (element, eventName, observer) ->
    $(element).on eventName, observer

  # Stop observing event
  stopObserving: (element, eventName, observer) -> $(element).unbind eventName, observer


  # Utility functions
  # =================

  # Creates a shallow copy of the object
  clone: (object) ->
    newObject = { }
    for own key, val of object
      newObject[key] = val
    newObject

  # Copies all properties from sources to target
  extend: (target, sources...) ->
    for source in sources
      for own key, val of source
        target[key] = val
    target


# Add the adapter to the list
Opentip.addAdapter new Adapter