#!/usr/bin/python

from PIL import Image
from random import randint,choice,shuffle

def initialization():
	name = raw_input("Please give the image filename: ")
	img = Image.open(name)
	data = img.getdata()
	imgdata = []
	for tuple in data:
		imgdata.append(tuple)
	specials = [choice(imgdata),choice(imgdata),choice(imgdata)]
	return imgdata,specials

def step(imgdata,specials,n):
	newimgdata = mas(imgdata,specials)
	out = Image.new("RGB",(1000,664))
	out.putdata(newimgdata)
	out.save(str(n)+'.png')
	return newimgdata

def isClose(a,b): # Where a and b are pixel tuples.
	if (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2 < 300:
		return True
	else:
		return False

def mas(imgdata,specials):
	n = 0
	imgdata
	shuffle(specials)
	while n < 999 * 663:
		n += 1
		if isClose(imgdata[n],specials[0]):
			imgdata[n],imgdata[(1000+n)%663336] = imgdata[(1000+n)%663336],imgdata[n]
		elif isClose(imgdata[n],specials[1]):
			imgdata[n],imgdata[(n-999)%663336] = imgdata[(n-999)%663336],imgdata[n]
		elif isClose(imgdata[n],specials[2]):
			imgdata[n],imgdata[(n-999)%663336] = imgdata[(n-999)%663336],imgdata[n]
	return imgdata

def main():
	imgdata,specials = initialization()
	n = 0
	while n < 1500:
		n += 1
		imgdata = step(imgdata,specials,n)
		print 'Step',n,'completed.'

main()


