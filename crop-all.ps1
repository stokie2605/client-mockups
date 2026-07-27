Add-Type -AssemblyName System.Drawing
function Crop-Image ($source, $dest) {
    $img = [System.Drawing.Image]::FromFile($source)
    $bmp = New-Object System.Drawing.Bitmap($img.Width, [math]::Round($img.Width * 9 / 16))
    $graph = [System.Drawing.Graphics]::FromImage($bmp)
    $rect = New-Object System.Drawing.Rectangle(0, 0, $bmp.Width, $bmp.Height)
    $graph.DrawImage($img, $rect, $rect, [System.Drawing.GraphicsUnit]::Pixel)
    $img.Dispose()
    $bmp.Save($dest, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $bmp.Dispose()
    $graph.Dispose()
}

Crop-Image "C:\Users\Wilshaw\.gemini\antigravity\scratch\client-mockups\compilation\heritage.jpg" "C:\Users\Wilshaw\.gemini\antigravity\scratch\client-mockups\compilation\heritage-crop.jpg"
Crop-Image "C:\Users\Wilshaw\.gemini\antigravity\scratch\client-mockups\compilation\gaming.jpg" "C:\Users\Wilshaw\.gemini\antigravity\scratch\client-mockups\compilation\gaming-crop.jpg"
