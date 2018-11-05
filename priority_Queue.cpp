#include<iostream>
using namespace std;
struct QueueNode{
  int priority;
  int value;
  QueueNode * next;
};
class priority_Q
{
private:
  QueueNode * front;
  int numItems;
public:
  priority_Q();
  ~priority_Q();
  void enqueue(int num, int priority);
  int dequeue();
  bool isEmpty();
  void clear();
};

priority_Q::priority_Q(){
  front = NULL;
  numItems = 0;
}
priority_Q::~priority_Q()
{
  clear();
}
bool priority_Q::isEmpty()
{
  if (front == NULL) {
    return true;
  }
  return false;
}
void priority_Q::clear() {
  QueueNode * temp;
  while (!isEmpty()) {
    dequeue();
  }
}
void priority_Q::enqueue(int num, int priority) {
  QueueNode * newNode, * temp;
  newNode = new QueueNode;
  newNode->value = num;
  newNode->priority = priority;
  if (isEmpty() || priority < front->priority) {
    newNode->next = front;
    front = newNode;
  }
  else
  {
    temp = front;
    while (temp->next != NULL && temp->next->priority <=priority) {
      temp = temp-> next;
    }
    newNode->next = temp->next;
    temp->next = newNode;
  }
}

int priority_Q::dequeue()
{
  QueueNode *temp;
  if (isEmpty()) {
    std::cout << "Queue is Empty" << '\n';
  }
  else
  {
    temp = front;
    int num = front->value;
    front = front->next;
    delete temp;
    return num;
  }
}
int main(int argc, char const *argv[]) {

  priority_Q Q1;
  Q1.enqueue(2, 10);
  Q1.enqueue(3, 2);
  Q1.enqueue(4, 6);
  Q1.enqueue(5, 12);
  Q1.enqueue(6, 1);
std::cout << "print the elements in queue" << '\n';
while (!Q1.isEmpty()) {
  int num = Q1.dequeue();
  std::cout << "num is "<<num << '\n';
}
  return 0;
}
