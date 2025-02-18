return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Pythonのスニペット
      -- ccodingの指定はpython3では不要だが、python2では必要
      ls.add_snippets("python", {
        s("header", { -- スニペットのキー "header"
          t({ "#!/usr/bin/env python", "# coding: utf-8", "" }),
        }),
      })
    end,
  },
}
