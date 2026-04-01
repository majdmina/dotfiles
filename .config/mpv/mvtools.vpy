import vapoursynth as vs
core = vs.core
# Use the power of those 16 threads
core.num_threads = 16
clip = video_in

# 1. FORCE THE FORMAT
clip = core.std.AssumeFPS(clip, fpsnum=24000, fpsden=1001)
# Ensure we are in a format the CPU loves
clip = core.resize.Point(clip, format=vs.YUV420P8)

# 2. FASTEST MATH
sup  = core.mv.Super(clip, pel=1, hpad=16, vpad=16)
bvec = core.mv.Analyse(sup, isb=True, blksize=32, search=0, chroma=False)
fvec = core.mv.Analyse(sup, isb=False, blksize=32, search=0, chroma=False)

# 3. INTERPOLATE
clip = core.mv.BlockFPS(clip, sup, bvec, fvec, num=60, den=1, mode=0)

clip.set_output()
