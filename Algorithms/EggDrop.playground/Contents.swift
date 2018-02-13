//: Playground - noun: a place where people can play
func maxOf(_ one:Int,_ two:Int)->Int{
    return one>two ? one:two
}
func eggDrop(numberOfEggs:Int,numberOfFloors:Int) -> Int{
    if numberOfEggs == 0 || numberOfFloors == 0 {
        return 0
    }
    if numberOfEggs == 1 || numberOfFloors == 1 {
        return numberOfFloors
    }
    //else case is numberOfEggs>=2 && numberOfFloors>=2
    //we need to find out upon selection of which floor it takes minimum numberOfAttempts and that minimum number.
    var eggFloorArray = Array(repeatElement(Array(repeatElement(0, count: numberOfFloors+1)), count: numberOfEggs+1))
    for eggsIndex in 0...numberOfEggs{
        for floorIndex in 0...numberOfFloors{
            if eggsIndex == 0 || floorIndex == 0 {
                eggFloorArray[eggsIndex][floorIndex] = 0
            }
            else if eggsIndex == 1 || floorIndex == 1 {
                eggFloorArray[eggsIndex][floorIndex] = floorIndex
            }
        }
    }
    for eggsIndex in 2...numberOfEggs{
        for floorIndex in 2...numberOfFloors{
            eggFloorArray[eggsIndex][floorIndex] = Int.max
            for currentFloor in 1...floorIndex{
                let attempts = 1 + maxOf(eggFloorArray[eggsIndex-1][currentFloor-1], eggFloorArray[eggsIndex][floorIndex-currentFloor])
                if attempts<eggFloorArray[eggsIndex][floorIndex]{
                    eggFloorArray[eggsIndex][floorIndex] = attempts
                }
            }
        }
    }
    return eggFloorArray[numberOfEggs][numberOfFloors]
}

//testing eggdrop efficient
eggDrop(numberOfEggs: 2, numberOfFloors: 7)
eggDrop(numberOfEggs: 3, numberOfFloors: 8)
eggDrop(numberOfEggs: 4, numberOfFloors: 6)
eggDrop(numberOfEggs: 5, numberOfFloors: 25)
eggDrop(numberOfEggs: 4, numberOfFloors: 5)

