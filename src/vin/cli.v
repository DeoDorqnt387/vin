module cli

import term
import readline { read_line }

pub struct Question {
    pub:
    prompt string
    choices []string
}

pub fn display_question(q Question) !string {
    mut selected_index := 0
    term.clear()
    
    mut r := readline.Readline{}
    r.enable_raw_mode()
    defer {
        r.disable_raw_mode()
        term.show_cursor()
    }
    term.hide_cursor()

    for {
        term.set_cursor_position(x: 0, y: 0)
        println(q.prompt)
        for i, choice in q.choices {
            if i == selected_index {
                println(term.bright_green('> ${choice}'))
            } else {
                println('  ${choice}')
            }
        }


        mut input := []u8{len: 3}
        input[0] = u8(r.read_char()!) 
        if input[0] == `\e` {
            input[1] = u8(r.read_char()!) 
            input[2] = u8(r.read_char()!)
        } else if input[0] == `\r` {
            return q.choices[selected_index]
        } else if input[0] == `\e` {
            return error("Escaped")
        }

        match input.bytestr() {
            '\e' { // ESC key
                return error("Escaped")
            }
            '\r' { // Enter key
                return q.choices[selected_index]
            }
            '\x1b[A' { // Up arrow key
                if selected_index > 0 {
                    selected_index--
                }
            }
            '\x1b[B' { // Down arrow key
                if selected_index < q.choices.len - 1 {
                    selected_index++
                }
            }
            else {}
        }
    }
    return error("Exited loop")
}

