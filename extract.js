const fs = require('fs');

const filePath = 'C:\\Users\\DELL\\.gemini\\antigravity\\brain\\dbff3ff5-b550-4cfd-b94d-49619dbc6750\\.system_generated\\steps\\26\\content.md';
const content = fs.readFileSync(filePath, 'utf-8');

const parts = content.split('<div class="row mb-5" id="category-');
const data = [];

for (let i = 1; i < parts.length; i++) {
    const part = parts[i];
    const catMatch = part.match(/<h4[^>]*>(.*?)<\/h4>/);
    if (!catMatch) continue;
    const categoryName = catMatch[1].trim();
    
    const products = [];
    const rows = part.split('<tr id="product-');
    
    for (let j = 1; j < rows.length; j++) {
        const row = rows[j];
        
        const nameMatch = row.match(/data-product-name="(.*?)"/);
        if (!nameMatch) continue;
        const name = nameMatch[1].trim();
        
        const imgMatch = row.match(/data-product-image="(.*?)"/);
        const img = imgMatch ? imgMatch[1].trim() : "";
        
        const contentMatch = row.match(/<td class="text-muted hide_small">(.*?)<\/td>/);
        const qty = contentMatch ? contentMatch[1].trim() : "";
        
        const actualPriceMatch = row.match(/<td class="text-decoration-line-through text-muted hide_small">\s*&#8377;\s*([\d\.]+)/);
        const actualPrice = actualPriceMatch ? actualPriceMatch[1] : "";
        
        const priceMatch = row.match(/<td class="fw-bold text-success[^>]*>\s*&#8377;\s*([\d\.]+)/);
        const price = priceMatch ? priceMatch[1] : "";
        
        products.push({ name, image: img, quantity: qty, actual_price: actualPrice, price });
    }
    
    data.push({ category: categoryName, products });
}

fs.writeFileSync('products.json', JSON.stringify(data, null, 4));
console.log(`Extracted ${data.length} categories.`);
