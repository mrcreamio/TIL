#include<iostream>
using namespace std;

class stack
{
private:
  int *stackArray;
  int stackSize;
  int top;

public:
  stack(int size)
  {
    stackArray = new int[size];
    stackSize = size;
    top = -1;
  }
  bool isFull()
  {
    bool status;
    (top == stackSize -1 ? status = true: status = false);
    return status;
  }
  bool isEmpty()
  {
    bool status;
    (top == -1 ? status = true: status = false);
    return status;
  }
  void push(int num)
  {
    if (isFull()) {
      std::cout << "the stack is full" << '\n';
    }
    else{
      top++;
      stackArray[top] = num;
    }
  }
  void pop(int &num)
  {
    if (isEmpty()) {
      std::cout << "The stack is empty" << '\n';
    }
    else{
      num = stackArray[top];
      top--;
    }
  }

};
int main()
{
  stack intstack(5);
  int catchvar;
  for (int i = 0; i < 5; i++) {
    intstack.push(i);
  }
  for (int i = 0; i < 5; i++) {
    intstack.pop(catchvar);
    std::cout << "number "<<catchvar << '\n';
  }

}
