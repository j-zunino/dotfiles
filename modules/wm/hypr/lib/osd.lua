local brightness = {
    cmd = "brightnessctl set",
    script = "/brightness",
}

local volume = {
    set = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@",
    mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@",
    script = "/volume",
}

local M = {}

local function osd(cmd, steps, script)
    local script_dir = os.getenv("HOME") .. "/dotfiles/scripts/osd" .. script

    return hl.dsp.exec_cmd(table.concat({ cmd, steps, "&&", script_dir }, " "))
end

M.brightness = {
    up = osd(brightness.cmd, "5%+", brightness.script),
    down = osd(brightness.cmd, "5%-", brightness.script),
}

M.volume = {
    up = osd(volume.set, "5%+", volume.script),
    down = osd(volume.set, "5%-", volume.script),
    toggle = osd(volume.mute, "toggle", volume.script),
}

M.play = {
    next = hl.dsp.exec_cmd("playerctl next"),
    play_pause = hl.dsp.exec_cmd("playerctl play-pause"),
    previous = hl.dsp.exec_cmd("playerctl previous"),
}

return M
