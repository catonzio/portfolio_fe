def lerp_color(
    color1: tuple[int, int, int], color2: tuple[int, int, int], t: float
) -> tuple[int, int, int]:
    r = int(color1[0] * (1 - t) + color2[0] * t)
    g = int(color1[1] * (1 - t) + color2[1] * t)
    b = int(color1[2] * (1 - t) + color2[2] * t)
    return r, g, b


def create_gradient(
    colors: list[tuple[int, int, int]], heights: list[int]
) -> list[tuple[int, int, int]]:
    assert len(colors) == len(heights)
    gradient = []
    for i in range(len(colors) - 1):
        for j in range(heights[i]):
            t = j / heights[i]
            color = lerp_color(colors[i], colors[i + 1], t)
            gradient.append(color)
    gradient.extend([colors[-1]] * heights[-1])
    return gradient


def generate_gradient_colors(colors, num_colors):
    n = len(colors)
    if n == 0:
        return []
    if num_colors <= n:
        return colors[:num_colors]
    else:
        gradient = []
        for i in range(n - 1):
            start_color = colors[i]
            end_color = colors[i + 1]
            for j in range(num_colors // (n - 1)):
                r = start_color[0] + (end_color[0] - start_color[0]) * j / (
                    num_colors // (n - 1)
                )
                g = start_color[1] + (end_color[1] - start_color[1]) * j / (
                    num_colors // (n - 1)
                )
                b = start_color[2] + (end_color[2] - start_color[2]) * j / (
                    num_colors // (n - 1)
                )
                gradient.append((int(r), int(g), int(b)))
        return gradient


def apply_gradient_to_img(background, start_h, colors):
    for i, color in enumerate(colors):
        background[int(start_h) + i, :] = color
