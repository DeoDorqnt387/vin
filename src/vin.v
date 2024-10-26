module vin

import os
import term
import readline { read_line }

const enter = 13
const up_arrow = 65
const down_arrow = 66

pub struct Question {
    pub:
    type string
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
        if q.type == "list"{
            println(q.prompt)
            for i, choice in q.choices {
                if i == selected_index {
                    println(term.bright_green('> ${choice}'))
                } else {
                    println('  ${choice}')
                }
            }
        
            match r.read_char()! {
                enter {
                    return q.choices[selected_index]
                }
                up_arrow {
                    if selected_index > 0 {
                        selected_index--
                    }
                }
                down_arrow {
                    if selected_index < q.choices.len - 1 {
                        selected_index++
                    }
                }
                else {}
            }
        } else if q.type == "input"{
            r.disable_raw_mode()
            term.show_cursor()

            input := os.input("${q.prompt}: ")
            return input
        } else if q.type == "confirm" {
            r.disable_raw_mode()
            term.show_cursor()

            mut input := os.input("${q.prompt}:(y/N) ")
            input = input.to_lower()
            println(input)
            if input != "y" && input != "n"{
                panic("Must be y or N.")
            }else{
                return input
            }
            
        } else if q.type == "password" {
            r.disable_raw_mode()
            term.show_cursor()

            input := os.input_password("${q.prompt}: ")!
            return input
        } else {
            panic("Unsupported question type: ${q.type}")
            return ""
        }
    } 

    return error("Exited loop")
}
