// Generated by CoffeeScript 1.3.3
var $;

$ = ender;

describe("Native adapter", function() {
  var adapter;
  adapter = Opentip.adapters["native"];
  return describe("DOM", function() {
    describe("create()", function() {
      it("should properly create DOM elements from string", function() {
        var elements;
        elements = adapter.create("<div class=\"test\"><span>HI</span></div>");
        expect(elements).to.be.an("object");
        expect(elements.length).to.equal(1);
        return expect(elements[0].className).to.equal("test");
      });
      return it("the created elements should be wrapped", function() {
        var elements, wrapped;
        elements = adapter.create("<div class=\"test\"><span>HI</span></div>");
        wrapped = adapter.wrap(elements);
        return expect(elements).to.equal(wrapped);
      });
    });
    return describe("wrap()", function() {
      return it("should wrap the element in an array", function() {
        var element, wrapped;
        element = document.createElement("div");
        wrapped = adapter.wrap(element);
        return expect(element).to.equal(wrapped[0]);
      });
    });
  });
});
