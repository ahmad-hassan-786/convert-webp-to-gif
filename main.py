from sys import argv
from pathlib import Path
from PIL import Image, ImageSequence


def webp2gif(path: Path):
    img = Image.open(path)
    myList = []
    frames: list[Image.Image] = []
    
    for frame in ImageSequence.Iterator(img):
        im2 = Image.new("RGBA", frame.size, (255, 255, 255,0))
        #im2.paste(frame, mask=frame.split()[3])
        bands = frame.split()
        mask = bands[3] if len(bands)>3 else None
        im2.paste(frame, mask=mask)
        frames.append(im2.convert('RGBA'))
        
    frames[0].save(path.with_suffix('.gif'),
                   format='gif',
                   save_all=True,
                   append_images=frames[1:],
                   optimize=True,
                   duration=img.info.get("duration", 10),
                   disposal = 2,
                   loop=img.info.get("loop", 0),
                   quality=100)
    
webp2gif(Path(argv[1]))

