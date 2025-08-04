local M = {}

function M.setup(module, opts)
  local loaded = false
  local instance = nil
  return function()
    if not loaded then
      instance = require(module)
      if instance.setup then
        instance.setup(opts or {})
      end
      loaded = true
    end
    return instance
  end
end

return M
