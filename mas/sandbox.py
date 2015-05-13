from rendertools import *
import os

def getNewPixel(oldPixel,neighbors):
	same = len([x for x in neighbors if x == oldPixel])
	if same%2==0:
		return oldPixel
	else: 
		r = (oldPixel[0]*same+103)%256
		b = (oldPixel[1]*same+172)%256
		g = (oldPixel[2]*same+231)%256
		return (r,b,g)

def step(imgdata,specials,n):
	newimgdata = mas(imgdata,specials)
	out = Image.new("RGB",(1000,664))
	out.putdata(newimgdata)
	out.save(str(n)+'.png')
	return newimgdata

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

a = file_2_imgfield('fb.jpg')

print a.width
print a.height
print a.getNeighbors(0,0)