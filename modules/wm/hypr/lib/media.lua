local brightness = {
    cmd = "brightnessctl set",
}

local volume = {
    set = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@",
    mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@",
}

local M = {}

local function command(cmd, steps)
    return hl.dsp.exec_cmd(table.concat({ cmd, steps }, " "))
end

M.brightness = {
    up = command(brightness.cmd, "5%+"),
    down = command(brightness.cmd, "5%-"),
}

M.volume = {
    up = command(volume.set, "5%+"),
    down = command(volume.set, "5%-"),
    toggle = command(volume.mute, "toggle"),
}

M.play = {
    next = hl.dsp.exec_cmd("playerctl next"),
    play_pause = hl.dsp.exec_cmd("playerctl play-pause"),
    previous = hl.dsp.exec_cmd("playerctl previous"),
}

return M
