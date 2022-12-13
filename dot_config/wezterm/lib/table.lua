-- Merge one or more tables into a single table
function MergeAllTables(...)
  local ret = {}
  for _, tbl in ipairs({...}) do
    for k, v in pairs(tbl) do
      ret[k] = v
    end
  end
  return ret
end
