// Config docs:
//
//   https://glide-browser.app/config
//
// API reference:
//
//   https://glide-browser.app/api
//
// Default config files can be found here:
//
//   https://github.com/glide-browser/glide/tree/main/src/glide/browser/base/content/plugins
//
// Most default keymappings are defined here:
//
//   https://github.com/glide-browser/glide/blob/main/src/glide/browser/base/content/plugins/keymaps.mts
//
// Try typing `glide.` and see what you can do!
glide.o.hint_size = "12px";
glide.o.scroll_implementation = "legacy";

// let to_remove = [
//   document.querySelector("box#sidebar-main .buttons-wrapper"),
//   document.querySelector("box#sidebar-main splitter#sidebar-tools-and-extensions-splitter"),
// ];

// to_remove.forEach((el) => {
//   if (el) {
//     el.remove();
//   }
// });


// glide.keymaps.set("normal", "<C-b>", () => {
//   // toggle sidebar
//   if (glide.o.native_tabs == "show") {
//     glide.o.native_tabs = "hide";
//   } else {
//     glide.o.native_tabs = "show";
//   }
// });
// glide.keymaps.del("normal", "<c-j>")
// glide.keymaps.del("normal", "<c-k>")
glide.keymaps.set("normal", "<s-h>", "back"); // toggle bookmark sidebar
glide.keymaps.set("normal", "<s-j>", "tab_next"); // toggle bookmark sidebar
glide.keymaps.set("normal", "<s-k>", "tab_prev"); // toggle bookmark sidebar
glide.keymaps.set("normal", "<s-l>", "forward"); // toggle bookmark sidebar
glide.keymaps.set("normal", "<leader>u", "tab_reopen");
glide.keymaps.set("normal", "o", "keys <c-l>");
glide.keymaps.set("normal", "<c-ö>", "commandline_show")
glide.keymaps.set("normal", "ö", "commandline_show")
glide.keymaps.set("command", "<c-j>", "keys <tab>")
glide.keymaps.set("command", "<c-k>", "keys <s-tab>")
glide.keymaps.set("command", "<c-l>", "commandline_accept")
// glide.keymaps.set("normal", "<leader>h", "keys <C-S-h>"); // toggle bookmark sidebar
// glide.keymaps.set("normal", "<leader>b", "keys <C-S-b>"); // toggle bookmark sidebar
glide.keymaps.set("normal", "<leader>b", async () => {
  const bookmarks = await browser.bookmarks.getRecent(1000);

  glide.commandline.show({
    title: "bookmarks",
    options: bookmarks.map((bookmark) => ({
      label: bookmark.title,
      async execute() {
        const tab = await glide.tabs.get_first({
          url: bookmark.url,
        });
        if (tab) {
          await browser.tabs.update(tab.id, {
            active: true,
          });
        } else {
          await browser.tabs.create({
            active: true,
            url: bookmark.url,
          });
        }
      },
    })),
  });
}, { description: "Open the bookmarks picker" });

glide.keymaps.set("normal", "ö", "keys ;");
glide.keymaps.set("normal", "Ö", "keys ,");
glide.keymaps.set("normal", "ö", "keys ;");
