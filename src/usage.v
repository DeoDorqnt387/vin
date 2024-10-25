import cli { display_question, Question }

fn main() {
    questions := [
        Question{
            prompt: "What is your favorite lang?",
            choices: ["VLang", "GoLang", "Ruby", "Rust", "Python"]
        },
        Question{
            prompt: "Which game do you like most?",
            choices: ["Game 1", "Game 2", "Game 3"]
        }
    ]
    
    for q in questions {
        answer := display_question(q) or {
            println("Error: $err")
            return
        }
        println("You selected $answer")
    }
}
