import matplotlib.image as img
import numpy as np

def make_white():
    # Load the image
    image_path = "portrait.jpg"  # Replace with the path to your image file
    image = img.imread(image_path)

    # Convert the colors to RGB format
    allowed_colors_rgb = [[9, 9, 9], [8, 8, 8], [7, 7, 7]]

    mask = np.all([image != color for color in allowed_colors_rgb], axis=0)

    mask = mask[:,:,0]
    img2 = np.array(image)
    img2[mask] = [255, 255, 255]

    img.imsave("portrait2.jpg", img2)
    

image_path = "me_buona_cut.png"
image = img.imread(image_path)

print(image.shape)