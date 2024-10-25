<h1 align="center">
vin
</h1>

<h3 align="center">
A Basic Command Line Interface for V
</h3>

[![](https://github.com/user-attachments/assets/0dccb22a-eea6-4b55-8e8c-927b30d05843)](https://github.com/user-attachments/assets/0dccb22a-eea6-4b55-8e8c-927b30d05843)

# Installation
```V
v install ?
```
# Example Usage
```V
import vin { display_question, Question }

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
```
