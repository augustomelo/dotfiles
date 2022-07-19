local ignore = {
  file = {
    '{}.class',
    '{}.jar', '{}.war',
    '{}.ear',
    '{}.nar',
    '{}.iml',
    '{}.ipr',
    '{}.iws',
    '{}.tmp',
    '{}.bak',
    '{}.swp',
    '{}~.nib',
    '{}.exe',
    '{}.dll',
    '{}.csproj',
    '{}.sln',
    '{}.suo',
    '{}.class',
    '{}.pyc',
    'hs_err_pid{}',
    'pom.xml.tag',
    'pom.xml.releaseBackup',
    'pom.xml.versionsBackup',
    'pom.xml.next',
    'pom.xml.bak',
    'release.properties',
    'dependency-reduced-pom.xml',
    'buildNumber.properties',
    '.gradle',
    '.gradletasknamecache',
    'gradle-app.setting',
    '!gradle-wrapper.jar',
    '.metadata',
    '.classpath',
    '.project',
    'local.properties',
    '.loadpath',
    '.factorypath',
    '.code-workspace',
    '.DS_Store',
  },
  folder = {
    '{}.mtj.tmp/',
    '{}target/',
    '{}.mvn/timing.properties',
    '{}.mvn/wrapper/maven-wrapper.jar',
    '{}bin/',
    '{}build/',
    '{}out/',
    '{}.idea/',
    '{}.idea_modules/',
    '{}.settings/',
    '{}bin/',
    '{}tmp/',
    '{}nbproject/private/',
    '{}build/',
    '{}nbbuild/',
    '{}dist/',
    '{}nbdist/',
    '{}.vscode/',
    '{}obj/',
    '{}Properties/',
    '{}_references',
    '{}.git/',
    '{}.svn/',
    '{}node_modules/',
    '{}typings/',
    '{}bower_components/',
    --'{}.terraform/',
  }
}

local replace_placeholder = function(list, value)
  local ret = {}
  for _, ext in pairs(list) do
    table.insert(ret, (string.gsub(ext, '{}', value)))
  end

  return ret
end

local merge_tables = function(tbl_a, tbl_b)
  local merged = {}

  for _, value in pairs(tbl_a) do
    table.insert(merged, value)
  end
  for _, value in pairs(tbl_b) do
    table.insert(merged, value)
  end

  return merged
end

local M = {}

M.as_glob = function()
  local files = replace_placeholder(ignore.file, '*')
  local folders = replace_placeholder(ignore.folder, '**/')

  return merge_tables(files, folders)
end

M.as_lua_regex = function()
  local files = replace_placeholder(ignore.file, '%%')
  local folders = replace_placeholder(ignore.folder, '^')

  return merge_tables(files, folders)
end

M.as_regexp = function ()
  local files = replace_placeholder(ignore.file, '.*\\')
  local folders = replace_placeholder(ignore.folder, '' )

  return merge_tables(files, folders)
end

return M
