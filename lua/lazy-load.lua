local M = {}

function M.setup(module, opts)
  local instance = nil

  local function setup()
    if instance == nil then
      instance = require(module)
      if instance.setup then
        instance.setup(opts or {})
      end
    end
  end

  return setmetatable({}, {
    __index = function(_, key)
      setup()
      return instance[key]
    end,

    __call = function(_, ...)
      setup()
      return instance(...)
    end,
  })
end

return M
