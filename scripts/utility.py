import numpy as np
from PIL import Image


def save_image(img: np.ndarray, path: str) -> None:
    img = Image.fromarray(img)
    img.save(path)


def clamp(val: float, min_: float, max_: float) -> float:
    return max(min(val, max_ - 1), min_)


def softmax(x):
    return np.exp(x) / np.sum(np.exp(x))
