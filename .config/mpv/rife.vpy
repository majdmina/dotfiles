import vapoursynth as vs
from vsrife import rife

core = vs.core
clip = video_in

# 1. Extreme 480p Downscale (854x480)
clip = core.resize.Bicubic(clip, width=854, height=480, format=vs.RGBS, matrix_in_s="709")

# 2. Aggressive 4x Multiplier (24fps -> 96fps)
clip = rife(clip, factor_num=2, factor_den=1)

# 3. Output Translation
clip = core.resize.Bicubic(clip, format=vs.YUV420P8, matrix_s="709")
clip.set_output()
