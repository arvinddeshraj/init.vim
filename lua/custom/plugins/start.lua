-- lua/plugins/starter.lua
return {
    -- No plugin dependency; this is just a Lazy spec wrapper around config.
    "local/start",
    name = "start",
    dir = vim.fn.stdpath('config'),
    lazy = false,
    priority = 1000, -- run early-ish

    config = function()
        --------------------------------------------------------------------------
        -- Stdin detection (robust): StdinReadPre fires when nvim is going to read
        -- from stdin (e.g. `cat file | nvim -`). We set a flag and avoid dashboard.
        --------------------------------------------------------------------------
        vim.g.__braille_dash_stdin = false
        vim.api.nvim_create_autocmd("StdinReadPre", {
            callback = function()
                vim.g.__braille_dash_stdin = true
            end,
        })

        local function is_plain_start()
            -- no file/dir args AND not reading stdin
            return vim.fn.argc() == 0 and not vim.g.__braille_dash_stdin
        end

        local ART = {
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢤⠄⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⡸⣋⠛⠌⠙⠹⡲⣤⠀⠀⠀⠀⠀⢀⣀⡠⠠⠐⡒⡐⠫⠦⡣⢸⠴⠜⢒⠒⠂⠠⠤⡀⡀⠀⠀⢀⠀⢀⢤⣶⠋⠉⠡⠋⣻⢇⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⣗⠄⠠⠀⠈⠀⠠⠈⠘⢝⢶⢶⠂⡂⠀⠒⠒⣉⣁⣭⠭⠶⡌⣩⠦⠬⣌⡍⣙⠖⠒⠐⢐⢀⢶⣶⡾⠓⠁⠄⠀⠁⠀⠌⠀⢿⠆⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⢪⢂⣃⠀⠢⣀⢄⠤⠲⠜⠁⢀⠄⡠⠠⡐⠛⠁⣀⣀⣨⠥⠄⠠⠤⣅⣀⣀⠈⠛⠢⠄⢄⠠⡀⠀⠡⠦⠄⡠⢀⠔⢀⠂⡐⡟⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⡤⠅⣠⡴⣚⠚⠁⠀⠐⣨⠏⠢⠁⡠⠒⠋⠁⠁⣀⠔⡁⢌⠢⣔⠈⠈⠙⠒⠄⠈⠔⠹⣅⠀⡄⠈⠑⠓⣦⢄⢀⢤⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢝⣑⣒⠁⠀⠀⢀⣶⡽⠀⡀⠆⠈⠠⠀⠔⠚⢍⣠⠧⢃⡈⠾⣌⡙⢒⠢⠀⢄⠁⠰⠀⠈⢯⢖⠀⠀⠀⠈⢒⣊⡪⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡜⠨⠁⠠⣀⠔⣙⡽⠁⠰⢥⡼⡤⠇⢀⠀⢀⠜⠁⠥⡆⢰⢤⠈⠣⡀⠀⡀⠀⢄⢧⡾⠆⠈⣯⣗⠠⣀⠄⠈⠜⢣⠧⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠐⠊⠀⢀⣠⠊⠁⣢⣜⣿⣄⣚⢒⣈⠻⠇⠀⠀⢨⠡⢎⠉⠅⠰⠉⠙⡌⡇⠀⠀⢀⠋⢁⡈⢂⣠⣻⣣⣄⠌⠑⢔⡀⠀⠁⠂⢄⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⢀⠠⠁⢀⣦⡟⠂⣰⡸⠊⢽⡻⡿⡏⢿⠉⢕⣪⡀⠀⡘⣨⠀⠀⠀⠀⠀⠂⢅⠃⠀⢂⡵⡪⠉⡿⢙⠷⢷⡮⠉⢷⣆⠐⢻⢖⡠⠀⠠⡀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠠⡱⠂⡲⢭⢮⠁⢠⠿⠀⠀⢍⠳⠤⠧⣈⠳⠄⣤⠻⡖⢛⢄⡉⠂⠂⢐⡰⢋⡠⣻⣶⠿⣦⠀⠎⣁⠜⠤⠞⣩⠀⠠⡿⡄⠉⡽⡏⢒⠐⢂⠅⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢐⡱⠂⡀⠬⢽⠭⠀⢸⡀⠀⠂⡯⠱⠤⠄⡔⢊⡩⠴⡉⠑⠢⡀⠈⠀⠂⠐⠀⠉⢀⠔⠂⢉⠢⢍⡑⠠⠤⠤⠮⢽⠐⠂⢐⡇⠠⢯⡯⡭⢂⠐⢎⣂⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢔⡄⣈⠀⠭⡭⡅⠀⠸⠖⠀⠀⠖⠖⡩⡤⢔⡅⠑⠆⠀⠐⠀⡈⠢⠐⠀⠀⠂⠐⠁⠄⠊⠀⢀⠋⢈⣤⢬⢀⠰⠲⠀⠀⠶⠇⠀⢨⢭⠵⠅⣑⠨⡢⠀⠀⠀⠀",
            "⠀⠀⠀⡠⠱⢋⠄⠂⠭⣵⣑⢀⡈⣧⣄⢀⠌⠓⣤⢇⠤⠑⢂⡌⠂⠀⣇⠊⠀⠀⠀⠀⠀⠀⠁⣸⠀⠐⠁⡐⢊⠠⣊⣦⣊⠄⡐⣀⣥⣈⢀⣘⣨⠭⠐⠠⠘⠎⢄⠀⠀⠀",
            "⠀⠀⠀⠀⢊⠄⠀⠀⠭⣗⣒⠂⠐⢐⣒⡂⠀⠡⢾⢌⠓⠆⠄⡀⠢⠀⠸⣭⣤⡡⡁⠈⢉⣥⣽⠇⠀⠀⠈⠠⠴⢚⣩⣧⠥⠀⢂⣒⡒⠂⠐⣒⣻⠭⠁⠀⠠⡱⠀⠐⠀⠀",
            "⠀⠀⠀⠄⡢⢁⠄⠀⠤⣩⣵⡂⠀⡊⠩⣓⡂⠐⣃⢓⠲⠅⣁⠀⢈⠐⠀⠀⠉⢿⣀⡀⡕⠉⠀⠀⠂⠁⠀⣈⠨⠔⡛⣚⡀⢒⣊⠅⢑⠀⣰⣾⣭⡣⡀⠀⠈⠄⠠⠀⠀⠀",
            "⠀⠀⠀⡐⢁⠄⠀⣐⢿⢟⡯⣚⡥⠀⠀⢘⠸⣇⡀⡽⣧⢄⣀⠒⠐⠐⠔⣀⢤⣀⡗⣺⣀⣀⠀⠄⠂⠂⠂⣀⡰⣜⢭⢀⡸⠇⡃⠀⠀⢤⣱⢽⡻⡺⡆⠀⠀⡈⢃⠀⠀⠀",
            "⠀⠀⠐⠀⡣⡢⠄⠀⠁⢔⡨⡚⣽⣶⣎⠢⠄⡀⠃⡘⣳⡫⣯⣯⠉⢉⣯⣍⠍⡚⣀⣙⣀⠉⣍⢽⠉⠩⡯⣿⢽⣞⢁⠊⢀⠀⣒⢬⡾⣭⣒⠥⡠⠈⠂⠐⣐⢐⠀⠂⠀⠀",
            "⠀⠀⠀⠀⡰⠁⠌⠀⡠⠃⠀⡹⣫⣿⢟⢽⢕⠤⡡⢀⠐⣙⣻⢿⠄⠈⣗⣟⡿⣿⡷⢞⠾⣿⣿⣻⠁⠈⣯⣞⣊⠂⡀⠀⢔⢽⣾⣿⡻⡽⢄⠀⠘⢄⠀⠡⡈⢇⠀⠀⠀⠀",
            "⠀⠀⠀⠐⠀⠨⡙⡀⠀⠐⠀⠀⠊⠊⢡⢟⠽⢿⢾⣶⡠⢈⡟⢽⠇⠀⡇⠓⣓⣲⣋⣉⠕⢀⣹⣺⠀⡸⣿⢾⠁⢄⣢⢿⡿⡽⠽⡑⠑⠑⠀⠀⠢⠀⢀⢊⠇⠀⠂⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠥⠆⠂⣐⠠⢀⢀⣠⠁⠀⠀⠌⡊⠟⣿⡇⢹⣿⣟⣺⡗⠀⠊⢒⠂⢐⠂⡎⡊⢹⣗⣻⡿⡏⢸⡾⠯⢕⠣⠀⠈⠈⡄⡀⡀⠄⣂⠈⡀⠭⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠨⢠⢇⡂⡂⠨⢀⠀⢀⢠⠀⠀⠐⠋⢷⠬⡿⣯⣿⠀⠀⠘⠘⠆⠐⠂⡃⢀⠀⣟⣿⣷⠅⣞⠙⠂⠀⠀⡄⡀⠀⡀⠃⢐⢐⡨⡄⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠽⢂⢣⢨⢸⠨⢈⡩⢠⢠⢠⠀⣁⠭⢳⢯⣯⡄⠀⠀⠈⠀⠀⠁⡀⠀⢠⣿⡽⣴⠬⢊⠀⡄⡄⡅⠄⣅⠅⡆⡅⡜⡑⠮⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⠄⠈⠔⣪⠍⠈⢍⣝⣷⣰⢼⢒⡣⢺⣼⡽⠑⡂⣀⠀⠆⠀⠐⣀⢤⠊⢟⣧⣿⢘⢲⡥⣇⣞⣫⠉⠡⢩⣳⠠⠁⠠⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⠀⠀⠈⠭⠄⠊⠂⠳⢿⢿⡮⢄⢸⣅⣿⠀⠈⠆⢢⠐⠐⠔⠴⠁⠀⣿⣹⠇⡨⢕⡹⡽⠟⠐⠑⠠⠭⠁⠀⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠈⢿⡤⠈⠀⢋⣟⣒⡂⠌⢻⣷⠷⣶⣆⡖⡲⠖⡾⣶⣶⠾⣿⡟⠘⢀⣒⡻⡱⠀⠁⢤⠽⠁⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠙⠥⡈⠀⠪⢷⡢⡀⠀⠈⠉⠉⠋⠋⠋⠙⠙⠙⠙⠉⠁⠐⠀⢘⡗⠕⠀⢁⠬⠋⠀⠀⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⠀⠀⠈⠤⡀⠈⠟⣊⡀⠀⠀⠀⠀⠁⠀⠀⠈⠀⠀⠀⢀⢀⣱⡻⠁⢀⠤⠁⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠰⢀⠀⠀⠀⠁⠣⢄⠐⠵⢧⣂⡌⠀⠀⠀⠀⠀⠁⢡⣐⡬⠯⠚⡀⠔⠋⠀⠀⠀⡀⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠄⠉⠝⢹⢳⣲⡇⣸⣔⡜⡏⠫⠉⠠⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠄⡀⠠⠀⠈⠀⠍⠀⢯⡽⠀⠡⠁⠁⠀⠄⠀⠀⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠀⠂⠀⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        }

        --------------------------------------------------------------------------
        -- Rendering helpers
        --------------------------------------------------------------------------
        local function centered_lines(lines, win)
            win = win or 0
            local width = vim.api.nvim_win_get_width(win)
            local out = {}
            for _, line in ipairs(lines) do
                local w = vim.fn.strdisplaywidth(line)
                local pad = math.max(0, math.floor((width - w) / 2))
                out[#out + 1] = string.rep(" ", pad) .. line
            end
            return out
        end

        local function set_buf_lines(buf, lines)
            vim.bo[buf].modifiable = true
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
            vim.bo[buf].modifiable = false
        end

        --------------------------------------------------------------------------
        -- Dashboard buffer setup
        --------------------------------------------------------------------------
        local dash = {
            buf = nil,
            win = nil,
            prev_win_opts = nil,
            aug = vim.api.nvim_create_augroup("BrailleDashboard", { clear = true }),
        }

        local function capture_window_opts(win)
            return {
                number = vim.api.nvim_get_option_value("number", { win = win }),
                relativenumber = vim.api.nvim_get_option_value("relativenumber", { win = win }),
                signcolumn = vim.api.nvim_get_option_value("signcolumn", { win = win }),
                foldcolumn = vim.api.nvim_get_option_value("foldcolumn", { win = win }),
                cursorline = vim.api.nvim_get_option_value("cursorline", { win = win }),
                list = vim.api.nvim_get_option_value("list", { win = win }),
            }
        end

        local function restore_window_opts(win, opts)
            if not opts then return end
            for name, value in pairs(opts) do
                vim.api.nvim_set_option_value(name, value, { win = win })
            end
        end

        local function apply_window_opts(win)
            -- window-local niceties
            vim.api.nvim_set_option_value("number", false, { win = win })
            vim.api.nvim_set_option_value("relativenumber", false, { win = win })
            vim.api.nvim_set_option_value("signcolumn", "no", { win = win })
            vim.api.nvim_set_option_value("foldcolumn", "0", { win = win })
            vim.api.nvim_set_option_value("cursorline", false, { win = win })
            vim.api.nvim_set_option_value("list", false, { win = win })
            -- If you want the statusline hidden just for this window:
            -- vim.api.nvim_set_option_value("statusline", " ", { win = win })
        end

        local function create_dashboard()
            -- Create a fresh scratch buffer in the current window
            vim.cmd("enew")
            dash.buf = vim.api.nvim_get_current_buf()
            dash.win = vim.api.nvim_get_current_win()
            dash.prev_win_opts = capture_window_opts(dash.win)

            vim.bo[dash.buf].buftype = "nofile"
            vim.bo[dash.buf].bufhidden = "wipe"
            vim.bo[dash.buf].swapfile = false
            vim.bo[dash.buf].buflisted = false
            vim.bo[dash.buf].filetype = "starter"

            apply_window_opts(dash.win)
            set_buf_lines(dash.buf, centered_lines(ART, dash.win))

            -- Recenter on resize (only if our dashboard is still active)
            vim.api.nvim_create_autocmd("VimResized", {
                group = dash.aug,
                callback = function()
                    if not (dash.buf and vim.api.nvim_buf_is_valid(dash.buf)) then return end
                    if not (dash.win and vim.api.nvim_win_is_valid(dash.win)) then return end
                    if vim.api.nvim_get_current_buf() ~= dash.buf then return end
                    set_buf_lines(dash.buf, centered_lines(ART, dash.win))
                end,
            })

            -- If user opens a file into this window, let it replace the dashboard cleanly.
            -- (bufhidden=wipe already helps; this just avoids accidental edits.)
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
                group = dash.aug,
                callback = function(ev)
                    if ev.buf ~= dash.buf then return end
                    -- keep it locked down
                    vim.bo[ev.buf].modifiable = false
                end,
            })

            -- Restore window-local options as soon as we leave the dashboard buffer.
            -- Otherwise the window keeps e.g. `number=false` and Telescope inherits it.
            vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout" }, {
                group = dash.aug,
                buffer = dash.buf,
                callback = function()
                    if dash.win and vim.api.nvim_win_is_valid(dash.win) then
                        restore_window_opts(dash.win, dash.prev_win_opts)
                    end
                end,
            })
        end

        --------------------------------------------------------------------------
        -- Entry point
        --------------------------------------------------------------------------
        vim.api.nvim_create_autocmd("VimEnter", {
            group = dash.aug,
            callback = function()
                if is_plain_start() then
                    create_dashboard()
                end
            end,
        })
    end,
}
