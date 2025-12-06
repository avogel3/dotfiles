-- FIXME: breaks config since v0.11.5
--
local function run_script_with_cwd(command, cwd, error_message)
  -- Run the command and capture the exit code
  local exit_code = os.execute(command)

  -- Check the exit status
  if exit_code ~= 0 then
    vim.schedule(function()
      vim.notify(
       error_message .. " " .. exit_code,
        vim.log.levels.ERROR
      )
    end)
  end
end

-- Check if a projections file is defined and valid JSON
local config_dir = vim.fn.stdpath("config")
local projections_check_script = config_dir .. "/projections_check.rb"
-- pcall(run_script_with_cwd(string.format("ruby %s %s", projections_check_script, vim.fn.getcwd()), vim.fn.getcwd, "Custom .projections file is invalid"))
