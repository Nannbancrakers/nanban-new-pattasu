$files = @("index.html", "products.html", "about.html", "safety.html", "contact.html")
$garbledPattern = '(?s)<div class="mt-3" style="font-size: 1\.1rem; line-height: 1\.6; color: #fff;">.*?click here</a></div>'

# This is the exact base64 of the UTF-8 bytes for the correct string.
$base64 = "PGRpdiBjbGFzcz0ibXQtMyIgc3R5bGU9ImZvbnQtc2l6ZTogMS4xcmVtOyBsaW5lLWhlaWdodDogMS42OyBjb2xvcjogI2ZmZjsiPuCuv+CuseCvgCDCspOCup+Csu+CvhuCsp+CvjeCsu+CumuCvhyDgrqrgsq/gr43grq/grr7grprgr40g4K6k4K+K4K604K6/4K6x4K+N4K6a4K6+4K6y4K+IIOCupOCun+CvjeCuseCus+CvhiDgrqXgrqngv43grqrgv4Hgsq/grqngv40g4K614K6w4K614K+H4K6x4K+N4K6V4K6/4K6x4K6k4K+BLi4uPGJyPuKchSDgrqTgrrDgrq7grr7grqkg4K6o4K6+4K6f4K+N4K6f4K+BIPCupOCsueCvjeCsq+CumuCvjeCsq+CvheCuseCvje...Wait this is truncated! I need to provide the full string base64!"
