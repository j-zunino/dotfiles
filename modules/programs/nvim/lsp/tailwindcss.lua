return {
    vim.lsp.config('tailwindcss', {
        settings = {
            tailwindCSS = {
                classAttributes = {
                    'class',
                    'className',
                    'class:list',
                    'classList',
                    'ngClass',
                    '.*Variants*',
                    '.*Styles*',
                },
                classFunctions = {
                    'clsx',
                    '.*Variants*',
                    '.*Styles*',
                },
            },
        },
    }),
}
