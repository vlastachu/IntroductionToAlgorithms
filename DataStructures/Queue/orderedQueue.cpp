#include <stdio.h>
#include <vector>
#define PARENT(i) i >> 1
#define RIGHT(i) i << 1 | 1
#define LEFT(i) i << 1
#define SWAP(A,i,j) A[i] ^= A[j], A[j] ^= A[i], A[i] ^= A[j]



template <class T>
class orderedQueue{
private:
    typedef std::vector<std::pair<int,T> > array;
    array A;
    inline void maxHeapify (unsigned int i, unsigned int heapSize){
        unsigned int left = LEFT(i), right = RIGHT(i), largest;
        if(left < heapSize && A[left].first > A[i].first)
            largest = left;
        else
            largest = i;
        if(right < heapSize && A[right].first > A[largest].first)
            largest = right;
        if(largest != i){
            SWAP(A, i, largest);
            maxHeapify(largest, heapSize);
        }
    }

    inline void buildMaxHeap(){
        for(int i = A.size()/2 - 1; i >= 0; i--)
            maxHeapify(i, A.size());
    }

    void heapSort(unsigned int size){
        buildMaxHeap(A, size);
        for (unsigned int i = size - 1; i > 0; i--){
            SWAP(A, i, 0);
            maxHeapify(0, i);
        }
    }
public:
    orderedQueue(){}
    ~orderedQueue(){}
    T maximum(){
        return A[0].second;
    }
    T extractMax(){
        if(A.size() < 1){
            printf("error: empty queue\n");
            return 0;
        }
        T max = A[0];
        A[0] = A.back();
        A.pop_back();
        maxHeapify(1,A.size());
        return max;
    }
    int increaseKey(int i, int key){
        if(key < A[i].first){
            printf("wrong key\n");
            return 0;
        }
        A[i].first = key;
        while(i > 0 && A[PARENT(i)] < A[i]){
            SWAP(A, i, PARENT(i));
            i = PARENT(i);
        }
        return 1;
    }
    orderedQueue insert(int key, T value){
        A.push_back(std::pair<int, T>(-(1<<17),value));
        increaseKey(A.size(), key);
    }
};


int main(int argc, char const *argv[]){
    //TODO: make it work
    return 0;
}