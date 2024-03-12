import numpy as np
from colors import apply_gradient_to_img, create_gradient, generate_gradient_colors
from utility import clamp, softmax
from constants import ground_percs, groung_colors, sunset_base_colors_v2, sunset_percs


def create_background(h: float, w: float) -> np.ndarray:
    imga = np.zeros((h, w, 3), dtype=np.uint8)
    return imga


def create_stars(
    background: np.ndarray, h: float, w: float, n_stars: int, star_r: int
) -> np.ndarray:
    deltas = [(0, 0), (0, 1), (1, 0), (-1, 0), (0, -1)]
    angles = [(1, 1), (1, -1), (-1, 1), (-1, -1)]

    rndm_pos_x = np.random.randint(0, w, size=(n_stars, 1))
    rndm_pos_y = np.random.randint(0, h, size=(n_stars, 1))

    rndm_poss = np.hstack((rndm_pos_y, rndm_pos_x))

    for i, j in rndm_poss:
        for r in range(1, star_r):
            for dx, dy in deltas:
                y = i + (dy * r)
                x = j + (dx * r)
                background[clamp(y, 0, h), clamp(x, 0, w)] = [255, 255, 255]
            if r < star_r - 1:
                for dx, dy in angles:
                    y = i + (dy * r)
                    x = j + (dx * r)
                    background[clamp(y, 0, h), clamp(x, 0, w)] = [255, 255, 255]


def create_ground(background: np.ndarray, start_h: float, ground_h: float) -> None:
    heights = [int(ground_h * perc) for perc in ground_percs]

    greens = create_gradient(
        groung_colors,
        heights,
    )
    apply_gradient_to_img(background, start_h, greens)


def create_sky(background: np.ndarray, start_h: float, sky_h: float) -> None:
    heights = [int(sky_h * perc) for perc in sunset_percs]

    colors = create_gradient(sunset_base_colors_v2, heights)

    apply_gradient_to_img(background, start_h, colors)


# def create_sky(background: np.ndarray, start_h: float, sky_h: float) -> None:
#     num_colors_desired = (len(sunset_base_colors) - 1) * 20
#     distributed_colors = generate_gradient_colors(
#         sunset_base_colors, num_colors_desired
#     )[::-1]
#     num_colors = len(distributed_colors)

#     # percs = [0.5, 0.2, 0.1, 0.05, 1]
#     # percs = np.array([[p] * np.round(num_colors / 5).astype(int) for p in percs])
#     # percs = softmax(percs.flatten())
#     percs = np.array([1 / len(distributed_colors)] * len(distributed_colors))
#     heights = (percs * sky_h).astype(int)
#     print(num_colors, len(heights))
#     blues = create_gradient(
#         distributed_colors,
#         heights,
#     )

#     apply_gradient_to_img(background, start_h, blues)
