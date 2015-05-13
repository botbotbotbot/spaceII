#!/usr/bin/python

from PIL import Image

class imgfield:
	def __init__(self,imgvector,width,height):
		self.width,self.height = width,height
		self.pixels = []
		currentRow = []
		i=0
		while len(imgvector)>0:
			currentPixel = imgvector.pop(0)
			currentRow.append(currentPixel)
			i+=1
			if i==width:
				self.pixels.append(currentRow)
				currentRow=[]
				i=0
	def getPixel(self,x,y):
		if x+1 >= self.width or y+1 >= self.height:
			return ()
		return self.pixels[y][x]
	def getNeighbors(self,x,y):
		indexes = [(a,b) for a in [-1,0,1] for b in [-1,0,1]]
		indexes.remove((0,0))
		print indexes
		return [self.getPixel(x+a,y+b) for (a,b) in indexes]

def file_2_imgfield(filename):
	imgvector,width,height=file_2_imgvector(filename)
	I = imgfield(imgvector,width,height)
	return I

def file_2_imgvector(filename):
	# Creates an imgvector based on filename. Also returns image width and height. 
	img = Image.open(filename)
	width,height = img.size
	data = img.getdata()
	imgvector = []
	for tuple in data:
		imgvector.append(tuple)
	return imgvector,width,height

def imgvector_2_file(imgvector,filename,width,height):
	# Writes imgvector to filename.png 
	out = Image.new("RGB",(width,height))
	out.putdata(imgdata)
	out.save(str(filename)+'.png')
	return