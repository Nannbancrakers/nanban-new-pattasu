$files = @("index.html", "products.html", "about.html", "safety.html", "contact.html")
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("e:\Work\Nanban cracers\$file")
    $content = [regex]::Replace($content, '(?s)<p class="copyright">.*?</p>', '<p class="copyright">
				&copy; 2026 Twins & Nanban Crackers. All Rights Reserved. 
				<div class="mt-3" style="font-size: 1.1rem; line-height: 1.6; color: #fff;">ஸ்ரீ தனலெட்சுமி பட்டாசு தொழிற்சாலை தங்களை அன்புடன் வரவேற்கிறது...<br>✅ தரமான நாட்டு பட்டாசுகள்...<br><a href="https://sridhanalakshmifireworks.com/" target="_blank" style="color: var(--theme-color); font-weight: bold; text-decoration: underline;">https://sridhanalakshmifireworks.com/ click here</a></div>
			</p>')
    # Write using UTF8 No BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText("e:\Work\Nanban cracers\$file", $content, $utf8NoBom)
}
