-- ~/.config/nvim/lua/tyrone-neon/init.lua
-- Tyrone Neon - Chartreuse for Neovim

local M = {}

M.colors = {
  -- Backgrounds
  bg = "#000000",
  bg_dark = "#000000",
  bg_light = "#0A0A0A",
  bg_lighter = "#171717",
  bg_selection = "#262626",

  -- Foregrounds
  fg = "#E5E5E5",
  fg_muted = "#737373",
  fg_dark = "#484F58",
  fg_gutter = "#171717",

  -- Accent
  accent = "#DAFF01",
  accent_dark = "#B8D400",

  -- Semantic
  red = "#FF4757",
  red_bright = "#FF6B6B",
  green = "#00FF87",
  green_bright = "#5EFFA3",
  yellow = "#FFFA65",
  yellow_bright = "#FFFF80",
  blue = "#00D9FF",
  blue_bright = "#40E0FF",
  magenta = "#FF6B9D",
  magenta_bright = "#FF8FC7",
  cyan = "#00FFCC",
  cyan_bright = "#80FFE6",
  purple = "#C7A3FF",
  orange = "#FFB347",

  -- Git
  git_add = "#00FF87",
  git_change = "#00D9FF",
  git_delete = "#FF4757",
  git_conflict = "#FFFA65",

  -- Diagnostics
  error = "#FF4757",
  warning = "#FFFA65",
  info = "#00D9FF",
  hint = "#00FFCC",

  -- Special
  none = "NONE",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "tyrone-neon"

  local c = M.colors

  -- Helper function
  local function hi(group, opts)
    local cmd = "highlight " .. group
    if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
    if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
    if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
    if opts.style then cmd = cmd .. " gui=" .. opts.style else cmd = cmd .. " gui=NONE" end
    vim.cmd(cmd)
  end

  -- ========================================
  -- Editor
  -- ========================================
  hi("Normal", { fg = c.fg, bg = c.bg })
  hi("NormalNC", { fg = c.fg, bg = c.bg })
  hi("NormalFloat", { fg = c.fg, bg = c.bg_light })
  hi("FloatBorder", { fg = c.accent, bg = c.bg_light })
  hi("FloatTitle", { fg = c.accent, bg = c.bg_light, style = "bold" })
  hi("Cursor", { fg = c.bg, bg = c.accent })
  hi("CursorIM", { fg = c.bg, bg = c.accent })
  hi("CursorLine", { bg = c.bg_light })
  hi("CursorLineNr", { fg = c.accent, style = "bold" })
  hi("CursorColumn", { bg = c.bg_light })
  hi("ColorColumn", { bg = c.bg_light })
  hi("LineNr", { fg = c.fg_gutter })
  hi("SignColumn", { fg = c.fg_gutter, bg = c.bg })
  hi("FoldColumn", { fg = c.fg_muted, bg = c.bg })
  hi("Folded", { fg = c.fg_muted, bg = c.bg_light })
  hi("VertSplit", { fg = c.bg_lighter, bg = c.bg })
  hi("WinSeparator", { fg = c.bg_lighter, bg = c.bg })
  hi("StatusLine", { fg = c.fg_muted, bg = c.bg })
  hi("StatusLineNC", { fg = c.fg_dark, bg = c.bg })
  hi("TabLine", { fg = c.fg_muted, bg = c.bg })
  hi("TabLineFill", { bg = c.bg })
  hi("TabLineSel", { fg = c.accent, bg = c.bg, style = "bold" })
  hi("WinBar", { fg = c.fg, bg = c.bg })
  hi("WinBarNC", { fg = c.fg_muted, bg = c.bg })
  hi("EndOfBuffer", { fg = c.bg })
  hi("NonText", { fg = c.fg_dark })
  hi("Whitespace", { fg = c.fg_dark })
  hi("SpecialKey", { fg = c.fg_dark })

  -- ========================================
  -- Popup Menu
  -- ========================================
  hi("Pmenu", { fg = c.fg, bg = c.bg_light })
  hi("PmenuSel", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("PmenuSbar", { bg = c.bg_lighter })
  hi("PmenuThumb", { bg = c.accent })

  -- ========================================
  -- Search & Selection
  -- ========================================
  hi("Search", { fg = c.bg, bg = c.blue })
  hi("IncSearch", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("CurSearch", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("Substitute", { fg = c.bg, bg = c.red })
  hi("Visual", { bg = c.bg_selection })
  hi("VisualNOS", { bg = c.bg_selection })
  hi("MatchParen", { fg = c.accent, bg = c.bg_lighter, style = "bold" })

  -- ========================================
  -- Messages
  -- ========================================
  hi("ModeMsg", { fg = c.accent, style = "bold" })
  hi("MsgArea", { fg = c.fg })
  hi("MoreMsg", { fg = c.green })
  hi("Question", { fg = c.blue })
  hi("ErrorMsg", { fg = c.red, style = "bold" })
  hi("WarningMsg", { fg = c.yellow, style = "bold" })

  -- ========================================
  -- Spelling
  -- ========================================
  hi("SpellBad", { sp = c.red, style = "undercurl" })
  hi("SpellCap", { sp = c.yellow, style = "undercurl" })
  hi("SpellLocal", { sp = c.blue, style = "undercurl" })
  hi("SpellRare", { sp = c.purple, style = "undercurl" })

  -- ========================================
  -- Diff
  -- ========================================
  hi("DiffAdd", { fg = c.git_add, bg = "#00FF8720" })
  hi("DiffChange", { fg = c.git_change, bg = "#00D9FF20" })
  hi("DiffDelete", { fg = c.git_delete, bg = "#FF475720" })
  hi("DiffText", { fg = c.fg, bg = "#00D9FF40" })
  hi("diffAdded", { fg = c.git_add })
  hi("diffRemoved", { fg = c.git_delete })
  hi("diffChanged", { fg = c.git_change })
  hi("diffFile", { fg = c.accent })
  hi("diffNewFile", { fg = c.green })
  hi("diffOldFile", { fg = c.red })
  hi("diffLine", { fg = c.blue })
  hi("diffIndexLine", { fg = c.purple })

  -- ========================================
  -- Syntax (Base)
  -- ========================================
  hi("Comment", { fg = c.fg_dark, style = "italic" })
  hi("Constant", { fg = c.yellow })
  hi("String", { fg = c.green })
  hi("Character", { fg = c.green })
  hi("Number", { fg = c.yellow })
  hi("Float", { fg = c.yellow })
  hi("Boolean", { fg = c.yellow })
  hi("Identifier", { fg = c.fg })
  hi("Function", { fg = c.blue })
  hi("Statement", { fg = c.red, style = "bold" })
  hi("Conditional", { fg = c.red, style = "bold" })
  hi("Repeat", { fg = c.red, style = "bold" })
  hi("Label", { fg = c.red })
  hi("Operator", { fg = c.green })
  hi("Keyword", { fg = c.red, style = "bold" })
  hi("Exception", { fg = c.red, style = "bold" })
  hi("PreProc", { fg = c.magenta })
  hi("Include", { fg = c.red })
  hi("Define", { fg = c.magenta })
  hi("Macro", { fg = c.magenta })
  hi("PreCondit", { fg = c.magenta })
  hi("Type", { fg = c.magenta, style = "bold" })
  hi("StorageClass", { fg = c.red, style = "bold" })
  hi("Structure", { fg = c.magenta })
  hi("Typedef", { fg = c.magenta })
  hi("Special", { fg = c.cyan })
  hi("SpecialChar", { fg = c.cyan })
  hi("Tag", { fg = c.red })
  hi("Delimiter", { fg = c.fg })
  hi("SpecialComment", { fg = c.fg_muted })
  hi("Debug", { fg = c.orange })
  hi("Underlined", { fg = c.blue, style = "underline" })
  hi("Ignore", { fg = c.fg_dark })
  hi("Error", { fg = c.red, style = "bold" })
  hi("Todo", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("Title", { fg = c.accent, style = "bold" })
  hi("Directory", { fg = c.blue })

  -- ========================================
  -- Treesitter
  -- ========================================
  hi("@variable", { fg = c.fg })
  hi("@variable.builtin", { fg = c.red, style = "italic" })
  hi("@variable.parameter", { fg = c.purple, style = "italic" })
  hi("@variable.member", { fg = c.orange })
  hi("@constant", { fg = c.yellow })
  hi("@constant.builtin", { fg = c.yellow })
  hi("@constant.macro", { fg = c.magenta })
  hi("@module", { fg = c.accent })
  hi("@module.builtin", { fg = c.accent })
  hi("@label", { fg = c.red })
  hi("@string", { fg = c.green })
  hi("@string.documentation", { fg = c.green })
  hi("@string.regexp", { fg = c.cyan })
  hi("@string.escape", { fg = c.cyan })
  hi("@string.special", { fg = c.cyan })
  hi("@string.special.symbol", { fg = c.cyan })
  hi("@string.special.url", { fg = c.blue, style = "underline" })
  hi("@character", { fg = c.green })
  hi("@character.special", { fg = c.cyan })
  hi("@boolean", { fg = c.yellow })
  hi("@number", { fg = c.yellow })
  hi("@number.float", { fg = c.yellow })
  hi("@type", { fg = c.magenta, style = "bold" })
  hi("@type.builtin", { fg = c.magenta })
  hi("@type.definition", { fg = c.magenta })
  hi("@type.qualifier", { fg = c.red })
  hi("@attribute", { fg = c.yellow })
  hi("@property", { fg = c.orange })
  hi("@function", { fg = c.blue })
  hi("@function.builtin", { fg = c.blue })
  hi("@function.call", { fg = c.blue })
  hi("@function.macro", { fg = c.magenta })
  hi("@function.method", { fg = c.blue })
  hi("@function.method.call", { fg = c.blue })
  hi("@constructor", { fg = c.magenta })
  hi("@operator", { fg = c.green })
  hi("@keyword", { fg = c.red, style = "bold" })
  hi("@keyword.coroutine", { fg = c.red })
  hi("@keyword.function", { fg = c.red, style = "bold" })
  hi("@keyword.operator", { fg = c.red })
  hi("@keyword.import", { fg = c.red })
  hi("@keyword.storage", { fg = c.red })
  hi("@keyword.repeat", { fg = c.red, style = "bold" })
  hi("@keyword.return", { fg = c.red, style = "bold" })
  hi("@keyword.debug", { fg = c.orange })
  hi("@keyword.exception", { fg = c.red, style = "bold" })
  hi("@keyword.conditional", { fg = c.red, style = "bold" })
  hi("@keyword.conditional.ternary", { fg = c.red })
  hi("@keyword.directive", { fg = c.magenta })
  hi("@keyword.directive.define", { fg = c.magenta })
  hi("@punctuation.delimiter", { fg = c.fg_muted })
  hi("@punctuation.bracket", { fg = c.fg_muted })
  hi("@punctuation.special", { fg = c.cyan })
  hi("@comment", { fg = c.fg_dark, style = "italic" })
  hi("@comment.documentation", { fg = c.fg_muted, style = "italic" })
  hi("@comment.error", { fg = c.red, style = "bold" })
  hi("@comment.warning", { fg = c.yellow })
  hi("@comment.todo", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("@comment.note", { fg = c.blue })
  hi("@markup.strong", { fg = c.accent, style = "bold" })
  hi("@markup.italic", { fg = c.cyan, style = "italic" })
  hi("@markup.strikethrough", { fg = c.fg_muted, style = "strikethrough" })
  hi("@markup.underline", { style = "underline" })
  hi("@markup.heading", { fg = c.accent, style = "bold" })
  hi("@markup.heading.1", { fg = c.accent, style = "bold" })
  hi("@markup.heading.2", { fg = c.blue, style = "bold" })
  hi("@markup.heading.3", { fg = c.magenta, style = "bold" })
  hi("@markup.heading.4", { fg = c.green, style = "bold" })
  hi("@markup.heading.5", { fg = c.purple, style = "bold" })
  hi("@markup.heading.6", { fg = c.orange, style = "bold" })
  hi("@markup.quote", { fg = c.fg_muted, style = "italic" })
  hi("@markup.math", { fg = c.cyan })
  hi("@markup.environment", { fg = c.magenta })
  hi("@markup.link", { fg = c.blue })
  hi("@markup.link.label", { fg = c.purple })
  hi("@markup.link.url", { fg = c.blue, style = "underline" })
  hi("@markup.raw", { fg = c.green })
  hi("@markup.raw.block", { fg = c.green })
  hi("@markup.list", { fg = c.green })
  hi("@markup.list.checked", { fg = c.green })
  hi("@markup.list.unchecked", { fg = c.red })
  hi("@diff.plus", { fg = c.git_add })
  hi("@diff.minus", { fg = c.git_delete })
  hi("@diff.delta", { fg = c.git_change })
  hi("@tag", { fg = c.red })
  hi("@tag.attribute", { fg = c.blue })
  hi("@tag.delimiter", { fg = c.fg_muted })

  -- ========================================
  -- LSP Semantic Tokens
  -- ========================================
  hi("@lsp.type.class", { fg = c.magenta, style = "bold" })
  hi("@lsp.type.decorator", { fg = c.yellow })
  hi("@lsp.type.enum", { fg = c.magenta })
  hi("@lsp.type.enumMember", { fg = c.cyan })
  hi("@lsp.type.function", { fg = c.blue })
  hi("@lsp.type.interface", { fg = c.magenta })
  hi("@lsp.type.keyword", { fg = c.red })
  hi("@lsp.type.macro", { fg = c.magenta })
  hi("@lsp.type.method", { fg = c.blue })
  hi("@lsp.type.namespace", { fg = c.accent })
  hi("@lsp.type.parameter", { fg = c.purple, style = "italic" })
  hi("@lsp.type.property", { fg = c.orange })
  hi("@lsp.type.struct", { fg = c.magenta })
  hi("@lsp.type.type", { fg = c.magenta })
  hi("@lsp.type.typeParameter", { fg = c.magenta })
  hi("@lsp.type.variable", { fg = c.fg })
  hi("@lsp.mod.readonly", { fg = c.purple })
  hi("@lsp.mod.defaultLibrary", { fg = c.yellow })
  hi("@lsp.typemod.function.defaultLibrary", { fg = c.blue })
  hi("@lsp.typemod.variable.defaultLibrary", { fg = c.yellow })

  -- ========================================
  -- Diagnostics
  -- ========================================
  hi("DiagnosticError", { fg = c.error })
  hi("DiagnosticWarn", { fg = c.warning })
  hi("DiagnosticInfo", { fg = c.info })
  hi("DiagnosticHint", { fg = c.hint })
  hi("DiagnosticOk", { fg = c.green })
  hi("DiagnosticVirtualTextError", { fg = c.error, bg = "#FF475715" })
  hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = "#FFFA6515" })
  hi("DiagnosticVirtualTextInfo", { fg = c.info, bg = "#00D9FF15" })
  hi("DiagnosticVirtualTextHint", { fg = c.hint, bg = "#00FFCC15" })
  hi("DiagnosticUnderlineError", { sp = c.error, style = "undercurl" })
  hi("DiagnosticUnderlineWarn", { sp = c.warning, style = "undercurl" })
  hi("DiagnosticUnderlineInfo", { sp = c.info, style = "undercurl" })
  hi("DiagnosticUnderlineHint", { sp = c.hint, style = "undercurl" })
  hi("DiagnosticFloatingError", { fg = c.error })
  hi("DiagnosticFloatingWarn", { fg = c.warning })
  hi("DiagnosticFloatingInfo", { fg = c.info })
  hi("DiagnosticFloatingHint", { fg = c.hint })
  hi("DiagnosticSignError", { fg = c.error })
  hi("DiagnosticSignWarn", { fg = c.warning })
  hi("DiagnosticSignInfo", { fg = c.info })
  hi("DiagnosticSignHint", { fg = c.hint })

  -- ========================================
  -- LSP
  -- ========================================
  hi("LspReferenceText", { bg = c.bg_lighter })
  hi("LspReferenceRead", { bg = c.bg_lighter })
  hi("LspReferenceWrite", { bg = c.bg_lighter })
  hi("LspSignatureActiveParameter", { fg = c.accent, style = "bold,underline" })
  hi("LspCodeLens", { fg = c.fg_muted })
  hi("LspCodeLensSeparator", { fg = c.fg_dark })
  hi("LspInlayHint", { fg = c.fg_muted, bg = c.bg_light, style = "italic" })

  -- ========================================
  -- Telescope
  -- ========================================
  hi("TelescopeNormal", { fg = c.fg, bg = c.bg })
  hi("TelescopeBorder", { fg = c.accent, bg = c.bg })
  hi("TelescopeTitle", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
  hi("TelescopePromptBorder", { fg = c.accent, bg = c.bg_light })
  hi("TelescopePromptTitle", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("TelescopePromptPrefix", { fg = c.accent })
  hi("TelescopePromptCounter", { fg = c.fg_muted })
  hi("TelescopeResultsNormal", { fg = c.fg, bg = c.bg })
  hi("TelescopeResultsBorder", { fg = c.accent, bg = c.bg })
  hi("TelescopeResultsTitle", { fg = c.bg, bg = c.blue, style = "bold" })
  hi("TelescopePreviewNormal", { fg = c.fg, bg = c.bg })
  hi("TelescopePreviewBorder", { fg = c.accent, bg = c.bg })
  hi("TelescopePreviewTitle", { fg = c.bg, bg = c.magenta, style = "bold" })
  hi("TelescopeSelection", { fg = c.accent, bg = c.bg_lighter, style = "bold" })
  hi("TelescopeSelectionCaret", { fg = c.accent })
  hi("TelescopeMultiSelection", { fg = c.magenta })
  hi("TelescopeMultiIcon", { fg = c.magenta })
  hi("TelescopeMatching", { fg = c.green, style = "bold" })

  -- ========================================
  -- NvimTree
  -- ========================================
  hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
  hi("NvimTreeNormalNC", { fg = c.fg, bg = c.bg })
  hi("NvimTreeRootFolder", { fg = c.accent, style = "bold" })
  hi("NvimTreeFolderName", { fg = c.blue })
  hi("NvimTreeFolderIcon", { fg = c.blue })
  hi("NvimTreeOpenedFolderName", { fg = c.blue, style = "bold" })
  hi("NvimTreeEmptyFolderName", { fg = c.fg_muted })
  hi("NvimTreeSymlink", { fg = c.cyan })
  hi("NvimTreeSpecialFile", { fg = c.magenta, style = "bold" })
  hi("NvimTreeImageFile", { fg = c.purple })
  hi("NvimTreeIndentMarker", { fg = c.bg_lighter })
  hi("NvimTreeGitDirty", { fg = c.git_change })
  hi("NvimTreeGitNew", { fg = c.git_add })
  hi("NvimTreeGitDeleted", { fg = c.git_delete })
  hi("NvimTreeGitStaged", { fg = c.green })
  hi("NvimTreeGitMerge", { fg = c.git_conflict })
  hi("NvimTreeGitRenamed", { fg = c.cyan })
  hi("NvimTreeGitIgnored", { fg = c.fg_muted })
  hi("NvimTreeWindowPicker", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("NvimTreeCursorLine", { bg = c.bg_light })
  hi("NvimTreeWinSeparator", { fg = c.bg, bg = c.bg })

  -- ========================================
  -- Neo-tree
  -- ========================================
  hi("NeoTreeNormal", { fg = c.fg, bg = c.bg })
  hi("NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
  hi("NeoTreeRootName", { fg = c.accent, style = "bold" })
  hi("NeoTreeDirectoryName", { fg = c.blue })
  hi("NeoTreeDirectoryIcon", { fg = c.blue })
  hi("NeoTreeFileName", { fg = c.fg })
  hi("NeoTreeFileIcon", { fg = c.fg })
  hi("NeoTreeSymbolicLinkTarget", { fg = c.cyan })
  hi("NeoTreeIndentMarker", { fg = c.bg_lighter })
  hi("NeoTreeGitAdded", { fg = c.git_add })
  hi("NeoTreeGitModified", { fg = c.git_change })
  hi("NeoTreeGitDeleted", { fg = c.git_delete })
  hi("NeoTreeGitConflict", { fg = c.git_conflict })
  hi("NeoTreeGitUntracked", { fg = c.magenta })
  hi("NeoTreeGitIgnored", { fg = c.fg_muted })
  hi("NeoTreeGitStaged", { fg = c.green })
  hi("NeoTreeCursorLine", { bg = c.bg_light })
  hi("NeoTreeTitleBar", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("NeoTreeFloatBorder", { fg = c.accent })
  hi("NeoTreeFloatTitle", { fg = c.accent })

  -- ========================================
  -- GitSigns
  -- ========================================
  hi("GitSignsAdd", { fg = c.git_add })
  hi("GitSignsChange", { fg = c.git_change })
  hi("GitSignsDelete", { fg = c.git_delete })
  hi("GitSignsAddNr", { fg = c.git_add })
  hi("GitSignsChangeNr", { fg = c.git_change })
  hi("GitSignsDeleteNr", { fg = c.git_delete })
  hi("GitSignsAddLn", { bg = "#00FF8720" })
  hi("GitSignsChangeLn", { bg = "#00D9FF20" })
  hi("GitSignsDeleteLn", { bg = "#FF475720" })
  hi("GitSignsCurrentLineBlame", { fg = c.fg_muted, style = "italic" })

  -- ========================================
  -- Indent Blankline
  -- ========================================
  hi("IndentBlanklineChar", { fg = c.bg_lighter })
  hi("IndentBlanklineContextChar", { fg = c.accent })
  hi("IndentBlanklineContextStart", { sp = c.accent, style = "underline" })
  hi("IblIndent", { fg = c.bg_lighter })
  hi("IblScope", { fg = c.accent })

  -- ========================================
  -- Which-Key
  -- ========================================
  hi("WhichKey", { fg = c.accent })
  hi("WhichKeyGroup", { fg = c.blue })
  hi("WhichKeyDesc", { fg = c.fg })
  hi("WhichKeySeparator", { fg = c.fg_muted })
  hi("WhichKeyFloat", { bg = c.bg_light })
  hi("WhichKeyBorder", { fg = c.accent, bg = c.bg_light })
  hi("WhichKeyValue", { fg = c.fg_muted })

  -- ========================================
  -- Lazy
  -- ========================================
  hi("LazyH1", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("LazyH2", { fg = c.accent, style = "bold" })
  hi("LazyButton", { fg = c.fg, bg = c.bg_lighter })
  hi("LazyButtonActive", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("LazyComment", { fg = c.fg_muted })
  hi("LazyCommit", { fg = c.cyan })
  hi("LazyCommitIssue", { fg = c.magenta })
  hi("LazyCommitType", { fg = c.blue })
  hi("LazyDimmed", { fg = c.fg_muted })
  hi("LazyDir", { fg = c.blue })
  hi("LazyNoCond", { fg = c.red })
  hi("LazyProgressDone", { fg = c.accent })
  hi("LazyProgressTodo", { fg = c.bg_lighter })
  hi("LazyProp", { fg = c.purple })
  hi("LazyReasonCmd", { fg = c.blue })
  hi("LazyReasonEvent", { fg = c.yellow })
  hi("LazyReasonFt", { fg = c.cyan })
  hi("LazyReasonImport", { fg = c.fg })
  hi("LazyReasonKeys", { fg = c.magenta })
  hi("LazyReasonPlugin", { fg = c.green })
  hi("LazyReasonRuntime", { fg = c.orange })
  hi("LazyReasonSource", { fg = c.purple })
  hi("LazyReasonStart", { fg = c.accent })
  hi("LazySpecial", { fg = c.accent })
  hi("LazyTaskOutput", { fg = c.fg })
  hi("LazyUrl", { fg = c.blue, style = "underline" })
  hi("LazyValue", { fg = c.green })

  -- ========================================
  -- Mason
  -- ========================================
  hi("MasonNormal", { fg = c.fg, bg = c.bg })
  hi("MasonHeader", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("MasonHeaderSecondary", { fg = c.bg, bg = c.blue, style = "bold" })
  hi("MasonHighlight", { fg = c.accent })
  hi("MasonHighlightBlock", { fg = c.bg, bg = c.accent })
  hi("MasonHighlightBlockBold", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("MasonHighlightSecondary", { fg = c.blue })
  hi("MasonMuted", { fg = c.fg_muted })
  hi("MasonMutedBlock", { fg = c.fg, bg = c.bg_lighter })

  -- ========================================
  -- Cmp
  -- ========================================
  hi("CmpItemAbbr", { fg = c.fg })
  hi("CmpItemAbbrDeprecated", { fg = c.fg_muted, style = "strikethrough" })
  hi("CmpItemAbbrMatch", { fg = c.accent, style = "bold" })
  hi("CmpItemAbbrMatchFuzzy", { fg = c.accent })
  hi("CmpItemKind", { fg = c.blue })
  hi("CmpItemMenu", { fg = c.fg_muted })
  hi("CmpItemKindClass", { fg = c.magenta })
  hi("CmpItemKindColor", { fg = c.yellow })
  hi("CmpItemKindConstant", { fg = c.yellow })
  hi("CmpItemKindConstructor", { fg = c.magenta })
  hi("CmpItemKindEnum", { fg = c.magenta })
  hi("CmpItemKindEnumMember", { fg = c.cyan })
  hi("CmpItemKindEvent", { fg = c.yellow })
  hi("CmpItemKindField", { fg = c.orange })
  hi("CmpItemKindFile", { fg = c.fg })
  hi("CmpItemKindFolder", { fg = c.blue })
  hi("CmpItemKindFunction", { fg = c.blue })
  hi("CmpItemKindInterface", { fg = c.magenta })
  hi("CmpItemKindKeyword", { fg = c.red })
  hi("CmpItemKindMethod", { fg = c.blue })
  hi("CmpItemKindModule", { fg = c.accent })
  hi("CmpItemKindOperator", { fg = c.green })
  hi("CmpItemKindProperty", { fg = c.orange })
  hi("CmpItemKindReference", { fg = c.purple })
  hi("CmpItemKindSnippet", { fg = c.cyan })
  hi("CmpItemKindStruct", { fg = c.magenta })
  hi("CmpItemKindText", { fg = c.fg })
  hi("CmpItemKindTypeParameter", { fg = c.magenta })
  hi("CmpItemKindUnit", { fg = c.yellow })
  hi("CmpItemKindValue", { fg = c.yellow })
  hi("CmpItemKindVariable", { fg = c.fg })
  hi("CmpItemKindCopilot", { fg = c.green })

  -- ========================================
  -- Noice
  -- ========================================
  hi("NoiceCmdline", { fg = c.fg, bg = c.bg_light })
  hi("NoiceCmdlineIcon", { fg = c.accent })
  hi("NoiceCmdlineIconSearch", { fg = c.yellow })
  hi("NoiceCmdlinePopup", { fg = c.fg, bg = c.bg_light })
  hi("NoiceCmdlinePopupBorder", { fg = c.accent })
  hi("NoiceCmdlinePopupBorderSearch", { fg = c.yellow })
  hi("NoiceConfirm", { fg = c.fg, bg = c.bg_light })
  hi("NoiceConfirmBorder", { fg = c.accent })
  hi("NoiceMini", { fg = c.fg, bg = c.bg_light })
  hi("NoicePopup", { fg = c.fg, bg = c.bg_light })
  hi("NoicePopupBorder", { fg = c.accent })
  hi("NoiceScrollbar", { bg = c.bg_lighter })
  hi("NoiceScrollbarThumb", { bg = c.accent })

  -- ========================================
  -- Notify
  -- ========================================
  hi("NotifyERRORBorder", { fg = c.red })
  hi("NotifyERRORIcon", { fg = c.red })
  hi("NotifyERRORTitle", { fg = c.red })
  hi("NotifyWARNBorder", { fg = c.yellow })
  hi("NotifyWARNIcon", { fg = c.yellow })
  hi("NotifyWARNTitle", { fg = c.yellow })
  hi("NotifyINFOBorder", { fg = c.blue })
  hi("NotifyINFOIcon", { fg = c.blue })
  hi("NotifyINFOTitle", { fg = c.blue })
  hi("NotifyDEBUGBorder", { fg = c.fg_muted })
  hi("NotifyDEBUGIcon", { fg = c.fg_muted })
  hi("NotifyDEBUGTitle", { fg = c.fg_muted })
  hi("NotifyTRACEBorder", { fg = c.purple })
  hi("NotifyTRACEIcon", { fg = c.purple })
  hi("NotifyTRACETitle", { fg = c.purple })
  hi("NotifyBackground", { bg = c.bg })

  -- ========================================
  -- Dashboard / Alpha
  -- ========================================
  hi("DashboardHeader", { fg = c.accent })
  hi("DashboardFooter", { fg = c.fg_muted, style = "italic" })
  hi("DashboardCenter", { fg = c.blue })
  hi("DashboardShortCut", { fg = c.magenta })
  hi("DashboardKey", { fg = c.accent })
  hi("DashboardDesc", { fg = c.fg })
  hi("DashboardIcon", { fg = c.blue })
  hi("AlphaHeader", { fg = c.accent })
  hi("AlphaFooter", { fg = c.fg_muted, style = "italic" })
  hi("AlphaButtons", { fg = c.blue })
  hi("AlphaShortcut", { fg = c.magenta })

  -- ========================================
  -- Bufferline
  -- ========================================
  hi("BufferLineFill", { bg = c.bg })
  hi("BufferLineBackground", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineBuffer", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineBufferSelected", { fg = c.accent, bg = c.bg, style = "bold" })
  hi("BufferLineBufferVisible", { fg = c.fg, bg = c.bg })
  hi("BufferLineCloseButton", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineCloseButtonSelected", { fg = c.red, bg = c.bg })
  hi("BufferLineCloseButtonVisible", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineDiagnostic", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineDiagnosticSelected", { fg = c.fg, bg = c.bg })
  hi("BufferLineDiagnosticVisible", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineError", { fg = c.red, bg = c.bg })
  hi("BufferLineErrorSelected", { fg = c.red, bg = c.bg, style = "bold" })
  hi("BufferLineErrorVisible", { fg = c.red, bg = c.bg })
  hi("BufferLineErrorDiagnostic", { fg = c.red, bg = c.bg })
  hi("BufferLineErrorDiagnosticSelected", { fg = c.red, bg = c.bg })
  hi("BufferLineErrorDiagnosticVisible", { fg = c.red, bg = c.bg })
  hi("BufferLineHint", { fg = c.hint, bg = c.bg })
  hi("BufferLineHintSelected", { fg = c.hint, bg = c.bg, style = "bold" })
  hi("BufferLineHintVisible", { fg = c.hint, bg = c.bg })
  hi("BufferLineHintDiagnostic", { fg = c.hint, bg = c.bg })
  hi("BufferLineHintDiagnosticSelected", { fg = c.hint, bg = c.bg })
  hi("BufferLineHintDiagnosticVisible", { fg = c.hint, bg = c.bg })
  hi("BufferLineIndicatorSelected", { fg = c.accent, bg = c.bg })
  hi("BufferLineIndicatorVisible", { fg = c.bg, bg = c.bg })
  hi("BufferLineInfo", { fg = c.info, bg = c.bg })
  hi("BufferLineInfoSelected", { fg = c.info, bg = c.bg, style = "bold" })
  hi("BufferLineInfoVisible", { fg = c.info, bg = c.bg })
  hi("BufferLineInfoDiagnostic", { fg = c.info, bg = c.bg })
  hi("BufferLineInfoDiagnosticSelected", { fg = c.info, bg = c.bg })
  hi("BufferLineInfoDiagnosticVisible", { fg = c.info, bg = c.bg })
  hi("BufferLineModified", { fg = c.git_change, bg = c.bg })
  hi("BufferLineModifiedSelected", { fg = c.git_change, bg = c.bg })
  hi("BufferLineModifiedVisible", { fg = c.git_change, bg = c.bg })
  hi("BufferLineNumbers", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineNumbersSelected", { fg = c.accent, bg = c.bg, style = "bold" })
  hi("BufferLineNumbersVisible", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLinePick", { fg = c.red, bg = c.bg, style = "bold" })
  hi("BufferLinePickSelected", { fg = c.red, bg = c.bg, style = "bold" })
  hi("BufferLinePickVisible", { fg = c.red, bg = c.bg, style = "bold" })
  hi("BufferLineSeparator", { fg = c.bg, bg = c.bg })
  hi("BufferLineSeparatorSelected", { fg = c.bg, bg = c.bg })
  hi("BufferLineSeparatorVisible", { fg = c.bg, bg = c.bg })
  hi("BufferLineTab", { fg = c.fg_muted, bg = c.bg })
  hi("BufferLineTabSelected", { fg = c.accent, bg = c.bg, style = "bold" })
  hi("BufferLineTabClose", { fg = c.red, bg = c.bg })
  hi("BufferLineWarning", { fg = c.warning, bg = c.bg })
  hi("BufferLineWarningSelected", { fg = c.warning, bg = c.bg, style = "bold" })
  hi("BufferLineWarningVisible", { fg = c.warning, bg = c.bg })
  hi("BufferLineWarningDiagnostic", { fg = c.warning, bg = c.bg })
  hi("BufferLineWarningDiagnosticSelected", { fg = c.warning, bg = c.bg })
  hi("BufferLineWarningDiagnosticVisible", { fg = c.warning, bg = c.bg })

  -- ========================================
  -- Lualine (set in lualine config)
  -- ========================================
  hi("lualine_a_normal", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("lualine_b_normal", { fg = c.fg, bg = c.bg_lighter })
  hi("lualine_c_normal", { fg = c.fg_muted, bg = c.bg_light })
  hi("lualine_a_insert", { fg = c.bg, bg = c.green, style = "bold" })
  hi("lualine_a_visual", { fg = c.bg, bg = c.magenta, style = "bold" })
  hi("lualine_a_replace", { fg = c.bg, bg = c.red, style = "bold" })
  hi("lualine_a_command", { fg = c.bg, bg = c.blue, style = "bold" })

  -- ========================================
  -- Mini
  -- ========================================
  hi("MiniCursorword", { bg = c.bg_lighter })
  hi("MiniCursorwordCurrent", { bg = c.bg_lighter })
  hi("MiniIndentscopeSymbol", { fg = c.accent })
  hi("MiniIndentscopePrefix", { style = "nocombine" })
  hi("MiniJump", { fg = c.bg, bg = c.accent })
  hi("MiniJump2dSpot", { fg = c.accent, style = "bold,underline" })
  hi("MiniStarterCurrent", { style = "nocombine" })
  hi("MiniStarterFooter", { fg = c.fg_muted, style = "italic" })
  hi("MiniStarterHeader", { fg = c.accent })
  hi("MiniStarterInactive", { fg = c.fg_muted })
  hi("MiniStarterItem", { fg = c.fg })
  hi("MiniStarterItemBullet", { fg = c.accent })
  hi("MiniStarterItemPrefix", { fg = c.blue })
  hi("MiniStarterSection", { fg = c.accent, style = "bold" })
  hi("MiniStarterQuery", { fg = c.green })
  hi("MiniStatuslineDevinfo", { fg = c.fg, bg = c.bg_lighter })
  hi("MiniStatuslineFileinfo", { fg = c.fg, bg = c.bg_lighter })
  hi("MiniStatuslineFilename", { fg = c.fg_muted, bg = c.bg_light })
  hi("MiniStatuslineInactive", { fg = c.fg_muted, bg = c.bg })
  hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.blue, style = "bold" })
  hi("MiniStatuslineModeInsert", { fg = c.bg, bg = c.green, style = "bold" })
  hi("MiniStatuslineModeNormal", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("MiniStatuslineModeOther", { fg = c.bg, bg = c.purple, style = "bold" })
  hi("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, style = "bold" })
  hi("MiniStatuslineModeVisual", { fg = c.bg, bg = c.magenta, style = "bold" })
  hi("MiniSurround", { fg = c.bg, bg = c.accent })
  hi("MiniTablineCurrent", { fg = c.accent, bg = c.bg, style = "bold" })
  hi("MiniTablineFill", { bg = c.bg })
  hi("MiniTablineHidden", { fg = c.fg_muted, bg = c.bg })
  hi("MiniTablineModifiedCurrent", { fg = c.git_change, bg = c.bg, style = "bold" })
  hi("MiniTablineModifiedHidden", { fg = c.git_change, bg = c.bg })
  hi("MiniTablineModifiedVisible", { fg = c.git_change, bg = c.bg_light })
  hi("MiniTablineTabpagesection", { fg = c.bg, bg = c.accent, style = "bold" })
  hi("MiniTablineVisible", { fg = c.fg, bg = c.bg_light })
  hi("MiniTestEmphasis", { style = "bold" })
  hi("MiniTestFail", { fg = c.red, style = "bold" })
  hi("MiniTestPass", { fg = c.green, style = "bold" })
  hi("MiniTrailspace", { bg = c.red })

  -- ========================================
  -- Trouble
  -- ========================================
  hi("TroubleNormal", { fg = c.fg, bg = c.bg })
  hi("TroubleCount", { fg = c.bg, bg = c.accent })
  hi("TroubleError", { fg = c.error })
  hi("TroubleWarning", { fg = c.warning })
  hi("TroubleInformation", { fg = c.info })
  hi("TroubleHint", { fg = c.hint })
  hi("TroubleText", { fg = c.fg })
  hi("TroubleLocation", { fg = c.fg_muted })
  hi("TroubleFoldIcon", { fg = c.accent })
  hi("TroubleIndent", { fg = c.bg_lighter })
  hi("TroubleFile", { fg = c.blue })
  hi("TroubleSource", { fg = c.fg_muted })
  hi("TroubleCode", { fg = c.purple })

  -- ========================================
  -- Flash
  -- ========================================
  hi("FlashBackdrop", { fg = c.fg_muted })
  hi("FlashMatch", { fg = c.fg, bg = c.bg_lighter })
  hi("FlashCurrent", { fg = c.bg, bg = c.accent })
  hi("FlashLabel", { fg = c.bg, bg = c.magenta, style = "bold" })
  hi("FlashPrompt", { fg = c.fg, bg = c.bg_light })
  hi("FlashPromptIcon", { fg = c.accent })
  hi("FlashCursor", { bg = c.accent })

  -- ========================================
  -- Navic / Breadcrumb
  -- ========================================
  hi("NavicText", { fg = c.fg_muted })
  hi("NavicSeparator", { fg = c.fg_dark })
  hi("NavicIconsFile", { fg = c.fg })
  hi("NavicIconsModule", { fg = c.accent })
  hi("NavicIconsNamespace", { fg = c.accent })
  hi("NavicIconsPackage", { fg = c.orange })
  hi("NavicIconsClass", { fg = c.magenta })
  hi("NavicIconsMethod", { fg = c.blue })
  hi("NavicIconsProperty", { fg = c.orange })
  hi("NavicIconsField", { fg = c.orange })
  hi("NavicIconsConstructor", { fg = c.magenta })
  hi("NavicIconsEnum", { fg = c.magenta })
  hi("NavicIconsInterface", { fg = c.magenta })
  hi("NavicIconsFunction", { fg = c.blue })
  hi("NavicIconsVariable", { fg = c.fg })
  hi("NavicIconsConstant", { fg = c.yellow })
  hi("NavicIconsString", { fg = c.green })
  hi("NavicIconsNumber", { fg = c.yellow })
  hi("NavicIconsBoolean", { fg = c.yellow })
  hi("NavicIconsArray", { fg = c.cyan })
  hi("NavicIconsObject", { fg = c.magenta })
  hi("NavicIconsKey", { fg = c.red })
  hi("NavicIconsNull", { fg = c.yellow })
  hi("NavicIconsEnumMember", { fg = c.cyan })
  hi("NavicIconsStruct", { fg = c.magenta })
  hi("NavicIconsEvent", { fg = c.yellow })
  hi("NavicIconsOperator", { fg = c.green })
  hi("NavicIconsTypeParameter", { fg = c.magenta })

  -- ========================================
  -- Terminal Colors
  -- ========================================
  vim.g.terminal_color_0 = c.fg_dark
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg
  vim.g.terminal_color_8 = "#7D8590"
  vim.g.terminal_color_9 = c.red_bright
  vim.g.terminal_color_10 = c.green_bright
  vim.g.terminal_color_11 = c.yellow_bright
  vim.g.terminal_color_12 = c.blue_bright
  vim.g.terminal_color_13 = c.magenta_bright
  vim.g.terminal_color_14 = c.cyan_bright
  vim.g.terminal_color_15 = "#FFFFFF"
end

return M
