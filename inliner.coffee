# Kick off the crawl at the body
$ -> $("body").crawl()

# Really don't need to be using jQuery but it was the fastest way to start
# testing my hypothesis
$.fn.crawl = (parentComputed) ->
  $(this).each ->
    computed = getComputedStyle(this)
    difference = {}

    # Go through each attribute and compare the value to the parent. If
    # different, keep in a hash to be applied at the end of the iteration
    for attribute in computed
      value = computed.getPropertyValue(attribute)
      parentValue = parentComputed && parentComputed.getPropertyValue(attribute)

      if value != parentValue
        difference[attribute] = value

    console.log this, difference

    # Apply the difference
    $(this).css difference

    # Crawl all of this node's children
    $(this).children().crawl(computed)
