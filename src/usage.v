import vin { display_question, Question }

fn main() {
    questions := [
        Question{
            type: "list",
            prompt: "What is your favorite programming lang?",
            choices: ["VLang", "GoLang", "Ruby", "Rust", "Python"]
        },
        Question{
            type: "input",
            prompt: "Which game do you like most?",
        },
        Question{
            type: "confirm",
            prompt: "Confirm?",
        },
        Question{
            type: "password",
            prompt: "Your password!",
        },
    ]
    
    for q in questions {
        answer := display_question(q) or { panic(err) return }
        println("You selected ${answer}")
    }
}
