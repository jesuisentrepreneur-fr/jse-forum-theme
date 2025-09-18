import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.0", () => {
  const categories = settings.category_icons || [];
  if (!categories.length) return;

  const css = categories
    .map(({ id, emoji }) =>
      `.badge-category__wrapper .badge-category[data-category-id="${id}"]::before { content: "${emoji}"; }`
    )
    .join("\n");

  let styleEl = document.getElementById("theme-category-icons");
  if (!styleEl) {
    styleEl = document.createElement("style");
    styleEl.id = "theme-category-icons";
    styleEl.type = "text/css";
    document.head.appendChild(styleEl);
  }
  styleEl.textContent = css;
});


