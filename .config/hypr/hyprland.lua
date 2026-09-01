local scripts = os.getenv("HOME") .. "/Scripts/"
local terminal = "ghostty"

hl.monitor({
    output = "desc:Shenzhen KTC Technology Group M27T6 0000000000000",
    mode = "2560x1440@180.00",
    position = "0x0",
    scale = 1,
})
hl.monitor({
    output = "desc:Shenzhen KTC Technology Group H27F7 0000000000000",
    mode = "1920x1080@240.00",
    position = "2560x180",
    scale = 1,
})
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
    mirror = "HDMI-A-1",
})

for workspace = 1, 8 do
    hl.workspace_rule({
        workspace = tostring(workspace),
        monitor = workspace <= 4 and "DP-1" or "HDMI-A-1",
        default = workspace == 1 or workspace == 8,
    })
end

hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("NVD_BACKEND", "direct")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd(scripts .. "launch_waybar")
    hl.exec_cmd("pasystray")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("jellyfin-mpv-shim")
end)

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "compose:ralt,caps:escape_shifted_capslock",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
        tablet = {
            output = "current",
        },
    },
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 0,
        layout = "dwindle",
    },
    decoration = {
        rounding = 8,
        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            new_optimizations = true,
        },
        shadow = {
            enabled = false,
            range = 10,
            render_power = 3,
            color = "rgba(00000046)",
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0,
    },
    opengl = {
        nvidia_anti_flicker = true,
    },
})

hl.curve("window", {
    type = "bezier",
    points = { { 0.15, 0.85 }, { 0.25, 1 } },
})
hl.curve("fast", {
    type = "bezier",
    points = { { 0.1, 1 }, { 0.4, 1 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "window", style = "popin 50%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.5, bezier = "fast" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "fast" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "fast" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "fast", style = "popin 95%" })

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Z", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Space", hl.dsp.exec_cmd(scripts .. "spotlight"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({}))
hl.bind("SUPER + X", function()
    local window = hl.get_active_window()
    if window ~= nil and window.class == "Steam" then
        hl.exec_cmd("xdotool windowunmap $(xdotool getactivewindow)")
    else
        hl.dispatch(hl.dsp.window.close())
    end
end)
hl.bind("SUPER + Escape", hl.dsp.exec_cmd(scripts .. "powermenu"))
hl.bind("SUPER + ALT + M", hl.dsp.exit())
hl.bind("Print", hl.dsp.exec_cmd("scr"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())

hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({ match = { class = "pasystray" }, float = true })
hl.window_rule({ match = { class = "org.kde.polkit-kde-authentication-agent-1" }, float = true })
hl.window_rule({ match = { class = "pavucontrol" }, float = true })
hl.window_rule({ match = { title = "^(Media viewer)$" }, float = true })
hl.window_rule({ match = { title = "^(Volume Control)$" }, float = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { class = "Viewnior" }, float = true })
hl.window_rule({ match = { title = "^(DevTools)$" }, float = true })
hl.window_rule({ match = { class = "file_progress" }, float = true })
hl.window_rule({ match = { class = "confirm" }, float = true })
hl.window_rule({ match = { class = "steamtinkerlauncher" }, float = true })
hl.window_rule({ match = { class = "dialog" }, float = true })
hl.window_rule({ match = { class = "download" }, float = true })
hl.window_rule({ match = { class = "notification" }, float = true })
hl.window_rule({ match = { class = "error" }, float = true })
hl.window_rule({ match = { class = "confirmreset" }, float = true })
hl.window_rule({ match = { title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { title = "^(branchdialog)$" }, float = true })
hl.window_rule({ match = { title = "^(Confirm to replace files)" }, float = true })
hl.window_rule({ match = { title = "^(File Operation Progress)" }, float = true })
hl.window_rule({ match = { title = ".*WiVRn dashboard.*" }, float = true })
hl.window_rule({ match = { title = "BSManager" }, float = true })
hl.window_rule({ match = { title = "^(SteamTinkerLaunch-)" }, float = true })
hl.window_rule({ match = { class = "yad" }, float = true })

-- Steam windows flicker with compositor effects enabled.
hl.window_rule({ match = { title = "^(Steam )" }, float = true })
hl.window_rule({ match = { class = "steam", title = "^(Friends List)$" }, float = true })
hl.window_rule({ match = { class = "steam" }, min_size = { 1, 1 } })
hl.window_rule({ match = { class = "steam" }, no_anim = true })
hl.window_rule({ match = { class = "steam" }, no_dim = true })
hl.window_rule({ match = { class = "steam" }, no_blur = true })
hl.window_rule({ match = { class = "steam" }, no_shadow = true })
hl.window_rule({ match = { class = "steam" }, border_size = 0 })
hl.window_rule({ match = { class = "steam" }, immediate = true })

hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0.2 })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })
