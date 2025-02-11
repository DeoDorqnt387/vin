<h1 align="center">
vin
</h1>

<h3 align="center">
A Simple Command Line Interface for V
</h3>

[![](https://github.com/user-attachments/assets/29adf541-9fc3-4679-af0f-ee0f941b404c)](https://github.com/user-attachments/assets/29adf541-9fc3-4679-af0f-ee0f941b404c)

# Installation
```bash
v install --git https://github.com/DeoDorqnt387/vin
```
or 
```bash
v install DeoDorqnt387.vin
```
# Example Usage
```V
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
            prompt: "Which game do you like the most?",
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

```
