from PIL import Image
import numpy as np

img = Image.open("linkedin.png")
imga = np.array(img)
print(np.min(imga))

for i, r in enumerate(imga):
    for j, c in enumerate(r):
        if np.all(c == [0, 0, 0, 255]):
            print("Found")
            imga[i, j] = [0, 0, 0, 0]

img2 = Image.fromarray(imga)
img2.save("linkedin2.png")

