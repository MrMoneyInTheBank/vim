local export_types = { "pdf", "png", "svg", "html" }

local function export(opts)
  local target = opts.fargs[1]          -- first whitespace‑separated token

  if not target or target == "" then
    target = "pdf"
  elseif not vim.tbl_contains(export_types, target) then
    vim.notify(
      "Unsupported format: '" .. target .. "'. Valid: "
        .. table.concat(export_types, ", "),
      vim.log.levels.ERROR
    )
    return
  end

  if vim.bo.filetype ~= "typst" then
    vim.notify("Current buffer is not a Typst file", vim.log.levels.WARN)
    return
  end

  local file = vim.fn.expand("%:p")
  if vim.fn.empty(file) == 1 then
    vim.notify("No file to export (empty buffer)", vim.log.levels.ERROR)
    return
  end

  local cmd = { "typst", "compile", "--format", target, file }

  vim.notify("Exporting to " .. target .. "...", vim.log.levels.INFO)

  vim.system(cmd, { text = true }, function(res)
    if res.code ~= 0 then
      vim.schedule(function()
        vim.notify("Export failed:\n" .. res.stderr, vim.log.levels.ERROR)
      end)
    else
      vim.schedule(function()
        vim.notify("Export successful: " .. target, vim.log.levels.INFO)
      end)
    end
  end)
end

vim.api.nvim_create_user_command("Export", export, {
  nargs = "?",                       -- 0 or 1 argument
  complete = function() return export_types end,
})
