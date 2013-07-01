# This automatically runs the unit tests
watch('.*\.coffee') {|match| system "mocha --compilers coffee:coffee-script -R spec test-*.coffee"}
