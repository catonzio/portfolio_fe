import numpy as np


w, h = 1920, 1920 * 3
ground_h = min(np.floor(h * 0.1).astype(int), 400)
sky_h = np.ceil(h * 0.7).astype(int)
empty_h = h - (ground_h + sky_h)

start_ground = h - ground_h
start_sky = h - (ground_h + sky_h)
start_empty = 0

print(f"ground_h: {ground_h}, sky_h: {sky_h}, empty_h: {empty_h}, h: {h}")
print(
    f"empty: [{start_empty}, {start_empty + empty_h}], sky: [{start_sky}, {start_sky + sky_h}], ground: [{start_ground}, {start_ground + ground_h}]"
)
n_stars = 300  # 30_000
star_r = 3

groung_colors = [
    (65, 152, 10),
    (38, 139, 7),
    (19, 133, 16),
    (17, 124, 19),
    (19, 109, 21),
]
ground_percs = [0.1, 0.1, 0.1, 0.1, 0.6]

sky_colors = [
    # celesti
    (13, 20, 51),
    (27, 41, 102),
    (35, 64, 129),
    (69, 112, 181),
    (96, 140, 205),
    (119, 174, 255),
    # sunset
    # (23, 10, 71),
    # (39, 17, 68),
    # (54, 23, 66),
    # (70, 30, 63),
    # (86, 37, 60),
    # (101, 43, 57),
    # (117, 50, 55),
    # (132, 57, 52),
    # (148, 63, 49),
    # (164, 70, 47),
    # (179, 76, 44),
    # (195, 83, 41),
    # (211, 90, 38),
    # (226, 96, 36),
    # (242, 103, 33),
]
sky_percs = [0.02, 0.05, 0.08, 0.1, 0.12, 0.63]

sunset_base_colors = [
    (241, 103, 31),
    # (200, 27, 38),
    # (155, 15, 95),
    (96, 4, 121),
    (22, 10, 71),
    (20, 20, 20),
    (10, 10, 10),
    (0, 0, 0),
    (0, 0, 0),
]

sunset_base_colors_v2 = [
    (0, 0, 0),
    (1, 0, 21),
    (9, 3, 73),
    (7, 40, 121),
    (27, 34, 100),
    (48, 29, 125),
    (116, 8, 70),
    (161, 0, 42),
    (240, 21, 1),
    (255, 95, 1),
]
sunset_percs = [
    0.1,  # 0.0978681,
    0.1,  # 0.10816098,
    0.1,  # 0.11953637,
    0.1,  # 0.13210812,
    0.1,  # 0.13210812,
    0.1,  # 0.13210812,
    0.1,  # 0.13210812,
    0.1,  # 0.14600205,
    0.1,
    0.1
]


Color.fromRGBO(0, 0, 0, 1),
Color.fromRGBO(1, 0, 21, 1),
Color.fromRGBO(9, 3, 73, 1),
Color.fromRGBO(7, 40, 121, 1),
Color.fromRGBO(27, 34, 100, 1),
Color.fromRGBO(48, 29, 125, 1),
Color.fromRGBO(116, 8, 70, 1),
Color.fromRGBO(161, 0, 42, 1),
Color.fromRGBO(240, 21, 1, 1),
Color.fromRGBO(255, 95, 1, 1),