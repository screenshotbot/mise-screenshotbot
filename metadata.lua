-- metadata.lua
-- Plugin metadata and configuration
-- Documentation: https://mise.jdx.dev/tool-plugin-development.html#metadata-lua

PLUGIN = { -- luacheck: ignore
    -- Required: Tool name (lowercase, no spaces)
    name = "screenshotbot",

    -- Required: Plugin version (not the tool version)
    version = "1.0.0",

    -- Required: Brief description of the tool
    description = "A mise tool plugin for the Screenshotbot CLI",

    -- Required: Plugin author/maintainer
    author = "screenshotbot",

    -- Optional: Repository URL for plugin updates
    updateUrl = "https://github.com/screenshotbot/mise-screenshotbot",

    -- Optional: Minimum mise runtime version required
    minRuntimeVersion = "0.2.0",

    -- Optional: Legacy version files this plugin can parse
    -- legacyFilenames = {
    --     ".screenshotbot-version",
    --     ".screenshotbotrc"
    -- }
}
