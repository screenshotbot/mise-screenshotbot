-- Helper function for platform detection (uncomment and modify as needed)
local function get_platform()
    -- RUNTIME object is provided by mise/vfox
    -- RUNTIME.osType: "Windows", "Linux", "Darwin"
    -- RUNTIME.archType: "amd64", "386", "arm64", etc.

    local os_name = RUNTIME.osType:lower()
    local arch = RUNTIME.archType

    -- Map to your tool's platform naming convention
    -- Adjust these mappings based on how your tool names its releases
    local platform_map = {
        -- Universal binaries
        ["darwin"] = {
            ["amd64"] = "darwin",
            ["arm64"] = "darwin",
        },
        ["linux"] = {
            ["amd64"] = "linux",
            ["arm64"] = "linux-arm64",
        },
        ["windows"] = {
            ["amd64"] = "windows-amd64",
            ["386"] = "windows-386",
        }
    }

    local os_map = platform_map[os_name]
    if os_map then
        return os_map[arch] or "linux"  -- fallback
    end

    return "linux"
end


--- Returns download information for a specific version
--- Documentation: https://mise.jdx.dev/tool-plugin-development.html#preinstall-hook
--- @param ctx {version: string, runtimeVersion: string} Context
--- @return table Version and download information
function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    -- ctx.runtimeVersion contains the full version string if needed

    -- Example 1: Simple binary download
    -- local url = "https://github.com/screenshotbot/screenshotbot-oss/releases/download/v" .. version .. "/screenshotbot-linux-amd64"

    -- Example 2: Platform-specific binary
    local platform = get_platform() -- Uncomment the helper function below

    -- Replace with your actual download URL pattern
    local url = "https://cdn.screenshotbot.io/artifact/releases/" .. version .. "/recorder-" .. platform .. "-without-installer.tar.gz"


    -- Optional: Fetch checksum for verification
    -- local sha256 = fetch_checksum(version) -- Implement if checksums are available

    return {
        version = version,
        url = url,
        note = "Downloading screenshotbot " .. version,
    }
end

