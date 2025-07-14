(function () {
    // Tự động lấy context path
    const pathSegments = window.location.pathname.split("/");
    const contextPath = pathSegments.length > 1 && pathSegments[1] !== "OwnerController" ? "/" + pathSegments[1] : "";

    fetch(`${contextPath}/chat-widget/chat-popup.html`)
        .then(res => res.text())
        .then(html => {
            const container = document.createElement("div");
            container.innerHTML = html;
            document.body.appendChild(container);

            // Thực thi script bên trong chat-popup.html
            const scripts = container.querySelectorAll("script");
            scripts.forEach(oldScript => {
                const newScript = document.createElement("script");
                if (oldScript.src) {
                    newScript.src = oldScript.src;
                } else {
                    // Inject lại contextPath nếu có placeholder
                    newScript.textContent = oldScript.textContent.replace(/__CONTEXT_PATH__/g, contextPath);
                }
                document.body.appendChild(newScript);
            });
        });
})();
