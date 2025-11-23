// Copy to clipboard functionality
function copyToClipboard(text) {
    navigator.clipboard.writeText(text).then(() => {
        showNotification('Copied to clipboard!');
    }).catch(err => {
        console.error('Failed to copy:', err);
        showNotification('Failed to copy', 'error');
    });
}

// Show notification
function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: ${type === 'success' ? '#10b981' : '#ef4444'};
        color: white;
        padding: 1rem 2rem;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        z-index: 10000;
        animation: slideDown 0.5s ease-out;
        font-weight: 600;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'fadeOut 0.5s ease-out';
        setTimeout(() => notification.remove(), 500);
    }, 3000);
}

// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Intersection Observer for scroll animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all endpoint cards
document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll('.endpoint-card, .status-card, .error-card');
    cards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(card);
    });

    // Add copy buttons to all code blocks
    addCopyButtonsToCodeBlocks();

    // Initialize syntax highlighting for JSON
    highlightJSON();
});

// Add copy buttons to code blocks
function addCopyButtonsToCodeBlocks() {
    const codeBlocks = document.querySelectorAll('.code-section pre');
    
    codeBlocks.forEach(block => {
        const button = document.createElement('button');
        button.className = 'copy-code-btn';
        button.innerHTML = '📋';
        button.style.cssText = `
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(99, 102, 241, 0.8);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.875rem;
            opacity: 0;
            transition: opacity 0.3s, transform 0.2s;
            z-index: 10;
        `;
        
        block.style.position = 'relative';
        
        block.addEventListener('mouseenter', () => {
            button.style.opacity = '1';
        });
        
        block.addEventListener('mouseleave', () => {
            button.style.opacity = '0';
        });
        
        button.addEventListener('click', () => {
            const code = block.querySelector('code').textContent;
            copyToClipboard(code);
            button.innerHTML = '✓';
            setTimeout(() => {
                button.innerHTML = '📋';
            }, 2000);
        });
        
        button.addEventListener('mousedown', () => {
            button.style.transform = 'scale(0.95)';
        });
        
        button.addEventListener('mouseup', () => {
            button.style.transform = 'scale(1)';
        });
        
        block.appendChild(button);
    });
}

// Simple JSON syntax highlighting
function highlightJSON() {
    const codeBlocks = document.querySelectorAll('.code-section code');
    
    codeBlocks.forEach(block => {
        let content = block.textContent;
        
        // Check if it looks like JSON
        if (content.trim().startsWith('{') || content.trim().startsWith('[')) {
            // Highlight strings
            content = content.replace(/"([^"]+)":/g, '<span style="color: #818cf8">"$1"</span>:');
            
            // Highlight values
            content = content.replace(/:\s*"([^"]*)"/g, ': <span style="color: #34d399">"$1"</span>');
            
            // Highlight numbers
            content = content.replace(/:\s*(\d+)/g, ': <span style="color: #fbbf24">$1</span>');
            
            // Highlight booleans
            content = content.replace(/:\s*(true|false)/g, ': <span style="color: #f472b6">$1</span>');
            
            // Highlight null
            content = content.replace(/:\s*(null)/g, ': <span style="color: #94a3b8">$1</span>');
            
            block.innerHTML = content;
        }
    });
}

// Add active state to navigation
let lastScrollTop = 0;
window.addEventListener('scroll', () => {
    const sections = document.querySelectorAll('section[id]');
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop - 100;
        const sectionBottom = sectionTop + section.offsetHeight;
        
        if (scrollTop >= sectionTop && scrollTop < sectionBottom) {
            const id = section.getAttribute('id');
            const navLink = document.querySelector(`a[href="#${id}"]`);
            
            if (navLink) {
                document.querySelectorAll('a[href^="#"]').forEach(link => {
                    link.style.color = '';
                });
                navLink.style.color = '#818cf8';
            }
        }
    });
    
    lastScrollTop = scrollTop;
});

// Easter egg: Konami code
let konamiCode = [];
const konamiPattern = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];

document.addEventListener('keydown', (e) => {
    konamiCode.push(e.key);
    konamiCode.splice(-konamiPattern.length - 1, konamiCode.length - konamiPattern.length);
    
    if (konamiCode.join('') === konamiPattern.join('')) {
        activateEasterEgg();
    }
});

function activateEasterEgg() {
    showNotification('🎉 Konami Code Activated! You found the secret!', 'success');
    
    // Add confetti effect
    for (let i = 0; i < 50; i++) {
        setTimeout(() => {
            createConfetti();
        }, i * 50);
    }
}

function createConfetti() {
    const confetti = document.createElement('div');
    const colors = ['#6366f1', '#ec4899', '#10b981', '#f59e0b', '#3b82f6'];
    const randomColor = colors[Math.floor(Math.random() * colors.length)];
    
    confetti.style.cssText = `
        position: fixed;
        width: 10px;
        height: 10px;
        background: ${randomColor};
        top: -10px;
        left: ${Math.random() * 100}vw;
        opacity: 1;
        transform: rotate(${Math.random() * 360}deg);
        z-index: 9999;
        pointer-events: none;
    `;
    
    document.body.appendChild(confetti);
    
    const fallDuration = 3000 + Math.random() * 2000;
    const fallDistance = window.innerHeight + 20;
    
    confetti.animate([
        { transform: `translateY(0) rotate(0deg)`, opacity: 1 },
        { transform: `translateY(${fallDistance}px) rotate(${360 + Math.random() * 360}deg)`, opacity: 0 }
    ], {
        duration: fallDuration,
        easing: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
    });
    
    setTimeout(() => confetti.remove(), fallDuration);
}

// Add keyboard shortcut for search (Ctrl/Cmd + K)
document.addEventListener('keydown', (e) => {
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        showNotification('Search feature coming soon!', 'success');
    }
});

// Log a message in console
console.log('%c🚀 KetzalliDB API Documentation', 'font-size: 20px; font-weight: bold; color: #6366f1;');
console.log('%cVersion 1.0.0', 'font-size: 14px; color: #94a3b8;');
console.log('%cBuilt with ❤️ for accessibility', 'font-size: 12px; color: #ec4899;');
console.log('%c\nTry the Konami Code! ↑↑↓↓←→←→BA', 'font-size: 12px; color: #10b981;');
