#!/usr/bin/python

from PIL import Image
from random import choice
from math import sqrt

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
        if x<0 or y<0:
            return ()
        if x+1 > self.width or y+1 > self.height:
            return ()
        return self.pixels[y][x]
    def getNeighbors(self,x,y):
        indexes = [(a,b) for a in [-1,0,1] for b in [-1,0,1]]
        indexes.remove((0,0))
        return [self.getPixel(x+a,y+b) for (a,b) in indexes]
    def modulusNewPixel(self,x,y):
        oldPixel = self.getPixel(x,y)
        neighbors = self.getNeighbors(x,y)
        same = len([n for n in neighbors if n == oldPixel])
        if same%2==0:
            return oldPixel
        else: 
            r = (oldPixel[0]*2*same+17)%256
            b = (oldPixel[1]*2*same+11)%256
            g = (oldPixel[2]*2*same+1)%256
            return (r,b,g)
    def dissolveNewPixel(self,x,y):
        neighbors = removeEmpties(self.getNeighbors(x,y))
        return choice(neighbors)
    def fingerprintNewPixel(self,x,y):
        oldPixel = self.getPixel(x,y)
        neighbors = removeEmpties(self.getNeighbors(x,y))
        dvect = [pixelDistance(oldPixel,a) for a in neighbors]
        return neighbors[dvect.index(max(dvect))]
    def oddsNewPixel(self,x,y):
        if x%1==0:
            return removeEmpties(self.getNeighbors(x,y)[0])
        else:
            return removeEmpties(self,getNeighbors(x,y)[3])

def pixelDistance(a,b):
    r_dist = (a[0]-b[0])**2
    b_dist = (a[1]-b[1])**2
    g_dist = (a[2]-b[2])**2
    return sqrt(r_dist+b_dist+g_dist)
    
def removeEmpties(l):
    noEmpties = []
    for x in l:
        if x!=():
            noEmpties.append(x)
    return noEmpties

def imgvector_2_imgfield(imgvector,width,height):
    return imgfield(imgvector,width,height)

def imgfield_2_file(imgfield,savename):
    w = imgfield.width
    h = imgfield.height
    imgvector = []
    for y in range(h):
        for x in range(w):
            imgvector.append(imgfield.getPixel(x,y))
    imgvector_2_file(imgvector,savename,w,h)

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

def imgvector_2_file(imgvector,savename,width,height):
    # Writes imgvector to savename.png 
    out = Image.new("RGB",(width,height))
    out.putdata(imgvector)
    out.save(str(savename)+'.png')
    return
    
    
    
    
    
    