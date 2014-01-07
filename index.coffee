childproc = require 'child_process'
globule = require 'globule'

exports.process = (node, tree, cb) ->
  files = globule.find node.files
  list = files.join ' '
  e, out, err = childproc.exec! "uglifyjs #{list} -o #{node.out}"
  console.log out
  console.log err
  cb e, out+'\n'+err
