window.sharedExampleGroups = {}

window.example = (exampleName, callback) ->
  window.sharedExampleGroups[exampleName] = callback

window.follow = ->
  exampleName  = _.first(arguments)
  exampleArgs  = _.select(_.rest(arguments), (arg) -> !_.isFunction(arg))
  innerBlock   = _.detect(arguments, (arg) -> _.isFunction(arg))
  exampleGroup = window.sharedExampleGroups[exampleName]

  if exampleGroup
    describe exampleName, ->
      exampleGroup.apply this, exampleArgs
      if innerBlock then innerBlock()
  else
    it "cannot find shared behavior: '#{exampleName}'", ->
      expect(false).toEqual(true) # dummy
