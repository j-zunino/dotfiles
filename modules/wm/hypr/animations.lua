hl.config({ animations = { enabled = true } })

hl.animation({ leaf = "global", enabled = false })

hl.curve(
    "window-move",
    { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } }
)

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 1.8,
    bezier = "window-move",
})
