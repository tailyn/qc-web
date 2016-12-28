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

	proc = subprocess.Popen(["cat ./tn-qc/result_final", ""], stdout=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	state_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/CPU/usage.txt", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        cpu_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/Switch_LAN/lan1result", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        lan1_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/Switch_LAN/lan2result", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        lan2_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/Switch_LAN/lan3result", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        lan3_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/Switch_LAN/lan4result", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        lan4_items=out.split("\n")


	templateData = {
            'test_items': test_items,
            'state_items': state_items,
	    'cpu_items': cpu_items,
	    'lan1_items': lan1_items,
	    'lan2_items': lan2_items,
	    'lan3_items': lan3_items,
	    'lan4_items': lan4_items,
	}

	return render_template('web/index.html', **templateData)

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=8080, debug=True, threaded=True)
