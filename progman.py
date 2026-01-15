
import tkinter as tk
from tkinter import messagebox
import subprocess
import os

PROGMAN_FILE = """[programs]
notepad = echo notepad; notepad.exe
calc = echo calc; calc.exe

[paint]
paint = echo paint; pbrush.exe
"""

class ProgManApp:
    def __init__(self, root):
        self.root = root
        self.root.title("ProgMan")
        self.root.configure(bg="black")
        self.root.geometry("640x480")

        self.menubar = tk.Menu(root, bg="black", fg="white", tearoff=0)
        self.root.config(menu=self.menubar)

        self.load_menus()

        self.label = tk.Label(
            root,
            text="Program Manager",
            fg="lime",
            bg="black",
            font=("Courier", 16)
        )
        self.label.pack(expand=True)

    def load_menus(self):
        if ""==PROGMAN_FILE:
            messagebox.showerror("Erro", "progman.dat não encontrado")
            return

        current_menu = None
        f=PROGMAN_FILE.split("\n")
        if 0==0:
            for line in f:
                line = line.strip()

                if not line:
                    continue

                # Novo menu
                if line.startswith("[") and line.endswith("]"):
                    menu_name = line[1:-1].strip()
                    current_menu = tk.Menu(
                        self.menubar,
                        bg="black",
                        fg="white",
                        tearoff=0
                    )
                    self.menubar.add_cascade(label=menu_name, menu=current_menu)
                    continue

                if "=" in line and current_menu:
                    text, commands = line.split("=", 1)
                    text = text.strip()
                    commands = commands.strip()

                    current_menu.add_command(
                        label=text,
                        command=lambda c=commands: self.execute_commands(c)
                    )

    def execute_commands(self, command_string):
        commands = [c.strip() for c in command_string.split(";") if c.strip()]

        for cmd in commands:
            try:
                subprocess.Popen(cmd, shell=True)
            except Exception as e:
                messagebox.showerror("Erro", str(e))


if __name__ == "__main__":
    root = tk.Tk()
    app = ProgManApp(root)
    root.mainloop()
