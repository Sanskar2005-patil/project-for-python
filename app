import tkinter as tk
from tkinter import messagebox
import random
import string

def generate_password():
    length = length_entry.get()
    
    if length == "":
        messagebox.showerror("Error", "Enter password length")
        return
        
    length = int(length)

    characters = ""
    
    if upper_var.get():
        characters += string.ascii_uppercase
    if lower_var.get():
        characters += string.ascii_lowercase
    if number_var.get():
        characters += string.digits
    if symbol_var.get():
        characters += string.punctuation
        
    if characters == "":
        messagebox.showerror("Error", "Select at least one option")
        return
        
    password = ''.join(random.choice(characters) for _ in range(length))
    result_var.set(password)

# Window
root = tk.Tk()
root.title("Password Generator")
root.geometry("400x450")
root.config(bg="#2c3e50")

# Title
title = tk.Label(root, text="Password Generator 🔐",
                 font=("Arial", 16, "bold"),
                 bg="#2c3e50",
                 fg="white")
title.pack(pady=15)

# Frame
frame = tk.Frame(root, bg="white", padx=20, pady=20)
frame.pack(padx=20, pady=10)

# Length
tk.Label(frame, text="Password Length").pack()
length_entry = tk.Entry(frame, width=30)
length_entry.pack(pady=5)

# Options
upper_var = tk.IntVar()
lower_var = tk.IntVar()
number_var = tk.IntVar()
symbol_var = tk.IntVar()

tk.Checkbutton(frame, text="Uppercase Letters", variable=upper_var).pack(anchor="w")
tk.Checkbutton(frame, text="Lowercase Letters", variable=lower_var).pack(anchor="w")
tk.Checkbutton(frame, text="Numbers", variable=number_var).pack(anchor="w")
tk.Checkbutton(frame, text="Symbols", variable=symbol_var).pack(anchor="w")

# Button
tk.Button(frame,
          text="Generate Password",
          command=generate_password,
          bg="#3498db",
          fg="white",
          width=20).pack(pady=15)

# Result
result_var = tk.StringVar()
tk.Entry(frame, textvariable=result_var, width=30).pack(pady=5)

# Run
root.mainloop()
