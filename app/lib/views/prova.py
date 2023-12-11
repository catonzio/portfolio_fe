import os
from os.path import join as j

def capitalize(s):
	return s[0].upper() + s[1:]

sections = ['about', 'projects', 'contact']
files = ['', 'Desktop', 'Mobile', 'Tablet']

default_content = """
import 'package:flutter/material.dart';

class {0} extends StatelessWidget °
  const {0}(°super.key§);

  @override
  Widget build(BuildContext context) °
    return Container(
    	color: Colors.red,
    	child: const Column(
    	children: [
    		Text("{0}", style: TextStyle(fontSize: 50)),
    	])
    );
  §
§
"""

main_content = """
import 'package:flutter/material.dart';
import 'package:portfolio/views/{low}/{low}_desktop.dart';
import 'package:portfolio/views/{low}/{low}_mobile.dart';
import 'package:portfolio/views/{low}/{low}_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class {up}Page extends StatelessWidget °
  const {up}Page(°super.key§);

  @override
  Widget build(BuildContext context) °
    return const Responsive(
      mobile: {up}Mobile(),
      desktop: {up}Desktop(),
      tablet: {up}Tablet(),
    );
  §
§

"""

def write_page(path, content):
	try:
		with open(path, 'w') as f:
			f.write(content.replace('°', '{').replace('§', '}'))
		print("done.")
	except Exception as e:
		print("error.")
		print(e)

for section in sections:
	os.makedirs(section, exist_ok=True)
	for file in files:
		file_name = f"{section}_{file.lower()}.dart" if file else f"{section}.dart"
		class_name = f"{capitalize(section)}{file}"
		cont = default_content.format(class_name) if file else main_content.format(low=class_name.lower(), up=class_name)
		print("Writing " + file_name, end="... ")
		write_page(j(section, file_name), cont)
	print()