import tkinter as tk
import time

root = tk.Tk()
root.attributes('-fullscreen', True)
root.configure(bg='black')
label = tk.Label(root, font=('Courier', 80), fg='cyan', bg='black')
label.pack(expand=True)

def update():
    label.config(text=time.strftime('%H:%M:%S'))
    root.after(1000, update)

update()
root.mainloop()
