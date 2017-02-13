#!/usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Flask, render_template, request, current_app, send_from_directory
import sys
import subprocess
import os

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

        proc = subprocess.Popen(["cat ./tn-qc/results/CPU/temp.txt", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        cpu_temp=out.split("\n")

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

	proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_bt", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_bt_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_wlan0", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_wlan0_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_eth0", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_eth0_items=out.split("\n")

        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_eth1", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_eth1_items=out.split("\n")


	templateData = {
            'test_items': test_items,
            'state_items': state_items,
	    'cpu_items': cpu_items,
	    'cpu_temp': cpu_temp,
	    'lan1_items': lan1_items,
	    'lan2_items': lan2_items,
	    'lan3_items': lan3_items,
	    'lan4_items': lan4_items,
	    'mac_bt_items': mac_bt_items,
            'mac_wlan0_items': mac_wlan0_items,
            'mac_eth0_items': mac_eth0_items,
            'mac_eth1_items': mac_eth1_items,

	}

	return render_template('web/index.html', **templateData)


@app.route("/serial_id",methods=['GET' , 'POST'])
def mac():

	if request.method == 'POST':
		p_cpu_id=request.form['cpu_id']
		#p_backplane_id=request.form['backplane_id']
		p_mac1_id=request.form['mac1_id']
		p_mac2_id=request.form['mac2_id']
		p_mac3_id=request.form['mac3_id']
		p_mac4_id=request.form['mac4_id']

		filepath = "./tn-qc/results/id.txt"
		file = open(filepath,"w")
		file.write(p_cpu_id);
		file.close()

		import os.path

		save_path = './'

		name_of_file = p_cpu_id

		completeName = os.path.join(save_path, name_of_file+".csv")

		file = open(completeName, "w")

		file.write(p_cpu_id + "," + p_mac1_id + "," + p_mac2_id + "," + p_mac3_id + "," + p_mac4_id)

		file.close()

        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_bt", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_bt_items=out.split("\n")
        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_wlan0", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_wlan0_items=out.split("\n")
        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_eth0", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_eth0_items=out.split("\n")
        proc = subprocess.Popen(["cat ./tn-qc/results/getmac/mac_eth1", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        mac_eth1_items=out.split("\n")
	 proc = subprocess.Popen(["cat ./tn-qc/results/id.txt", ""], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        i_cpu_id=out.split("\n")

	templateData = {
            'mac_bt_items': mac_bt_items,
            'mac_wlan0_items': mac_wlan0_items,
            'mac_eth0_items': mac_eth0_items,
            'mac_eth1_items': mac_eth1_items,
	    'mac1_id':mac_eth0_items,
	    'mac2_id':mac_eth1_items,
	    'mac3_id':mac_wlan0_items,
            'mac4_id':mac_bt_items,
	    'i_cpu_id':i_cpu_id,
        }

	return render_template('web/serial_id.html', **templateData)


@app.route('/upload/<path:filename>', methods=['GET', 'POST'])
def download(filename):

    return send_from_directory(directory='./', filename=filename)

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=8080, debug=True, threaded=True)
