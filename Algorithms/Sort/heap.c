#include <stdio.h>

#define PARENT(i) i >> 1
#define RIGHT(i) i << 1 | 1
#define LEFT(i) i << 1
#define SWAP(A,i,j) A[i] ^= A[j], A[j] ^= A[i], A[i] ^= A[j]

inline void maxHeapify (int* A, unsigned int i, unsigned int heapSize){
    unsigned int left = LEFT(i), right = RIGHT(i), largest;
    if(left < heapSize && A[left] > A[i])
        largest = left;
    else
        largest = i;
    if(right < heapSize && A[right] > A[largest])
        largest = right;
    if(largest != i){
        SWAP(A, i, largest);
        maxHeapify(A, largest, heapSize);
    }
}

inline void buildMaxHeap(int* A, unsigned int length){
    for(unsigned int i = length/2 - 1; i >= 0; i--)
        maxHeapify(A, i, length);
}

void heapSort(int* A, unsigned int length){
    buildMaxHeap(A, length);
    for (unsigned int i = length - 1; i > 0; i--){
        SWAP(A, i, 0);
        maxHeapify(A, 0, i);
    }
}


int main(int argc, char const *argv[]){
    int A[50];
    heapSort(A, sizeof(A)/sizeof(int));
    for (int i = 0; i < 28; ++i)
        printf("%i ", A[i]);
    int i;
    scanf("%i", i);
    return 0;
}