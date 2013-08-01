default: test

cpp:
	haxe compile_cpp.hxml

js:
	haxe compile_js.hxml # generates coopy.js
	cat coopy.js scripts/post_node.js > coopy_node.js
	mv coopy_node.js coopy.js

# for node, simpler to bundle coopy_view in with everything else
node: js
	cat coopy.js scripts/coopy_view.js > coopyhx.js

test: js
	./scripts/run_tests.sh
	@echo "=============================================================================="

csv2html: js
	./scripts/assemble_csv2html.sh

doc:
	haxe -xml doc.xml compile_js.hxml
	haxedoc doc.xml -f coopy
	# 
	# result is in index.html and content directory


cpp_pack:
	haxe compile_cpp_for_package.hxml