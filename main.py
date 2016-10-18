#!/usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Flask, render_template, request
import sys
import subprocess

reload(sys) # Reload does the trick!
sys.setdefaultencoding('UTF8')

app = Flask(__name__)

@app.route("/")
def main():

	proc = subprocess.Popen(["cat ./tn-qc/st7b2.conf;", ""], stdout=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	test_items=out.split("\n")

	proc = subprocess.Popen(["cat ./tn-qc/results", ""], stdout=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	state_items=out.split("\n")

	templateData = {
            'test_items': test_items,
            'state_items': state_items,
	}

	return render_template('web/index.html', **templateData)

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=8080, debug=True)
