// Exercise 3.1 :Create a memoize function that remembers previous inputs and stores them in cache so that it won’t
//  have to compute the same inputs more than once. The function will take an unspecified number of integer inputs and a reducer method.


const add = (n) => (n + 10);
console.log('Simple call', add(4));

const memoize = (fn) => {
  let cache = {};
  return (...args) => {
    let n = args[0]; 
    if (n in cache) {
      console.log('Fetching from cache');
      return cache[n];
    }
    else {
      console.log('Calculating result');
      let result = fn(n);
      cache[n] = result;
      return result;
    }
  }
}

const memoizedAdd = memoize(add);
console.log(memoizedAdd(4));  // calculated
console.log(memoizedAdd(100));  // cached
console.log(memoizedAdd(11));  // calculated
console.log(memoizedAdd(100));  // cached


// Exercise 3.2

// Create 3 simple functions where call, bind and apply are used. The intention of this exercise is to understand how they work and their differences.

// Using call:

function add(a, b) {
  return a + b;
}

let result1 = add.call(null, 3, 5);
console.log(result1);  // 7


// Using bind:

function multiply(a, b) {
  return a * b;
}

let multiplyByTwo = multiply.bind(null, 2);
let result2 = multiplyByTwo(4);
console.log(result2);  // 8


// Using apply:

function divide(a, b) {
  return a / b;
}

let output = divide.apply(null, [10, 2]);
console.log(output);  // 3



// Exercise  3

// What is the output of the below problem and why ?

function createIncrement() {
  let count = 0;
  function increment() {
    count++;
  }
  let message = `Count is ${count}`;
  function log() {
    console.log(message);
  }

  return [increment, log];
}

const [increment, log] = createIncrement();
increment();
increment();
increment();
log();

// In the code, createIncrement function returns
//  an array containing two functions increment and log. When the increment 
//  function is called,
//  it increments the count variable but it's a local variable
//  and its value is not shared between different invocations of the createIncrement 
//  function. So, every time createIncrement is called, it creates a new count variable 
//  with the initial value of 0.

// When the log function is called, it logs a message to the console, which contains the
//  current value of count, but since count is a local variable in createIncrement and has not
//   been updated yet, the message will always be Count is 0.


// Exercise 4

// Refactor the above stack implementation, using the concept of closure, 
// such that there is noway to access items array outside of createStack() function scope

// function createStack() {
//     return {
//         items: [],
//         push(item) {
//             this.items.push(item);
//         },
//         pop() {
//             return this.items.pop()
//         }
//     }
// }

// const stack = createStack();
// stack.push(10);
// stack.push(5);
// stack.pop();
// stack.items;
// stack.items = [10,100,100]

function createStack() {
    let items = [];
    return {
        push(item) {
            items.push(item);
        },
        pop() {
            return items.pop();
        }
    };
}

const stack = createStack();
stack.push(10);
stack.push(5);
stack.pop(); // => 5
stack.items; // => undefined, the items array is not accessible outside of the createStack function scope

// By declaring the items array within the createStack function scope, it becomes a private variable and cannot be accessed directly from outside the function.
//  This protects the encapsulation .




