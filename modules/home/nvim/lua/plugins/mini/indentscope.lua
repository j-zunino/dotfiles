return {
    require('mini.indentscope').setup({
        symbol = '│',
        options = { n_lines = 500 },
        draw = {
            delay = 200,
            animation = require('mini.indentscope').gen_animation.none(),
            predicate = function(scope)
                return scope.border.indent > 1
            end,
        },
    }),
}
