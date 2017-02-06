# @Author: SuperWoods
# @Date:   2016-05-31-08:41:37
# @Email:  st_sister@iCloud.com
# @Last modified by:   SuperMoo
# @Last modified time: 2017-02-06-13:51:51
# @License: MIT
#
# .PHONY: clean
# clean:
# 	rm -r bundle
# ------------------------------------------------------------------------ mkdir

.PHONY: mk
mk:
	mkdir -p bundle
	mkdir -p css
	mkdir -p js
	mkdir -p img
	mkdir -p jade
	mkdir -p local
	mkdir -p sundries

# -------------------------------------------------------------------------- css

.PHONY: css
css:
	mkdir -p bundle
	postcss --watch --use autoprefixer --use postcss-import css/index.css --output bundle/index.min.css
# --------------------------------------------------------------------------- js

.PHONY: js
js:
	mkdir -p bundle
	babel --watch js/index.js --out-file bundle/index.min.js

# ----------------------------------------------------------------------- server

.PHONY: server
server:
	gulp autowatch-jade &
	browser-sync start --server --files='index.html, bundle, css, js, img, jade'

# -------------------------------------------------------------------------- all

.PHONY: all
all:
	make css & make js & make server & wait
