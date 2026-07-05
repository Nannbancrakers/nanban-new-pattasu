document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileToggle = document.getElementById('mobile-toggle');
    const navLinks = document.getElementById('nav-links');

    mobileToggle.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        const icon = mobileToggle.querySelector('i');
        if (navLinks.classList.contains('active')) {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        } else {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    });

    // Products Data (Simulating full extraction from original site)
    const productsData = [
        {
            category: "One Sound Crackers (90% Discount)",
            items: [
                { name: "2.75' Kuruvi", qty: "1 Pkt", actualPrice: 100, price: 10, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "3.5' Lakshmi", qty: "1 Pkt", actualPrice: 150, price: 15, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "4' Lakshmi", qty: "1 Pkt", actualPrice: 200, price: 20, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "4' Spartains Dlx", qty: "1 Pkt", actualPrice: 250, price: 25, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "4' Gold Lakshmi", qty: "1 Pkt", actualPrice: 300, price: 30, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        },
        {
            category: "Bijili Crackers (90% Discount)",
            items: [
                { name: "Red Bijili", qty: "1 Bag", actualPrice: 400, price: 40, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Striped Bijili", qty: "1 Bag", actualPrice: 450, price: 45, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Gold Bijili (50 pcs)", qty: "1 Box", actualPrice: 200, price: 20, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        },
        {
            category: "Flower Pots (90% Discount)",
            items: [
                { name: "Flower Pot Small", qty: "1 Box", actualPrice: 300, price: 30, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Flower Pot Big", qty: "1 Box", actualPrice: 500, price: 50, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Flower Pot Special", qty: "1 Box", actualPrice: 800, price: 80, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Flower Pot Asoka", qty: "1 Box", actualPrice: 1000, price: 100, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        },
        {
            category: "Ground Chakkars (90% Discount)",
            items: [
                { name: "Chakkar Big", qty: "1 Box", actualPrice: 400, price: 40, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Chakkar Special", qty: "1 Box", actualPrice: 600, price: 60, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "Chakkar Deluxe", qty: "1 Box", actualPrice: 800, price: 80, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        },
        {
            category: "Sparklers (90% Discount)",
            items: [
                { name: "10cm Electric Sparkler", qty: "1 Box", actualPrice: 150, price: 15, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "10cm Color Sparkler", qty: "1 Box", actualPrice: 200, price: 20, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "15cm Green Sparkler", qty: "1 Box", actualPrice: 300, price: 30, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "30cm Color Sparkler", qty: "1 Box", actualPrice: 800, price: 80, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        },
        {
            category: "Sky Shots & Aerial (90% Discount)",
            items: [
                { name: "12 Shots Multi Color", qty: "1 Box", actualPrice: 1200, price: 120, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "30 Shots Classic", qty: "1 Box", actualPrice: 3000, price: 300, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "60 Shots Premium", qty: "1 Box", actualPrice: 6000, price: 600, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" },
                { name: "120 Shots Mega Display", qty: "1 Box", actualPrice: 12000, price: 1200, img: "https://d25j9whgcbyef9.cloudfront.net/storage/images/e44e1f09-1024-1000-adca-781582d87ea3cf1f.jpeg" }
            ]
        }
    ];

    const productsContainer = document.getElementById('products-container');

    productsData.forEach(cat => {
        // Create Category Title
        const title = document.createElement('h3');
        title.className = 'category-title';
        title.innerHTML = `<i class="fas fa-fire"></i> ${cat.category}`;
        productsContainer.appendChild(title);

        // Create Grid
        const grid = document.createElement('div');
        grid.className = 'products-grid';

        cat.items.forEach(product => {
            const card = document.createElement('div');
            card.className = 'product-card';
            
            card.innerHTML = `
                <img src="${product.img}" alt="${product.name}" class="product-image">
                <h4 class="product-name">${product.name}</h4>
                <p class="product-qty">${product.qty}</p>
                <div class="product-price-row">
                    <span class="actual-price">₹${product.actualPrice}</span>
                    <span class="discount-price">₹${product.price}</span>
                </div>
                <button class="add-btn">Add to Enquiry <i class="fas fa-plus"></i></button>
            `;
            grid.appendChild(card);
        });

        productsContainer.appendChild(grid);
    });
});
