local fidget = require('fidget')

fidget.setup({
  fmt = {
    task = -- function to format each task line
    function(task_name, message, percentage)
      return ""
    end
  },
  timer = {task_decay = 100},
  window = {
    blend = 0 -- make background transparent
  }
})
