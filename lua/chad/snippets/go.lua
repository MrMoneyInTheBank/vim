local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("ife", {
		t({ "if err != nil {", "\treturn " }),
		i(1, "err"),
		t({ "", "}" }),
	}),

	s("ifew", {
		t({ "if err != nil {", '\treturn fmt.Errorf("' }),
		i(1, "context"),
		t('": %w", err)'),
		t({ "", "}" }),
	}),
}
