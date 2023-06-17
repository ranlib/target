#!/usr/bin/env python
"""
for samples in input yaml file create json files as input to varpipe
"""
import sys
import os
from pathlib import Path
import yaml
import json
import argparse

parser = argparse.ArgumentParser(prog="create_json", description="create input json file for varpipe")
parser.add_argument("--yaml", "-y", required=True, type=str, help="Input yaml file")
parser.add_argument("--json_template", "-t", required=True, type=str, help="Output json file")
args = parser.parse_args()

if not os.path.isfile(args.yaml):
    print(f"<E> file {args.yaml} does not exist")
    sys.exit(1)
    
if not os.path.isfile(args.json_template):
    print(f"<E> file {args.json_template} does not exist")
    sys.exit(1)
    
with open(args.yaml, "r") as stream:
    try:
        yaml_data = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)  

with open(args.json_template, "r") as stream:
    try:
        json_template = json.load(stream)
    except json.JSONError as exc:
        print(exc)  

json_list = []
for sample, record in yaml_data.items():
    json_template["wf_varpipe.read1"] = record["R1"]
    json_template["wf_varpipe.read2"] = record["R2"]
    json_template["wf_varpipe.outdir"] = record["SAMPL"]
    json_template["wf_varpipe.samplename"] = record["SAMPL"]
    json_template["wf_varpipe.config"] = record["CONFIG"]
    json_template["wf_varpipe.reference"] = record["REFERENCE"]
    json_list.append(json_template.copy())

for item in json_list:
    samplename = item["wf_varpipe.samplename"]
    output_json = Path(samplename + ".json")
    with open(output_json, "w") as f:
        json.dump(item, f, indent=4)
