// ✅ Lấy context path an toàn từ biến được inject bởi JSP
const contextPath = window.contextPath || "";

fetch(`${contextPath}/chat-widget/chat-popup.html`)
    .then(res => {
        if (!res.ok) throw new Error(`Không tìm thấy file tại ${contextPath}/chat-widget/chat-popup.html`);
        return res.text();
    })
    .then(html => {
        const container = document.createElement('div');
        container.innerHTML = html;
        document.body.appendChild(container);

        const scripts = container.querySelectorAll("script");
        scripts.forEach(oldScript => {
            const newScript = document.createElement("script");
            if (oldScript.src) {
                newScript.src = oldScript.src;
            } else {
                newScript.textContent = oldScript.textContent.replace(/__CONTEXT_PATH__/g, contextPath);
            }
            document.body.appendChild(newScript);
        });
    })
    .catch(err => {
        console.error("❌ Không thể load chatbot:", err);
    });
