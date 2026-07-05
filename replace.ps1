$files = @("index_original.html", "products_original.html")
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText("e:\Work\Nanban cracers\$file")
    
    # Replace Titles and Names
    $content = $content -replace "Twins Fancy Crackers", "Twins & Nanban Crackers"
    
    # Fix Navigation Links
    $content = $content -replace 'href="https://twinsfancycrackers.com/products"', 'href="products.html"'
    $content = $content -replace 'href="https://twinsfancycrackers.com/"', 'href="index.html"'
    $content = $content -replace 'href="https://twinsfancycrackers.com"', 'href="index.html"'
    
    # Replace Address
    $content = $content -replace "3/365, Kaliswari Fireworks Opposite, Naranapuram Road, Sivakasi", "பூண்டி மெயின் ரோடு, செம்மேடு, கோவை"
    $content = $content -replace "3/365, Kaliswari Fireworks Opposite,<br>Naranapuram Road, Sivakasi.", "பூண்டி மெயின் ரோடு,<br>செம்மேடு, கோவை."
    
    # Replace Phone Numbers
    $content = $content -replace "\+91\s*84891\s*28929", "+91 76019 99346"
    $content = $content -replace "8489128929", "7601999346"
    
    # Replace Logo
    $content = $content -replace "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg", "images/logo.png"
    
    # Replace Hero Banner (Desktop)
    $content = $content -replace "https://d25j9whgcbyef9.cloudfront.net/storage/images/3522ed96-1025-1000-a79a-c7e3a2ae6473cf52.jpg", "images/ayyappan_banner.png"
    
    # Replace Hero Banner (Mobile)
    $content = $content -replace "https://d25j9whgcbyef9.cloudfront.net/storage/images/352e11f4-1025-1000-81a7-2f0ea3761441b1e6.jpg", "images/ayyappan_banner.png"
    
    # Save the modified file
    $outName = $file -replace "_original", ""
    [System.IO.File]::WriteAllText("e:\Work\Nanban cracers\$outName", $content, [System.Text.Encoding]::UTF8)
}
