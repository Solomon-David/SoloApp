#!/usr/bin/env python3
"""Convert a PNG to a multi-size Windows .ico file using Pillow.
Usage: python tools/convert_icon.py <input_png> <output_ico>
"""
import sys
from pathlib import Path

try:
    from PIL import Image
except Exception as e:
    print("Pillow is not installed. Install it with: python -m pip install pillow")
    raise

if len(sys.argv) < 3:
    print("Usage: python tools/convert_icon.py <input_png> <output_ico>")
    sys.exit(2)

input_path = Path(sys.argv[1])
output_path = Path(sys.argv[2])

if not input_path.exists():
    print(f"Input file not found: {input_path}")
    sys.exit(1)

img = Image.open(input_path).convert("RGBA")
# Typical sizes for Windows icons
sizes = [(256,256), (48,48), (32,32), (16,16)]

# Resize and save
try:
    # Pillow will include all sizes if provided in sizes param
    img.save(output_path, format='ICO', sizes=sizes)
    print(f"Saved ICO to {output_path}")
except Exception as e:
    print("Failed to save ICO:", e)
    sys.exit(1)
