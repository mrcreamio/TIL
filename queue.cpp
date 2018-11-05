#include <iostream>
using namespace std;
class DynIntQueue
{
private:
  struct QueueNode
  {
    int value;
    QueueNode *next;
  };
  QueueNode *front;
  QueueNode *rear;
  int numItems;
public:
  DynIntQueue( );
  ~DynIntQueue( );
  void enqueue(int);
  int dequeue( );
  bool isEmpty( );
  void clear( );
  void printQ();
};
DynIntQueue::DynIntQueue()
{
  front = NULL;
  rear = NULL;
  numItems = 0;
}
DynIntQueue::~DynIntQueue()
{
  clear();
}
void DynIntQueue::enqueue(int num)
{
  QueueNode * newNode;
  newNode = new QueueNode;
  newNode->value = num;
  int x = newNode->value;
  newNode->next = NULL;
  if (isEmpty()) {
    front = newNode;
    rear = newNode;
  }
  else
  {
    rear->next = newNode;
    rear = newNode;
  }
  numItems++;
}
int DynIntQueue::dequeue()
{
  QueueNode * temp;
  int num;
  if (isEmpty()) {
    std::cout << "the queue is empty" << '\n';
  }
  else
  {
    num = front->value;
    temp = front->next;
    if (front == rear) {
      rear = temp;
    }
    delete front;
    front = temp;
    numItems--;
  }
  return num;
}
bool DynIntQueue::isEmpty()
{
  if (numItems == 0) {
    return true;
  }
  return false;
}
void DynIntQueue::clear()
{
  while (!isEmpty()) {
    dequeue();
  }
}

int main()
{
  DynIntQueue Q1;
for (size_t i = 0; i < 5; i++) {
  Q1.enqueue(i);
  std::cout << "enqueed "<< i << '\n';
}
std::cout << "print the elements in queue" << '\n';
while (!Q1.isEmpty()) {
  int num = Q1.dequeue();
  std::cout << "num is "<<num << '\n';
}
  return 1;
}
