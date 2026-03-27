local M = {}

function M.detect_delimiter()
  local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
  local candidates = { ",", ";", "\t", "|" }
  local counts = {}

  for _, d in ipairs(candidates) do
    counts[d] = 0
  end

  for _, line in ipairs(lines) do
    for _, d in ipairs(candidates) do
      local _, n = line:gsub(d, "")
      counts[d] = counts[d] + n
    end
  end

  local best = ","
  local max = 0
  for d, c in pairs(counts) do
    if c > max then
      best = d
      max = c
    end
  end

  return best
end

function M.toggle()
  local delim = M.detect_delimiter()

  if delim == "\t" then
    delim = "\\t"
  end

  vim.cmd("CsvViewToggle delimiter=" .. delim)
end

return M
