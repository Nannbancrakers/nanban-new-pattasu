// Supabase Initialization
const supabaseUrl = 'https://aioehzqlccwhnuyjkphx.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFpb2VoenFsY2N3aG51eWprcGh4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI1MDA0OTAsImV4cCI6MjA5ODA3NjQ5MH0.pTl18x5wCkAT9wOjJglupMA3pmISY2S3YvAFJAAbZAQ';
const supabase = window.supabase.createClient(supabaseUrl, supabaseKey);

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const { data: settings, error } = await supabase.from('settings').select('*');
        if (error) throw error;
        
        // Convert array to key-value object
        const config = {};
        settings.forEach(s => config[s.key] = s.value);

        // Update Logo (Find all img with src images/logo.png)
        document.querySelectorAll('img[src*="logo"]').forEach(img => {
            if (config.logo) img.src = config.logo;
        });

        // Update Hero Banner (Only in index.html usually)
        document.querySelectorAll('.carousel-item img').forEach(img => {
            if (config.heroBanner) img.src = config.heroBanner;
        });

        // Inject CSS variable override for colors
        const style = document.createElement('style');
        style.innerHTML = `
            :root {
                --theme-color: ${config.primaryColor || '#FFEB3B'} !important;
            }
            .marquee { background-color: var(--theme-color) !important; color: #fff !important; }
            .footer-links a:hover, .nav-link:hover { color: var(--theme-color) !important; }
            .btn-success, .btn-primary, .price-list-btn, .btn-warning { background-color: var(--theme-color) !important; border-color: var(--theme-color) !important; color: #fff !important; }
            .footer-title::after { background: var(--theme-color) !important; }
            .footer-contact-item i { color: var(--theme-color) !important; }
        `;
        document.head.appendChild(style);

        // Update Shop Address, Phone, and Email dynamically from Supabase
        const addressEl = document.querySelector('.footer-contact-item i.bi-geo-alt-fill');
        if (addressEl && config.shopAddress) addressEl.nextElementSibling.innerText = config.shopAddress;
        
        const phoneEl = document.querySelector('.footer-contact-item i.bi-telephone-fill');
        if (phoneEl && config.phoneMain) phoneEl.nextElementSibling.innerText = config.phoneMain;

        const emailEl = document.querySelector('.footer-contact-item i.bi-envelope-fill');
        if (emailEl && config.emailAddress) emailEl.nextElementSibling.innerText = config.emailAddress;

        // Update Contact Page Cards specifically
        const contactPageAddressEl = document.querySelector('.contact-icon-box i.bi-geo-alt-fill');
        if (contactPageAddressEl && config.shopAddress) contactPageAddressEl.parentElement.nextElementSibling.nextElementSibling.innerText = config.shopAddress;
        
        const contactPageEmailEl = document.querySelector('.contact-icon-box i.bi-envelope-heart-fill');
        if (contactPageEmailEl && config.emailAddress) contactPageEmailEl.parentElement.nextElementSibling.nextElementSibling.innerText = config.emailAddress;

        const contactPagePhoneEl = document.querySelector('.contact-icon-box i.bi-telephone-plus-fill');
        if (contactPagePhoneEl && config.phoneMain) contactPagePhoneEl.parentElement.nextElementSibling.nextElementSibling.innerHTML = `${config.phoneMain}<br><br>`;

        // Update WhatsApp Links
        if (config.whatsappNum) {
            document.querySelectorAll('a[href^="https://api.whatsapp.com/send?phone="]').forEach(link => {
                link.href = `https://api.whatsapp.com/send?phone=${config.whatsappNum}`;
            });
        }
        
        // Update Call Links
        if (config.phoneMain) {
            document.querySelectorAll('a[href^="tel:"]').forEach(link => {
                link.href = `tel:${config.phoneMain}`;
            });
        }

        // Update Marquee Text
        const marquee = document.querySelector('marquee');
        if (marquee && config.marqueeText) marquee.innerText = config.marqueeText;

        // Update Title
        if (config.seoTitle) document.title = config.seoTitle;

        console.log("Supabase settings loaded successfully!");
    } catch (err) {
        console.error("Failed to load settings from Supabase:", err);
    }
});
