import numpy as np
from constants import ground_h, h, n_stars, sky_h, star_r, w
from generators import create_background, create_ground, create_sky, create_stars
from utility import save_image

IMG_NAME = "outputs/stars_sunset.png"


def main():
    imga: np.ndarray = create_background(h, w)
    # create_stars(imga, h - ground_h, w, n_stars, star_r)
    create_ground(imga, start_h=h - ground_h, ground_h=ground_h)
    create_sky(imga, start_h=h - (ground_h + sky_h), sky_h=sky_h)
    save_image(imga, IMG_NAME)


if __name__ == "__main__":
    main()
