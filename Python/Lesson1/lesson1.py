''' 
  Learning Python 3 
  Different usage samples
'''

import copy
import sys
import os

############################
# Functions
############################
def WelcomeMessage():
  print("Hello World from Python3!")
  print("Learning lessons from Y2023\nIt is time! :)")

def IsObject(a):
  return isinstance(a, object)

def Topic(a):
  print("-----------------------")
  print(a);
  print("-----------------------")

############################
# Main page of code
############################

WelcomeMessage()

iValue = 5
print(IsObject(iValue))
print(iValue)

# 

#strCustomerName = input("\nEnter your name and hit enter: ");

x = 320
y = 320
print(f'Xid = {id(x)}; Yid = {id(y)}')
print(x is y)
# Xid = 1754587687760; Yid = 1754587687856

x = 25
y = 24
print(f'Xid = {id(x)}; Yid = {id(y)}')
print(x is y)
# Xid = 140721606730896; Yid = 140721606730864

y += 1
print(f'Xid = {id(x)}; Yid = {id(y)}')
print(x is y)
# xid = 140721606730896; Yid = 140721606730896

x = 540
y = 539
y += 1
print(f'Xid = {id(x)}; Yid = {id(y)}')
print(x is y)
# Xid = 1754587686992; Yid = 1754587687408

# XOR usage sample

Topic("XOR Usage sample");

x = 16
z = ~x
print("z= ", z)
z = ~z
print("z= ", z)

