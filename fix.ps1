$files = @("index.html", "products.html", "about.html", "safety.html", "contact.html")
$garbled = '(?s)<div class="mt-3" style="font-size: 1\.1rem; line-height: 1\.6; color: #fff;">.*?click here</a></div>'
$correct = '<div class="mt-3" style="font-size: 1.1rem; line-height: 1.6; color: #fff;">ஸ்ரீ தனலெட்சுமி பட்டாசு தொழிற்சாலை தங்களை அன்புடன் வரவேற்கிறது...<br>✅ தரமான நாட்டு பட்டாசுகள்...<br><a href="https://sridhanalakshmifireworks.com/" target="_blank" style="color: var(--theme-color); font-weight: bold; text-decoration: underline;">https://sridhanalakshmifireworks.com/ click here</a></div>'

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw -Encoding UTF8
        $content = [regex]::Replace($content, $garbled, $correct)
        Set-Content -Path $file -Value $content -Encoding UTF8
        Write-Host "Fixed $file"
    }
}
