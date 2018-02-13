## Description  
You're in a building with *m* floors and you are given *n* eggs. What is the maximum number of attempts it will take to find out the floor that breaks the egg?

For convenience, here are a few rules to keep in mind:  

>   An egg that survives a fall can be used again.  
>   A broken egg must be discarded.  
>   The effect of a fall is the same for all eggs.  
>   If an egg breaks, then it would break if dropped from a higher floor.  
>  If an egg survives, then it would survive a shorter fall.  
## Solution  
> eggNumber -> Number of eggs at the moment  
> floorNumber -> Floor number at the moment  
> visitingFloor -> Floor being visited at the moment  
> attempts -> Minimum number of attempts it will take to find out from which floor egg will break  
> We store all the solutions in a 2D array. Where rows represents number of eggs and columns represent number of floors.

First, we set base cases:

- If there's only one egg, it takes as many attempts as number of floors  
- If there are two eggs and one floor, it takes one attempt    
```swift
for var floorNumber in (0..<(numberOfFloors+1)){
eggFloor[1][floorNumber] = floorNumber      //base case 1: if there's only one egg, it takes 'numberOfFloors' attempts
}

eggFloor[2][1] = 1 //base case 2: if there are two eggs and one floor, it takes one attempt  
```
When we drop an egg from a floor 'floorNumber', there can be two cases (1) The egg breaks (2) The egg doesn’t break.

- If the egg breaks after dropping from 'visitingFloorth' floor, then we only need to check for floors lower than 'visitingFloor' with remaining eggs; so the problem reduces to 'visitingFloor'-1 floors and 'eggNumber'-1 eggs.  
- If the egg doesn’t break after dropping from the 'visitingFloorth' floor, then we only need to check for floors higher than 'visitingFloor'; so the problem reduces to floors-'visitingFloor' floors and 'eggNumber' eggs.  
Since we need to minimize the number of trials in worst case, we take the maximum of two cases. We consider the max of above two cases for every floor and choose the floor which yields minimum number of trials.  
  
We find the answer based on the base cases and previously found answers as follows.  
 ``` swift
attempts = 1 + max(eggFloor[eggNumber-1][floors-1], eggFloor[eggNumber][floorNumber-floors])//we add one taking into account the attempt we're taking at the moment

if attempts < eggFloor[eggNumber][floorNumber]{ //finding the min
    eggFloor[eggNumber][floorNumber] = attempts;
}
```
