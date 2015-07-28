from rendertools import *
print "running"
def step(imgfield,n):
    imgfield_2_file(imgfield,'img/0')
    for i in range(1,n+1):
        imgfield = mas(imgfield)
        imgfield_2_file(imgfield,'img/'+str(i))
    return

def mas(imgfield):
    w = imgfield.width
    h = imgfield.height
    newPixels = []
    for y in range(h):
        for x in range(w):
            newPixels.append(imgfield.fingerprintNewPixel(x,y))  # edit this line to change pixel AI
    I = imgvector_2_imgfield(newPixels,w,h)
    return I

a = file_2_imgfield('madewithP.jpg')

step(a,20)
print "done"
# Command line instruction to convert output images to video:
#ffmpeg -framerate 10 -i %d.png -vcodec mpeg4 -y movie.mp4
