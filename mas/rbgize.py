#!/usr/bin/python

from rendertools import filetofield,fieldtofile
from random import random

def main():
	name = "machomom.jpg"
	imgdata = filetofield(name)
	newimgdata =[]
	for tuple in imgdata:
		r,g,b = tuple[0],tuple[1],tuple[2]
		if random() > float(r)/255:
			r=0
		else: r=255
		if random() > float(g)/255:
			g=0
		else: g=255
		if random() > float(b)/255:
			b=0
		else: b=255
		newimgdata.append((r,g,b))
	fieldtofile(newimgdata,rgbmacho,3264,1952)
main()